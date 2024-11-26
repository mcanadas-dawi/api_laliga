# DOCUMENTACION api_laliga

## 1. ENUNCIADO
Proyecto: Desarrollo de una API para la Gestión de "La Liga"

Objetivo:
Desarrollar una API en PHP para gestionar las operaciones principales de "La Liga", permitiendo la administración de equipos, jugadores, partidos y 
estadísticas de temporada. La API debe satisfacer las necesidades operacionales, tales como mantener información detallada sobre los equipos y jugadores, 
gestionar el calendario de partidos y brindar acceso a estadísticas de rendimiento y clasificación.

Requisitos Funcionales:

### 1. Definición de Endpoints:
- La API debe soportar operaciones CRUD (Crear, Leer, Actualizar y Borrar) para equipos, jugadores, partidos y estadísticas.
- Los endpoints deben estar asociados a métodos HTTP (GET, POST, PUT, DELETE) y contar con ejemplos en JSON tanto de las solicitudes como de las respuestas.


### 2. Base de Datos:
- Diseñar un esquema relacional con tablas para equipos, jugadores, partidos y estadísticas de temporada.
- Establecer relaciones entre las tablas, como la asociación de jugadores a equipos y de partidos a equipos.

### 3. Lógica de Negocio:
- Implementar la lógica para gestionar partidos y actualizar estadísticas mediante diagramas de flujo.
- Describir el flujo para el registro de un partido, desde la verificación de los equipos participantes hasta la actualización de estadísticas y posiciones en la tabla.
- Describir el control de estadísticas de jugadores (goles, tarjetas, asistencias) y los criterios de clasificación de la liga.

### 4. Seguridad:
- Implementar autenticación y autorización para garantizar el acceso seguro a los endpoints.
- Realizar un análisis previo sobre el enfoque de seguridad más adecuado.

### Implementación de Endpoints:

#### 1. Obtener el listado de:
- Todos los equipos
- Todos los jugadores 
- Detalles de un jugador
- Jugadores de un equipo
- Todos los partidos
- Partido específico
- Clasificación
- Top 10 goleadores
- Top 10 asistentes
  
 #### 2. Registrar:
- Partidos
- Equipos
- Jugadores

#### 3. Actualizar la información sobre:
- Posicion del jugador
- Estadio y su capacidad de un equipo
- Entrenador de equipo

#### 4. Borrar:
- Equipo
- Jugador
- Partido

### Documentación:

#### 1. Referencia de Endpoints:
- Detalle completo de cada endpoint disponible en la API, incluyendo el método HTTP, URL, parámetros de entrada y ejemplos de respuestas.

#### 2. Ejemplos en formato JSON:
- Muestras de cómo realizar solicitudes y respuestas esperadas.

#### 3. Casos de Uso:
- Ejemplos prácticos sobre cómo usar la API en escenarios como la creación de un nuevo partido, consulta de estadísticas de jugadores o actualización de 
  información de equipos.

## 2. DEFINICION DE ENDPOINTS

### /equipos

**GET** - MOSTRAR TODOS LOS EQUIPOS:
- **URL**: http://localhost/Proyecto/api_laliga.php/equipos
- **RESPUESTA**:
  ![RespuestaGet1](Proyecto/Imagenes/basededatos.png)

**POST** - INSERTAR NUEVOS EQUIPOS:
- **URL**: http://localhost/Proyecto/api_laliga.php/equipos
- **JSON**:
    ```json
    {
        "nombre": "Equipo Nuevo",
        "ciudad": "Ciudad Ejemplo",
        "estadio": "Estadio Ejemplo",
        "capacidad": 50000,
        "entrenador": "Entrenador Ejemplo",
        "fundacion": 2024
    }
    ```
- **RESPUESTA**:
  ![RespuestaPost1](Proyecto/Imagenes/basededatos.png)
    
    

**DELETE** - BORRAR EQUIPO:
- **URL**: http://localhost/Proyecto/api_laliga.php/equipos?equipo_id=22
- **RESPUESTA**:
  ![RespuestaDelete1](Proyecto/Imagenes/basededatos.png)


### /jugadores

**GET** - MOSTRAR TODOS LOS JUGADORES:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores

**GET** - MOSTRAR DETALLES DE UN JUGADOR:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores?id=2

**GET** - MOSTRAR JUGADORES DE UN EQUIPO:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores?equipo_id=2

**POST** - INSERTAR JUGADORES:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores
- **JSON**:
    ```json
    {
        "nombre": "Jugador Ejemplo",
        "posicion": "Delantero",
        "equipo_id": 1,
        "numero": 9,
        "nacionalidad": "Española",
        "goles": 0,
        "asistencias": 0,
        "tarjetas_amarillas": 0,
        "tarjetas_rojas": 0,
        "minutos_jugados": 0
    }
    ```

**PUT** - CAMBIAR POSICIÓN JUGADOR:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores
- **JSON**:
    ```json
    {
        "id": 2,
        "posicion": "Defensa" 
    }
    ```
    *_La posicion es un ENUM: Portero, Defensa, Centrocampista, Delantero_*

**DELETE** - BORRAR JUGADOR:
- **URL**: http://localhost/Proyecto/api_laliga.php/jugadores?id=401

### /partidos

