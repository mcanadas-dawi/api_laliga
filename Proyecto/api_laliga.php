<?php
header("Content-Type: application/json");
include_once 'laligadatabase.php';
include_once 'seguridad.php';
require 'C:/Users/Marc/OneDrive/FP/Segundo/Servidor/Proyecto/vendor/autoload.php';
$database = new Database();
$db = $database->getConnection();
// HTTP Y URI
$method = $_SERVER['REQUEST_METHOD'];
$uri = explode("/", trim($_SERVER['REQUEST_URI'], "/"));
$resource = $uri[2] ?? '';
switch ($method) {
    case 'GET': //TODOS LOS GET

        if ($resource === 'equipos') { // GET EQUIPOS
            $sql = "SELECT * FROM equipos";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $equipos = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($equipos);
        } else if (strpos($resource, 'equipos') !== false) { // GET DETALLES DE UN EQUIPO
            $id = $_GET['id'] ?? null;
            $sql = "SELECT * FROM equipos WHERE id = :id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":equipo_id", $id);
            $stmt->execute();
            $equipo = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode($equipo);
        } else if ($resource  === 'jugadores') { // GET JUGADORES
            $sql = "SELECT * FROM jugadores";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $jugadores = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($jugadores);
        } else if (strpos($resource, 'jugadores') !== false) { // GET DETALLES DE UN JUGADOR O JUGADORES DE UN EQUIPO
            if (isset($_GET['equipo_id'])) { // GET JUGADORES DE UN EQUIPO
                $equipo_id = $_GET['equipo_id'] ?? null;
                $sql = "SELECT equipos.nombre AS nombre_equipo, jugadores.* 
                        FROM jugadores
                        JOIN equipos ON jugadores.equipo_id = equipos.id
                        WHERE jugadores.equipo_id = :equipo_id; ";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":equipo_id", $equipo_id);
                $stmt->execute();
                $jugadores = $stmt->fetchAll(PDO::FETCH_ASSOC);
                echo json_encode($jugadores);
            } else { // GET DETALLES DE UN JUGADOR
                $id = $_GET['id'] ?? null;
                $sql = "SELECT * FROM jugadores WHERE id = :id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":equipo_id", $id);
                $stmt->execute();
                $jugador = $stmt->fetch(PDO::FETCH_ASSOC);
                echo json_encode($jugador);
            }
        } else if ($resource  === 'partidos') { // GET PARTIDOS
            $sql = "SELECT * FROM partidos";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $jugadores = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($jugadores);
        } else if (strpos($resource, 'partidos') !== false) { // GET DETALLES DE UN PARTIDO
            $id = $_GET['id'] ?? null;
            $sql = "SELECT * FROM partidos WHERE id = :id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":id", $id);
            $stmt->execute();
            $partido = $stmt->fetch(PDO::FETCH_ASSOC);
            echo json_encode($partido);
        } else if ($resource  === 'clasificacion') { // GET CLASIFICACION
            $sql = "SELECT ROW_NUMBER() OVER (ORDER BY puntos DESC) 
                    AS posicion,equipos.nombre
                    AS equipo, estadisticas.puntos, estadisticas.victorias,estadisticas.empates,estadisticas.derrotas,estadisticas.goles_favor,estadisticas.goles_contra
                    FROM estadisticas
                    JOIN equipos ON estadisticas.equipo_id = equipos.id
                    ORDER BY puntos DESC, goles_favor - goles_contra DESC";
            $stmt = $db->prepare($sql);
            $stmt->execute();
            $clasificacion = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($clasificacion);
        } else if ($resource  === 'pichichi') { // 10 MAX GOLEADORES
            $sql = "SELECT jugadores.nombre AS nombre_jugador,jugadores.goles,equipos.nombre AS nombre_equipo
                    FROM jugadores
                    JOIN equipos ON jugadores.equipo_id = equipos.id
                    ORDER BY jugadores.goles DESC
                    LIMIT 10;";

            $stmt = $db->prepare($sql);
            $stmt->execute();
            $pichichi = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($pichichi);
        } else if ($resource  === 'maxasistente') { // 10 MAX ASISTENTES
            $sql = "SELECT jugadores.nombre AS nombre_jugador,jugadores.asistencias,equipos.nombre AS nombre_equipo
                        FROM jugadores
                        JOIN equipos ON jugadores.equipo_id = equipos.id
                        ORDER BY jugadores.asistencias DESC
                        LIMIT 10;";

            $stmt = $db->prepare($sql);
            $stmt->execute();
            $maxasistente = $stmt->fetchAll(PDO::FETCH_ASSOC);
            echo json_encode($maxasistente);
        } else {
            echo json_encode(["message" => "Recurso no encontrado"]);
        }
        break;

    case 'POST': //TODOS LOS POST
        if ($resource  === 'partidos') { // INSERT PARTIDOS
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "INSERT INTO partidos (equipo_local, equipo_visitante, goles_local, goles_visitante, fecha) VALUES (:equipo_local, :equipo_visitante, :goles_local, :goles_visitante, :fecha)";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":equipo_local", $data['equipo_local']);
            $stmt->bindParam(":equipo_visitante", $data['equipo_visitante']);
            $stmt->bindParam(":goles_local", $data['goles_local']);
            $stmt->bindParam(":goles_visitante", $data['goles_visitante']);
            $stmt->bindParam(":fecha", $data['fecha']);
            // ACTUALIZAR ESTADISTICAS
            if ($stmt->execute()) {
                $goles_local = $data['goles_local'];
                $goles_visitante = $data['goles_visitante'];
                $equipo_local = $data['equipo_local'];
                $equipo_visitante = $data['equipo_visitante'];

                // Incrementar partidos jugados y goles para cada equipo
                $db->query("UPDATE estadisticas 
                            SET partidos_jugados = partidos_jugados + 1,
                                goles_favor = goles_favor + $goles_local,
                                goles_contra = goles_contra + $goles_visitante
                            WHERE equipo_id = $equipo_local");

                $db->query("UPDATE estadisticas 
                            SET partidos_jugados = partidos_jugados + 1,
                                goles_favor = goles_favor + $goles_visitante,
                                goles_contra = goles_contra + $goles_local
                            WHERE equipo_id = $equipo_visitante");

                // Actualizar estadísticas y puntos según el resultado para cada equipo
                if ($goles_local > $goles_visitante) {
                    // Victoria para el equipo local
                    $db->query("UPDATE estadisticas SET victorias = victorias + 1, puntos = puntos + 3 WHERE equipo_id = $equipo_local");

                    // Derrota para el equipo visitante
                    $db->query("UPDATE estadisticas SET derrotas = derrotas + 1 WHERE equipo_id = $equipo_visitante");
                } else if ($goles_local < $goles_visitante) {
                    // Derrota para el equipo local
                    $db->query("UPDATE estadisticas SET derrotas = derrotas + 1 WHERE equipo_id = $equipo_local");

                    // Victoria para el equipo visitante
                    $db->query("UPDATE estadisticas SET victorias = victorias + 1, puntos = puntos + 3 WHERE equipo_id = $equipo_visitante");
                } else {
                    // Empate para ambos equipos
                    $db->query("UPDATE estadisticas SET empates = empates + 1, puntos = puntos + 1 WHERE equipo_id = $equipo_local");
                    $db->query("UPDATE estadisticas SET empates = empates + 1, puntos = puntos + 1 WHERE equipo_id = $equipo_visitante");
                }

                echo json_encode(["message" => "Partido registrado y estadísticas actualizadas con éxito."]);
            } else {
                echo json_encode(["message" => "Error al registrar el partido"]);
            }
        } else if ($resource  === 'equipos') { // INSERT EQUIPOS
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "INSERT INTO equipos (nombre, ciudad, estadio, capacidad, entrenador,fundacion) VALUES (:nombre, :ciudad, :estadio, :capacidad, :entrenador, :fundacion)";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":nombre", $data['nombre']);
            $stmt->bindParam(":ciudad", $data['ciudad']);
            $stmt->bindParam(":estadio", $data['estadio']);
            $stmt->bindParam(":capacidad", $data['capacidad']);
            $stmt->bindParam(":entrenador", $data['entrenador']);
            $stmt->bindParam(":fundacion", $data['fundacion']);
            if ($stmt->execute()) {
                echo json_encode(["message" => "Equipo registrado con éxito"]);
            } else {
                echo json_encode(["message" => "Error al registrar el equipo"]);
            }
        } else if ($resource  === 'jugadores') { // INSERT JUGADORES
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "INSERT INTO jugadores (nombre, equipo_id, posicion, numero, nacionalidad, goles, asistencias, tarjetas_amarillas, tarjetas_rojas, minutos_jugados) VALUES (:nombre, :equipo_id , :posicion, :numero, :nacionalidad, :goles, :asistencias, :tarjetas_amarillas, :tarjetas_rojas, :minutos_jugados)";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":nombre", $data['nombre']);
            $stmt->bindParam(":equipo_id", $data['equipo_id']);
            $stmt->bindParam(":posicion", $data['posicion']);
            $stmt->bindParam(":numero", $data['numero']);
            $stmt->bindParam(":nacionalidad", $data['nacionalidad']);
            $stmt->bindParam(":goles", $data['goles']);
            $stmt->bindParam(":asistencias", $data['asistencias']);
            $stmt->bindParam(":tarjetas_amarillas", $data['tarjetas_amarillas']);
            $stmt->bindParam(":tarjetas_rojas", $data['tarjetas_rojas']);
            $stmt->bindParam(":minutos_jugados", $data['minutos_jugados']);
            if ($stmt->execute()) {
                echo json_encode(["message" => "Jugador registrado con éxito"]);
            } else {
                echo json_encode(["message" => "Error al registrar el jugador"]);
            }
        } else {
            echo json_encode(["message" => "Recurso no encontrado"]);
        }
        break;
    case 'PUT': //TODOS LOS PUT
        // ACTUALIZAR POSICION JUGADORES
        if ($resource  === 'jugadores') {
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "UPDATE jugadores SET  posicion = :posicion WHERE id = :id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":posicion", $data['posicion']);
            $stmt->bindParam(":id", $data['id']);
            if ($stmt->execute()) {
                echo json_encode(["message" => "Posicion del jugador actualizada con éxito"]);
            } else {
                echo json_encode(["message" => "Error al actualizar la posicion del jugador"]);
            }
        } else if ($resource  === 'estadio') { // ACTUALIZAR ESTADIO Y CAPACIDAD EQUIPO
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "UPDATE equipos SET  estadio = :estadio, capacidad = :capacidad WHERE id = :id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":estadio", $data['estadio']);
            $stmt->bindParam(":capacidad", $data['capacidad']);
            $stmt->bindParam(":id", $data['id']);
            if ($stmt->execute()) {
                echo json_encode(["message" => "Estadio y capacidad actualizado con éxito"]);
            } else {
                echo json_encode(["message" => "Error al actualizar el estadio y la capacidad"]);
            }
        } else if ($resource  === 'entrenador') { // ACTUALIZAR ENTRENADOR EQUIPO
            $data = json_decode(file_get_contents("php://input"), true);
            $sql = "UPDATE equipos SET  entrenador = :entrenador WHERE id = :id";
            $stmt = $db->prepare($sql);
            $stmt->bindParam(":entrenador", $data['entrenador']);
            $stmt->bindParam(":id", $data['id']);
            if ($stmt->execute()) {
                echo json_encode(["message" => "Entrenador actualizado con éxito"]);
            } else {
                echo json_encode(["message" => "Error al actualizar el entrenador"]);
            }
        } else {
            echo json_encode(["message" => "Recurso no encontrado"]);
        }

        break;
    case 'DELETE': //TODOS LOS DELETE
        // ELIMINAR PARTIDOS
        if (strpos($resource, 'partidos') !== false) { //RESOURCE CONTIENE PARTIDOS
            $id = $_GET['id'] ?? null;
            if ($id) {
                // Obtener detalles del partido antes de eliminarlo
                $sql = "SELECT * FROM partidos WHERE id = :id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":id", $id);
                $stmt->execute();
                $partido = $stmt->fetch(PDO::FETCH_ASSOC);

                if ($partido) {
                    // Eliminar el partido
                    $sql = "DELETE FROM partidos WHERE id = :id";
                    $stmt = $db->prepare($sql);
                    $stmt->bindParam(":id", $id);
                    if ($stmt->execute()) {
                        // Actualizar estadísticas
                        $goles_local = $partido['goles_local'];
                        $goles_visitante = $partido['goles_visitante'];
                        $equipo_local = $partido['equipo_local'];
                        $equipo_visitante = $partido['equipo_visitante'];

                        // Decrementar partidos jugados y goles para cada equipo
                        $db->query("UPDATE estadisticas 
                                        SET partidos_jugados = partidos_jugados - 1,
                                            goles_favor = goles_favor - $goles_local,
                                            goles_contra = goles_contra - $goles_visitante
                                        WHERE equipo_id = $equipo_local");

                        $db->query("UPDATE estadisticas 
                                        SET partidos_jugados = partidos_jugados - 1,
                                            goles_favor = goles_favor - $goles_visitante,
                                            goles_contra = goles_contra - $goles_local
                                        WHERE equipo_id = $equipo_visitante");

                        // Actualizar estadísticas y puntos según el resultado para cada equipo
                        if ($goles_local > $goles_visitante) {
                            // Victoria para el equipo local
                            $db->query("UPDATE estadisticas SET victorias = victorias - 1, puntos = puntos - 3 WHERE equipo_id = $equipo_local");

                            // Derrota para el equipo visitante
                            $db->query("UPDATE estadisticas SET derrotas = derrotas - 1 WHERE equipo_id = $equipo_visitante");
                        } else if ($goles_local < $goles_visitante) {
                            // Derrota para el equipo local
                            $db->query("UPDATE estadisticas SET derrotas = derrotas - 1 WHERE equipo_id = $equipo_local");

                            // Victoria para el equipo visitante
                            $db->query("UPDATE estadisticas SET victorias = victorias - 1, puntos = puntos - 3 WHERE equipo_id = $equipo_visitante");
                        } else {
                            // Empate para ambos equipos
                            $db->query("UPDATE estadisticas SET empates = empates - 1, puntos = puntos - 1 WHERE equipo_id = $equipo_local");
                            $db->query("UPDATE estadisticas SET empates = empates - 1, puntos = puntos - 1 WHERE equipo_id = $equipo_visitante");
                        }

                        echo json_encode(["message" => "Partido y estadísticas eliminados con éxito"]);
                    } else {
                        echo json_encode(["message" => "Error al eliminar el partido"]);
                    }
                } else {
                    echo json_encode(["message" => "Partido no encontrado"]);
                }
            } else {
                echo json_encode(["message" => "ID del partido no proporcionado"]);
            }
            // ELIMINAR JUGADORES
        } else if (strpos($resource, 'jugadores') !== false) { //RESOURCE CONTIENE JUGADORES
            $id = $_GET['id'] ?? null;
            if ($id) { //ELIMINAR JUGADOR
                $sql = "DELETE FROM jugadores WHERE id = :id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":id", $id);
                if ($stmt->execute()) {
                    echo json_encode(["message" => "Jugador eliminado con éxito"]);
                } else {
                    echo json_encode(["message" => "Error al eliminar el jugador"]);
                }
            } else {
                echo json_encode(["message" => "ID del jugador no proporcionado"]);
            }
            //ELIMINAR EQUIPOS Y SUS JUGADORES
        } else if (strpos($resource, 'equipos') !== false) { //RESOURCE CONTIENE EQUIPOS
            $id = $_GET['equipo_id'] ?? null;
            if ($id) {
                // Eliminar jugadores del equipo
                $sql = "DELETE FROM jugadores WHERE equipo_id = :equipo_id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":equipo_id", $id);  // Corregido

                if ($stmt->execute()) {
                    echo json_encode(["message" => "Jugadores eliminados con éxito"]);
                } else {
                    echo json_encode(["message" => "Error al eliminar los jugadores"]);
                }

                // Eliminar equipo de la tabla estadisticas
                $sql = "DELETE FROM estadisticas WHERE equipo_id = :equipo_id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":equipo_id", $id);  // Corregido

                if ($stmt->execute()) {
                    echo json_encode(["message" => "Estadísticas eliminadas con éxito"]);
                } else {
                    echo json_encode(["message" => "Error al eliminar las estadísticas"]);
                }

                // Eliminar equipo
                $sql = "DELETE FROM equipos WHERE id = :equipo_id";
                $stmt = $db->prepare($sql);
                $stmt->bindParam(":equipo_id", $id);  // Corregido

                if ($stmt->execute()) {
                    echo json_encode(["message" => "Equipo eliminado con éxito"]);
                } else {
                    echo json_encode(["message" => "Error al eliminar el equipo"]);
                }
            } else {
                echo json_encode(["message" => "ID del equipo no proporcionado"]);
            }
        } else {
            echo json_encode(["message" => "Recurso no encontrado"]);
        }
        break;

    default:
        echo json_encode(["message" => "Método no soportado"]);
        break;
}