**GET** - MOSTRAR TODOS LOS PARTIDOS:
- **URL**: http://localhost/Proyecto/api_laliga.php/partidos

**GET** - MOSTRAR UN PARTIDO ESPECÍFICO:
- **URL**: http://localhost/Proyecto/api_laliga.php/partidos?id=5

**POST** - INSERTAR PARTIDOS:
- **URL**: http://localhost/Proyecto/api_laliga.php/partidos
- **JSON**:
    ```json
    {
        "equipo_local": 1,
        "equipo_visitante": 2,
        "goles_local": 3,
        "goles_visitante": 1,
        "fecha": "2024-05-15"
    }
    ```

**DELETE** - BORRAR PARTIDO:
- **URL**: http://localhost/Proyecto/api_laliga.php/partidos?id=6

### /clasificacion

**GET** - MOSTRAR CLASIFICACIÓN:
- **URL**: http://localhost/Proyecto/api_laliga.php/clasificacion

### /pichichi

**GET** - MOSTRAR TOP 10 GOLEADORES:
- **URL**: http://localhost/Proyecto/api_laliga.php/pichichi

### /maxasistente

**GET** - MOSTRAR TOP 10 ASISTENTES:
- **URL**: http://localhost/Proyecto/api_laliga.php/maxasistente

### /estadio

**PUT** - CAMBIAR ESTADIO y CAPACIDAD DE UN EQUIPO:
- **URL**: http://localhost/Proyecto/api_laliga.php/estadio
- **JSON**:
    ```json
    {
        "estadio": "Santiago Bernabeu",
        "capacidad": 81044
    }
    ```

### /entrenador

**PUT** - CAMBIAR ENTRENADOR DE UN EQUIPO:
- **URL**: http://localhost/Proyecto/api_laliga.php/entrenador
- **JSON**:
    ```json
    {
        "id": 1,
        "entrenador": "Santiago Solari"
    }
    ```

## COMO USAR LA API?

### EJEMPLO OBTENER CLASIFICACION

1. Abre Postman y crea una nueva petición.
2. Configura la petición como GET.
3. Introduce la URL de la API: http://localhost/Proyecto/api_laliga.php/clasificacion
4. Envía la petición.
5. JSON de respuesta:
     ```json
     [
         {
             "posicion": 1,
             "equipo": "Real Sociedad",
             "puntos": 3,
             "victorias": 1,
             "empates": 0,
             "derrotas": 0,
             "goles_favor": 2,
             "goles_contra": 0
         },
         {
             "posicion": 2,
             "equipo": "Atlético Madrid",
             "puntos": 3,
             "victorias": 1,
             "empates": 0,
             "derrotas": 0,
             "goles_favor": 2,
             "goles_contra": 0
         },
         
     ]
     ```

### EJEMPLO INSERTAR PARTIDO

1. Abre Postman y crea una nueva petición.
2. Configura la petición como Post.
3. Introduce la URL de la API: http://localhost/Proyecto/api_laliga.php/partidos.
4. En la pestaña "Body", selecciona "raw" y elige "JSON" en el menú desplegable.
5. Introduce el siguiente JSON en el cuerpo de la petición:
     ```json
     {
         "equipo_local": 15,
         "equipo_visitante": 9,
         "goles_local": 5,
         "goles_visitante": 3,
         "fecha": "2024-10-15"
     }
     ```
6. Envía la petición.
7. JSON de respuesta:
     ```json
     {
         "message": "Partido registrado y estadísticas actualizadas con éxito."
     }
     ```

### EJEMPLO CAMBIAR POSICION

1. Abre Postman y crea una nueva petición.
2. Configura la petición como Put.
3. Introduce la URL de la API: http://localhost/Proyecto/api_laliga.php/jugadores.
4. En la pestaña "Body", selecciona "raw" y elige "JSON" en el menú desplegable.
5. Introduce el siguiente JSON en el cuerpo de la petición:
     ```json
     {
         "id": 15,
         "posicion": "Delantero"
     }
     ```
6. Envía la petición.
7. JSON de respuesta:
     ```json
     {
         "message": "Posicion del jugador actualizada con éxito"
     }
     ```

### EJEMPLO BORRAR EQUIPO Y SUS JUGADORES

1. Abre Postman y crea una nueva petición.
2. Configura la petición como Delete.
3. Introduce la URL de la API: http://localhost/Proyecto/api_laliga.php/equipos?id=6
4. Envía la petición.
5. JSON de respuesta:
     ```json
     {
         "message": "Jugadores eliminados con éxito"
     }
     {
         "message": "Estadísticas eliminadas con éxito"
     }
     {
         "message": "Equipo eliminado con éxito"
     }
     ```

## 3. BASE DE DATOS
## MODEO RELACIONAL
![Esquema relacional](Proyecto/Imagenes/basededatos.png)

## 4. LÓGICA DE NEGOCIO
### CREAR NUEVO PARTIDO
![NuevoPartido](Proyecto/Imagenes/nuevopartido.png)

### CRITERIO CLASIFICACION
![CriteroClasificacion](Proyecto/Imagenes/clasificacion.png)

## 4. SEGURIDAD

Los usuarios sin token solo podrán ejecutar las peticiones GET. El administrador de la base de datos será el único conocedor del token necesario para realizar las demás peticiones.

[ArchivoSeguridad](Proyecto/seguridad.php)
