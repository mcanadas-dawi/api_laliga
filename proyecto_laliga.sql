-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-11-2024 a las 20:28:23
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto_laliga`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `equipos`
--

CREATE TABLE `equipos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  `estadio` varchar(100) NOT NULL,
  `capacidad` int(11) DEFAULT NULL,
  `entrenador` varchar(50) DEFAULT NULL,
  `fundacion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `equipos`
--

INSERT INTO `equipos` (`id`, `nombre`, `ciudad`, `estadio`, `capacidad`, `entrenador`, `fundacion`) VALUES
(1, 'FC Barcelona', 'Barcelona', 'Camp Nou', 99354, 'Hans-Dieter Flick', 1899),
(2, 'Real Madrid', 'Madrid', 'Santiago Bernabéu', 81044, 'Carlo Ancelotti', 1902),
(3, 'Atlético Madrid', 'Madrid', 'Riyadh Air Metropolitano', 68456, 'Diego Simeone', 1903),
(4, 'Sevilla FC', 'Sevilla', 'Ramón Sánchez-Pizjuán', 43883, 'García Pimienta', 1905),
(5, 'Real Sociedad', 'San Sebastián', 'Reale Arena', 39900, 'Imanol Alguacil', 1909),
(6, 'Real Betis', 'Sevilla', 'Benito Villamarín', 60721, 'Manuel Pellegrini', 1907),
(7, 'Athletic Club', 'Bilbao', 'San Mamés', 53289, 'Ernesto Valverde', 1898),
(8, 'Villarreal CF', 'Villarreal', 'Estadio de la Cerámica', 23500, 'Marcelino García', 1923),
(9, 'Valencia CF', 'Valencia', 'Mestalla', 55000, 'Rubén Baraja', 1919),
(10, 'Rayo Vallecano', 'Madrid', 'Estadio de Vallecas', 14708, 'Iñigo Pérez', 1924),
(11, 'CA Osasuna', 'Pamplona', 'El Sadar', 23500, 'Vicente Moreno', 1920),
(12, 'Celta de Vigo', 'Vigo', 'Abanca-Balaídos', 29000, 'Claudio Giráldez', 1923),
(13, 'Getafe CF', 'Getafe', 'Coliseum Alfonso Pérez', 17700, 'José Bordalás', 1983),
(14, 'UD Las Palmas', 'Las Palmas', 'Estadio de Gran Canaria', 32400, 'Diego Martínez', 1928),
(15, 'Leganes', 'Madrid', 'Butarque', 11454, 'Borja Jiménez', 1989),
(16, 'Valladolid', 'Valladolid', 'José Zorrilla', 27618, 'Paulo Pezzolano', 1928),
(17, 'Mallorca', 'Palma de Mallorca', 'Estadi Mallorca Son Moix', 23142, 'Jagoba Arrasate', 1916),
(18, 'Girona FC', 'Girona', 'Estadi Montilivi', 13500, 'Míchel Sánchez', 1930),
(19, 'Espanyol', 'Barcelona', 'RCDE Stadium', 40000, 'José Manuel González', 1900),
(20, 'Deportivo Alavés', 'Vitoria', 'Mendizorroza', 19840, 'Luis García', 1921);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadisticas`
--

CREATE TABLE `estadisticas` (
  `id` int(11) NOT NULL,
  `equipo_id` int(11) NOT NULL,
  `temporada` year(4) NOT NULL,
  `partidos_jugados` int(11) DEFAULT 0,
  `victorias` int(11) DEFAULT 0,
  `empates` int(11) DEFAULT 0,
  `derrotas` int(11) DEFAULT 0,
  `goles_favor` int(11) DEFAULT 0,
  `goles_contra` int(11) DEFAULT 0,
  `puntos` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadisticas`
--

INSERT INTO `estadisticas` (`id`, `equipo_id`, `temporada`, `partidos_jugados`, `victorias`, `empates`, `derrotas`, `goles_favor`, `goles_contra`, `puntos`) VALUES
(1, 1, '2024', 0, 0, 0, 0, 0, 0, 0),
(2, 2, '2024', 0, 0, 0, 0, 0, 0, 0),
(3, 3, '2024', 1, 1, 0, 0, 2, 0, 3),
(4, 4, '2024', 1, 0, 0, 1, 0, 2, 0),
(5, 5, '2024', 1, 1, 0, 0, 2, 0, 3),
(6, 6, '2024', 0, 0, 0, 0, 0, 0, 0),
(7, 7, '2024', 0, 0, 0, 0, 0, 0, 0),
(8, 8, '2024', 0, 0, 0, 0, 0, 0, 0),
(9, 9, '2024', 1, 0, 0, 1, 3, 5, 0),
(10, 10, '2024', 0, 0, 0, 0, 0, 0, 0),
(11, 11, '2024', 0, 0, 0, 0, 0, 0, 0),
(12, 12, '2024', 0, 0, 0, 0, 0, 0, 0),
(13, 13, '2024', 0, 0, 0, 0, 0, 0, 0),
(14, 14, '2024', 1, 0, 0, 1, 0, 2, 0),
(15, 15, '2024', 1, 1, 0, 0, 5, 3, 3),
(16, 16, '2024', 0, 0, 0, 0, 0, 0, 0),
(17, 17, '2024', 0, 0, 0, 0, 0, 0, 0),
(18, 18, '2024', 0, 0, 0, 0, 0, 0, 0),
(19, 19, '2024', 0, 0, 0, 0, 0, 0, 0),
(20, 20, '2024', 0, 0, 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `jugadores`
--

CREATE TABLE `jugadores` (
  `id` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `equipo_id` int(11) DEFAULT NULL,
  `posicion` enum('Portero','Defensa','Centrocampista','Delantero') NOT NULL,
  `numero` int(11) DEFAULT NULL,
  `nacionalidad` varchar(50) DEFAULT NULL,
  `goles` int(11) DEFAULT 0,
  `asistencias` int(11) DEFAULT 0,
  `tarjetas_amarillas` int(11) DEFAULT 0,
  `tarjetas_rojas` int(11) DEFAULT 0,
  `minutos_jugados` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `jugadores`
--

INSERT INTO `jugadores` (`id`, `nombre`, `equipo_id`, `posicion`, `numero`, `nacionalidad`, `goles`, `asistencias`, `tarjetas_amarillas`, `tarjetas_rojas`, `minutos_jugados`) VALUES
(1, 'Andrii Lunin', 2, 'Portero', 13, 'Ucraniano', 0, 0, 0, 0, 0),
(2, 'Thibaut Courtois', 2, 'Portero', 1, 'Belga', 0, 0, 0, 0, 0),
(3, 'Dani Carvajal', 2, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(4, 'Antonio Rüdiger', 2, 'Defensa', 22, 'Alemán', 0, 0, 0, 0, 0),
(5, 'David Alaba', 2, 'Defensa', 4, 'Austriaco', 0, 0, 0, 0, 0),
(6, 'Ferland Mendy', 2, 'Defensa', 23, 'Francés', 0, 0, 0, 0, 0),
(7, 'Fran García', 2, 'Defensa', 20, 'Español', 0, 0, 0, 0, 0),
(8, 'Endrick', 2, 'Delantero', 16, 'Brasileño', 0, 0, 0, 0, 0),
(9, 'Aurélien Tchouaméni', 2, 'Centrocampista', 14, 'Francés', 0, 0, 0, 0, 0),
(10, 'Eduardo Camavinga', 2, 'Centrocampista', 12, 'Francés', 0, 0, 0, 0, 0),
(11, 'Lucas Vázquez', 2, 'Defensa', 17, 'Español', 0, 0, 0, 0, 0),
(12, 'Luka Modrić', 2, 'Centrocampista', 10, 'Croata', 0, 0, 0, 0, 0),
(13, 'Jude Bellingham', 2, 'Centrocampista', 5, 'Inglés', 0, 0, 0, 0, 0),
(14, 'Federico Valverde', 2, 'Centrocampista', 8, 'Uruguayo', 0, 0, 0, 0, 0),
(15, 'Brahim Díaz', 2, 'Delantero', 21, 'Español', 0, 0, 0, 0, 0),
(16, 'Vinícius Júnior', 2, 'Delantero', 7, 'Brasileño', 0, 0, 0, 0, 0),
(17, 'Rodrygo Goes', 2, 'Delantero', 11, 'Brasileño', 0, 0, 0, 0, 0),
(18, 'Kilian Mbappé', 2, 'Delantero', 9, 'Francés', 0, 0, 0, 0, 0),
(19, 'Arda Güler', 2, 'Centrocampista', 24, 'Turco', 0, 0, 0, 0, 0),
(20, 'Fran García', 2, 'Defensa', 20, 'Español', 0, 0, 0, 0, 0),
(21, 'Marc-André ter Stegen', 1, 'Portero', 1, 'Alemán', 0, 0, 0, 0, 0),
(22, 'Iñaki Peña', 1, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(23, 'Jules Koundé', 1, 'Defensa', 23, 'Francés', 0, 0, 0, 0, 0),
(24, 'Ronald Araújo', 1, 'Defensa', 4, 'Uruguayo', 0, 0, 0, 0, 0),
(25, 'Andreas Christensen', 1, 'Defensa', 15, 'Danés', 0, 0, 0, 0, 0),
(26, 'Alejandro Balde', 1, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(27, 'Eric García', 1, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(28, 'Pau Cubarsí', 1, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(29, 'Marc Casadó', 1, 'Centrocampista', 17, 'Español', 0, 0, 0, 0, 0),
(30, 'Frenkie de Jong', 1, 'Centrocampista', 21, 'Neerlandés', 0, 0, 0, 0, 0),
(31, 'Gavi', 1, 'Centrocampista', 6, 'Español', 0, 0, 0, 0, 0),
(32, 'Pedri', 1, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(33, 'Dani Olmo', 1, 'Centrocampista', 20, 'Español', 0, 0, 0, 0, 0),
(34, 'Ferran Torres', 1, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(35, 'Robert Lewandowski', 1, 'Delantero', 9, 'Polaco', 0, 0, 0, 0, 0),
(36, 'Lamine Yamal', 1, 'Delantero', 27, 'Español', 0, 0, 0, 0, 0),
(37, 'Raphinha', 1, 'Delantero', 11, 'Brasileño', 0, 0, 0, 0, 0),
(38, 'Pau Víctor', 1, 'Delantero', 18, 'Español', 0, 0, 0, 0, 0),
(39, 'Pablo Torre', 1, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(40, 'Wojciech Szczesny', 1, 'Portero', 25, 'Polaco', 0, 0, 0, 0, 0),
(41, 'Jan Oblak', 3, 'Portero', 13, 'Esloveno', 0, 0, 0, 0, 0),
(42, 'Juan Musso', 3, 'Portero', 1, 'Argentino', 0, 0, 0, 0, 0),
(43, 'Nahuel Molina', 3, 'Defensa', 16, 'Argentino', 0, 0, 0, 0, 0),
(44, 'Clément Lenglet', 3, 'Defensa', 15, 'Francés', 0, 0, 0, 0, 0),
(45, 'Robin Le Normand', 3, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(46, 'José María Giménez', 3, 'Defensa', 2, 'Uruguayo', 0, 0, 0, 0, 0),
(47, 'César Azpilicueta', 3, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(48, 'Reinildo Mandava', 3, 'Defensa', 23, 'Mozambiqueño', 0, 0, 0, 0, 0),
(49, 'Conor Gallagher', 3, 'Centrocampista', 4, 'Inglés', 0, 0, 0, 0, 0),
(50, 'Marcos Llorente', 3, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(51, 'Koke Resurrección', 3, 'Centrocampista', 6, 'Español', 0, 0, 0, 0, 0),
(52, 'Rodrigo De Paul', 3, 'Centrocampista', 5, 'Argentino', 0, 0, 0, 0, 0),
(53, 'Pablo Barrios', 3, 'Centrocampista', 24, 'Español', 0, 0, 0, 0, 0),
(54, 'Axel Witsel', 3, 'Centrocampista', 20, 'Belga', 0, 0, 0, 0, 0),
(55, 'Antoine Griezmann', 3, 'Delantero', 7, 'Francés', 0, 0, 0, 0, 0),
(56, 'Álvaro Morata', 3, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(57, 'Julián Álvarez', 3, 'Delantero', 19, 'Argentino', 0, 0, 0, 0, 0),
(58, 'Ángel Correa', 3, 'Delantero', 10, 'Argentino', 0, 0, 0, 0, 0),
(59, 'Samuel Lino', 3, 'Delantero', 12, 'Brasileño', 0, 0, 0, 0, 0),
(60, 'Alexander Sørloth', 3, 'Delantero', 9, 'Noruego', 0, 0, 0, 0, 0),
(61, 'Unai Simón', 7, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(62, 'Julen Agirrezabala', 7, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(63, 'Óscar de Marcos', 7, 'Defensa', 18, 'Español', 0, 0, 0, 0, 0),
(64, 'Yuri Berchiche', 7, 'Defensa', 17, 'Español', 0, 0, 0, 0, 0),
(65, 'Yeray Álvarez', 7, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(66, 'Íñigo Lekue', 7, 'Defensa', 15, 'Español', 0, 0, 0, 0, 0),
(67, 'Aitor Paredes', 7, 'Defensa', 4, 'Español', 0, 0, 0, 0, 0),
(68, 'Dani Vivian', 7, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(69, 'Mikel Vesga', 7, 'Centrocampista', 6, 'Español', 0, 0, 0, 0, 0),
(70, 'Oihan Sancet', 7, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(71, 'Íñigo Ruíz de Galarreta', 7, 'Centrocampista', 16, 'Español', 0, 0, 0, 0, 0),
(72, 'Ander Herrera', 7, 'Centrocampista', 21, 'Español', 0, 0, 0, 0, 0),
(73, 'Unai Gómez', 7, 'Centrocampista', 20, 'Español', 0, 0, 0, 0, 0),
(74, 'Álex Berenguer', 4, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(75, 'Iñaki Williams', 4, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(76, 'Nico Williams', 7, 'Delantero', 10, 'Español', 0, 0, 0, 0, 0),
(77, 'Gorka Guruzeta', 7, 'Delantero', 12, 'Español', 0, 0, 0, 0, 0),
(78, 'Álvaro Djaló', 7, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(79, 'Andoni Gorosabel', 7, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(80, 'Unai Núñez', 7, 'Defensa', 14, 'Español', 0, 0, 0, 0, 0),
(81, 'Antonio Sivera', 20, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(82, 'Jesús Owono', 20, 'Portero', 13, 'Nigeriano', 0, 0, 0, 0, 0),
(83, 'Manu Sánchez', 20, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(84, 'Aleksandar Sedlar', 20, 'Defensa', 4, 'Serbio', 0, 0, 0, 0, 0),
(85, 'Abdel Abqar', 20, 'Defensa', 5, 'Marroquí', 0, 0, 0, 0, 0),
(86, 'Nahuel Tenaglia', 20, 'Defensa', 14, 'Argentino', 0, 0, 0, 0, 0),
(87, 'Santiago Mouriño', 20, 'Defensa', 12, 'Uruguayo', 0, 0, 0, 0, 0),
(88, 'Ander Guevara', 20, 'Defensa', 6, 'Paraguayo', 0, 0, 0, 0, 0),
(89, 'Antonio Blanco', 20, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(90, 'Jon Guridi', 20, 'Centrocampista', 18, 'Español', 0, 0, 0, 0, 0),
(91, 'Carlos Benavídez', 20, 'Centrocampista', 23, 'Uruguayo', 0, 0, 0, 0, 0),
(92, 'Joan Jordan', 20, 'Centrocampista', 24, 'Español', 0, 0, 0, 0, 0),
(93, 'Carlos Vicente', 20, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(94, 'Asier Villalibre', 20, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(95, 'Tomás Conechny', 20, 'Delantero', 10, 'Argentino', 0, 0, 0, 0, 0),
(96, 'Toni Martínez', 20, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(97, 'Kike García', 20, 'Delantero', 17, 'Español', 0, 0, 0, 0, 0),
(98, 'Stoichkov', 20, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(99, 'Luka Romero', 20, 'Delantero', 20, 'Argentino', 0, 0, 0, 0, 0),
(100, 'Abde Rebbach', 20, 'Delantero', 21, 'Marroquí', 0, 0, 0, 0, 0),
(101, 'Paulo Gazzaniga', 18, 'Portero', 13, 'Argentino', 0, 0, 0, 0, 0),
(102, 'Pau López', 18, 'Portero', 25, 'Español', 0, 0, 0, 0, 0),
(103, 'Juanpe', 18, 'Defensa', 15, 'Español', 0, 0, 0, 0, 0),
(104, 'Alejandro Francés', 18, 'Defensa', 16, 'Español', 0, 0, 0, 0, 0),
(105, 'Miguel Gutiérrez', 18, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(106, 'Arnau Martínez', 18, 'Defensa', 4, 'Español', 0, 0, 0, 0, 0),
(107, 'Daley Blind', 18, 'Defensa', 17, 'Neerlandés', 0, 0, 0, 0, 0),
(108, 'David López', 18, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(109, 'Yangel Herrera', 18, 'Centrocampista', 7, 'Venezolano', 0, 0, 0, 0, 0),
(110, 'Oriol Romeu', 18, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(111, 'Donny van de Beek', 18, 'Centrocampista', 6, 'Neerlandés', 0, 0, 0, 0, 0),
(112, 'Yáser Asprilla', 18, 'Centrocampista', 10, 'Colombiano', 0, 0, 0, 0, 0),
(113, 'Ivan Martín', 18, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(114, 'Cristhian Stuani', 18, 'Delantero', 7, 'Uruguayo', 0, 0, 0, 0, 0),
(115, 'Abel Ruiz', 18, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(116, 'Arnaut Danjuma', 18, 'Delantero', 20, 'Neerlandés', 0, 0, 0, 0, 0),
(117, 'Bryan Gil', 18, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(118, 'Viktor Tsyhankov', 18, 'Delantero', 8, 'Ucraniano', 0, 0, 0, 0, 0),
(119, 'Portu', 18, 'Delantero', 24, 'Español', 0, 0, 0, 0, 0),
(120, 'Jhon Solís', 18, 'Centrocampista', 22, 'Colombiano', 0, 0, 0, 0, 0),
(121, 'Adrián', 6, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(122, 'Rui Silva', 6, 'Portero', 1, 'Portugués', 0, 0, 0, 0, 0),
(123, 'Héctor Bellerín', 6, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(124, 'Diego Llorente', 6, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(125, 'Marc Bartra', 6, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(126, 'Natan', 6, 'Defensa', 6, 'Brasileño', 0, 0, 0, 0, 0),
(127, 'Ricardo Rodriguez', 6, 'Defensa', 12, 'Suizo', 0, 0, 0, 0, 0),
(128, 'Romain Perraud', 6, 'Defensa', 15, 'Francés', 0, 0, 0, 0, 0),
(129, 'Youssouf Sabaly', 6, 'Defensa', 23, 'Senegalés', 0, 0, 0, 0, 0),
(130, 'Aitor Ruibal', 6, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(131, 'William Carvalho', 6, 'Centrocampista', 14, 'Portugués', 0, 0, 0, 0, 0),
(132, 'Johnny Cardoso', 6, 'Centrocampista', 4, 'Estadounidense', 0, 0, 0, 0, 0),
(133, 'Pablo Fornals', 6, 'Centrocampista', 18, 'Español', 0, 0, 0, 0, 0),
(134, 'Giovanni Lo Celso', 6, 'Centrocampista', 20, 'Argentino', 0, 0, 0, 0, 0),
(135, 'Isco', 6, 'Centrocampista', 22, 'Español', 0, 0, 0, 0, 0),
(136, 'Juanmi', 6, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(137, 'Victor Roque', 6, 'Centrocampista', 8, 'Brasileño', 0, 0, 0, 0, 0),
(138, 'Chimy Ávila', 6, 'Centrocampista', 9, 'Argentino', 0, 0, 0, 0, 0),
(139, 'Abde Ezzalzouli', 6, 'Centrocampista', 10, 'Marroquí', 0, 0, 0, 0, 0),
(140, 'Cédric Bakambu', 6, 'Centrocampista', 11, 'Congoleño', 0, 0, 0, 0, 0),
(141, 'Ivan Villar', 12, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(142, 'Vicente Guaita', 12, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(143, 'Óscar Mingueza', 12, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(144, 'Carl Starfelt', 12, 'Defensa', 3, 'Sueco', 0, 0, 0, 0, 0),
(145, 'Marcos Alonso', 12, 'Defensa', 20, 'Español', 0, 0, 0, 0, 0),
(146, 'Joseph Aidoo', 12, 'Defensa', 15, 'Ghanés', 0, 0, 0, 0, 0),
(147, 'Javier Manquillo', 12, 'Defensa', 22, 'Español', 0, 0, 0, 0, 0),
(148, 'Carlos Domínguez', 12, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(149, 'Franco Cervi', 12, 'Centrocampista', 11, 'Argentino', 0, 0, 0, 0, 0),
(150, 'Ilaix Moriba', 12, 'Centrocampista', 6, 'Guineano', 0, 0, 0, 0, 0),
(151, 'Hugo Álvarez', 12, 'Centrocampista', 30, 'Español', 0, 0, 0, 0, 0),
(152, 'Hugo Sotelo', 12, 'Centrocampista', 33, 'Español', 0, 0, 0, 0, 0),
(153, 'Iago Aspas', 12, 'Delantero', 10, 'Español', 0, 0, 0, 0, 0),
(154, 'Williot Swedberg', 12, 'Centrocampista', 19, 'Sueco', 0, 0, 0, 0, 0),
(155, 'Jailson', 12, 'Centrocampista', 16, 'Brasileño', 0, 0, 0, 0, 0),
(156, 'Borja Iglesias', 12, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(157, 'Tasos Douvikas', 12, 'Delantero', 9, 'Griego', 0, 0, 0, 0, 0),
(158, 'Jonathan Bamba', 12, 'Delantero', 17, 'Costamarfileño', 0, 0, 0, 0, 0),
(159, 'Fran Beltrán', 12, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(160, 'Mihailo Ristic', 12, 'Defensa', 21, 'Serbio', 0, 0, 0, 0, 0),
(161, 'Fernando Pacheco', 19, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(162, 'Joan García', 19, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(163, 'Sergi Gómez', 19, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(164, 'Marash Kumbulla', 19, 'Defensa', 4, 'Albanés', 0, 0, 0, 0, 0),
(165, 'Fernando Calero', 19, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(166, 'Leandro Cabrera', 19, 'Defensa', 6, 'Uruguayo', 0, 0, 0, 0, 0),
(167, 'Álvaro Tejero', 19, 'Defensa', 12, 'Español', 0, 0, 0, 0, 0),
(168, 'Brial Oliván', 19, 'Defensa', 14, 'Español', 0, 0, 0, 0, 0),
(169, 'Carlos Romero', 19, 'Defensa', 22, 'Español', 0, 0, 0, 0, 0),
(170, 'Omar El Hilali', 19, 'Defensa', 23, 'Marroquí', 0, 0, 0, 0, 0),
(171, 'Edu Expósito', 19, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(172, 'Pere Milla', 19, 'Centrocampista', 11, 'Español', 0, 0, 0, 0, 0),
(173, 'Alex Král', 19, 'Centrocampista', 20, 'Checo', 0, 0, 0, 0, 0),
(174, 'Javi Puado', 19, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(175, 'Alejo Véliz', 19, 'Delantero', 9, 'Argentino', 0, 0, 0, 0, 0),
(176, 'Walid Cheddira', 19, 'Delantero', 16, 'Marroquí', 0, 0, 0, 0, 0),
(177, 'Jofe Carreras', 19, 'Delantero', 17, 'Español', 0, 0, 0, 0, 0),
(178, 'Pol Lozano', 19, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(179, 'José Gragera', 19, 'Centrocampista', 15, 'Español', 0, 0, 0, 0, 0),
(180, 'Irvin Cardona', 19, 'Delantero', 16, 'Francés', 0, 0, 0, 0, 0),
(181, 'David Soria', 13, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(182, 'Jirí Letácek', 13, 'Portero', 1, 'Checo', 0, 0, 0, 0, 0),
(183, 'Djené Dakonam', 13, 'Defensa', 2, 'Togolés', 0, 0, 0, 0, 0),
(184, 'Mauro Arambarri', 13, 'Centrocampista', 8, 'Uruguayo', 0, 0, 0, 0, 0),
(185, 'Fabrizio Angileri', 13, 'Defensa', 3, 'Argentino', 0, 0, 0, 0, 0),
(186, 'Álex Sola', 13, 'Defensa', 7, 'Español', 0, 0, 0, 0, 0),
(187, 'Omar Alderete', 13, 'Defensa', 15, 'Paraguayo', 0, 0, 0, 0, 0),
(188, 'Luis Milla', 13, 'Centrocampista', 5, 'Español', 0, 0, 0, 0, 0),
(189, 'Allan Nyom', 13, 'Defensa', 12, 'Camerunés', 0, 0, 0, 0, 0),
(190, 'Diego Rico', 13, 'Centrocampista', 16, 'Español', 0, 0, 0, 0, 0),
(191, 'Juan Iglesias', 13, 'Centrocampista', 21, 'Español', 0, 0, 0, 0, 0),
(192, 'Christantus Uche', 13, 'Centrocampista', 2, 'Japonés', 0, 0, 0, 0, 0),
(193, 'Carles Aleñá', 13, 'Centrocampista', 11, 'Español', 0, 0, 0, 0, 0),
(194, 'Borja Mayoral', 13, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(195, 'Bertug Yildirim', 13, 'Delantero', 10, 'Turco', 0, 0, 0, 0, 0),
(196, 'Carles Pérez', 13, 'Delantero', 17, 'Español', 0, 0, 0, 0, 0),
(197, 'Peter Federico', 13, 'Delantero', 19, 'Dominicano', 0, 0, 0, 0, 0),
(198, 'Álvaro Rodríguez', 13, 'Delantero', 18, 'Uruguayo', 0, 0, 0, 0, 0),
(199, 'Yellu Santiago', 13, 'Centrocampista', 20, 'Español', 0, 0, 0, 0, 0),
(200, 'Juan Berrocal', 13, 'Defensa', 4, 'Dominicano', 0, 0, 0, 0, 0),
(201, 'Álvaro Valles', 14, 'Portero', 25, 'Español', 0, 0, 0, 0, 0),
(202, 'Jasper Cillessen', 14, 'Portero', 1, 'Neerlandés', 0, 0, 0, 0, 0),
(203, 'Scott McKenna', 14, 'Defensa', 15, 'Escocés', 0, 0, 0, 0, 0),
(204, 'Álex Suárez', 14, 'Defensa', 4, 'Español', 0, 0, 0, 0, 0),
(205, 'Álex Muñoz', 14, 'Defensa', 23, 'Español', 0, 0, 0, 0, 0),
(206, 'Marvin Park', 14, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(207, 'Javi Muñoz', 14, 'Centrocampista', 5, 'Español', 0, 0, 0, 0, 0),
(208, 'Enzo Loiodice', 14, 'Centrocampista', 12, 'Francés', 0, 0, 0, 0, 0),
(209, 'Kirian Rodríguez', 14, 'Centrocampista', 20, 'Español', 0, 0, 0, 0, 0),
(210, 'Alberto Moleiro', 14, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(211, 'Fabio González', 14, 'Centrocampista', 16, 'Español', 0, 0, 0, 0, 0),
(212, 'Sandro Ramírez', 14, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(213, 'Oliver McBurnie', 14, 'Delantero', 16, 'Escocés', 0, 0, 0, 0, 0),
(214, 'Marc Cardona', 14, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(215, 'Jaime Mata', 14, 'Centrocampista', 17, 'Español', 0, 0, 0, 0, 0),
(216, 'Fabio Silva', 14, 'Centrocampista', 37, 'Portugués', 0, 0, 0, 0, 0),
(217, 'Mika Mármol', 14, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(218, 'Juan Herzog', 14, 'Defensa', 28, 'Español', 0, 0, 0, 0, 0),
(219, 'Jose Campaña', 14, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(220, 'Manu Fuster', 14, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(221, 'Juan Soriano', 15, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(222, 'Marko Dmitrovic', 15, 'Portero', 13, 'Serbio', 0, 0, 0, 0, 0),
(223, 'Jorge Sáenz', 15, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(224, 'Javi Hernández', 15, 'Defensa', 20, 'Español', 0, 0, 0, 0, 0),
(225, 'Sergio González', 15, 'Defensa', 6, 'Español', 0, 0, 0, 0, 0),
(226, 'Valentin Rosier', 15, 'Defensa', 12, 'Francés', 0, 0, 0, 0, 0),
(227, 'Enric Franquesa', 15, 'Defensa', 15, 'Español', 0, 0, 0, 0, 0),
(228, 'Óscar Rodríguez', 15, 'Centrocampista', 7, 'Español', 0, 0, 0, 0, 0),
(229, 'Renano Tapia', 15, 'Centrocampista', 5, 'Peruano', 0, 0, 0, 0, 0),
(230, 'Seydouba Cissé', 15, 'Centrocampista', 8, 'Guineano', 0, 0, 0, 0, 0),
(231, 'Juan Cruz', 15, 'Centrocampista', 11, 'Español', 0, 0, 0, 0, 0),
(232, 'Darko Brasanac', 15, 'Centrocampista', 14, 'Serbio', 0, 0, 0, 0, 0),
(233, 'Yvan Neyou', 15, 'Centrocampista', 17, 'Camerunés', 0, 0, 0, 0, 0),
(234, 'Miguel de la Fuente', 15, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(235, 'Dani Raba', 15, 'Delantero', 10, 'Español', 0, 0, 0, 0, 0),
(236, 'Sébastien Haller', 15, 'Delantero', 18, 'Costamarfileño', 0, 0, 0, 0, 0),
(237, 'Matija Nastasic', 15, 'Defensa', 22, 'Serbio', 0, 0, 0, 0, 0),
(238, 'Munir El Haddadi', 15, 'Delantero', 23, 'Marroquí', 0, 0, 0, 0, 0),
(239, 'Roberto López', 15, 'Centrocampista', 21, 'Español', 0, 0, 0, 0, 0),
(240, 'Diego García', 15, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(241, 'Dominik Greif', 17, 'Portero', 1, 'Eslovaco', 0, 0, 0, 0, 0),
(242, 'Leo Román', 17, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(243, 'Antonio Raíllo', 17, 'Defensa', 21, 'Español', 0, 0, 0, 0, 0),
(244, 'Mateu Morey', 17, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(245, 'Pablo Maffeo', 17, 'Defensa', 23, 'Español', 0, 0, 0, 0, 0),
(246, 'Johan Mojica', 17, 'Defensa', 22, 'Colombiano', 0, 0, 0, 0, 0),
(247, 'Toni Lato', 17, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(248, 'Copete', 17, 'Defensa', 6, 'Español', 0, 0, 0, 0, 0),
(249, 'Siebe Van der Heyden', 17, 'Defensa', 9, 'Belga', 0, 0, 0, 0, 0),
(250, 'Abdon Prats', 17, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(251, 'Daniel Rodríguez', 17, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(252, 'Antonio Sánchez', 17, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(253, 'Muriqi Vedat', 17, 'Delantero', 7, 'Kosovar', 0, 0, 0, 0, 0),
(254, 'Martin Valjent', 17, 'Defensa', 24, 'Eslovaco', 0, 0, 0, 0, 0),
(255, 'Robert Navarro', 17, 'Centrocampista', 27, 'Español', 0, 0, 0, 0, 0),
(256, 'Javi Llabrés', 17, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(257, 'Omar Mascarell', 17, 'Centrocampista', 5, 'Español', 0, 0, 0, 0, 0),
(258, 'Sergi Darder', 17, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(259, 'Samú Costa', 17, 'Centrocampista', 12, 'Portugúes', 0, 0, 0, 0, 0),
(260, 'Cyle Larin', 17, 'Centrocampista', 17, 'Canadiense', 0, 0, 0, 0, 0),
(261, 'Aitor Fernández', 11, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(262, 'Sergio Herrera', 11, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(263, 'Nacho Vidal', 11, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(264, 'Unai García', 11, 'Defensa', 4, 'Español', 0, 0, 0, 0, 0),
(265, 'Juan Cruz', 11, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(266, 'Jorge Herrando', 11, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(267, 'Lucas Torró', 11, 'Centrocampista', 6, 'Español', 0, 0, 0, 0, 0),
(268, 'Jon Moncayola', 11, 'Centrocampista', 7, 'Español', 0, 0, 0, 0, 0),
(269, 'Aimar Oroz', 11, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(270, 'Moi Gómez', 11, 'Centrocampista', 16, 'Español', 0, 0, 0, 0, 0),
(271, 'Rubén García', 11, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0),
(272, 'Ante Budimir', 11, 'Delantero', 17, 'Croata', 0, 0, 0, 0, 0),
(273, 'Raúl García', 11, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(274, 'Bryan Zaragoza', 11, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(275, 'Abel Bretones', 11, 'Centrocampista', 23, 'Español', 0, 0, 0, 0, 0),
(276, 'Kike Barja', 11, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(277, 'Rubén Peña', 11, 'Defensa', 15, 'Español', 0, 0, 0, 0, 0),
(278, 'Jesus Areso', 11, 'Defensa', 12, 'Español', 0, 0, 0, 0, 0),
(279, 'Enzo Boyomo', 11, 'Defensa', 22, 'Camerunés', 0, 0, 0, 0, 0),
(280, 'Alejandro Catena', 11, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(281, 'Dani Cárdenas', 10, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(282, 'Augusto Batalla', 10, 'Portero', 13, 'Argentino', 0, 0, 0, 0, 0),
(283, 'Andrei Ratiu', 10, 'Defensa', 2, 'Rumano', 0, 0, 0, 0, 0),
(284, 'Pep Chavarría', 10, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(285, 'Aridane Hernández', 10, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(286, 'Iván Balliu', 10, 'Defensa', 20, 'Albanés', 0, 0, 0, 0, 0),
(287, 'Abdul Mumin', 10, 'Defensa', 16, 'Ghanés', 0, 0, 0, 0, 0),
(288, 'Pacha Espino', 10, 'Defensa', 6, 'Español', 0, 0, 0, 0, 0),
(289, 'Óscar Trejo', 10, 'Centrocampista', 8, 'Argentino', 0, 0, 0, 0, 0),
(290, 'Florian Lejeune', 10, 'Defensa', 24, 'Francés', 0, 0, 0, 0, 0),
(291, 'Pathé Ciss', 10, 'Centrocampista', 6, 'Senegalés', 0, 0, 0, 0, 0),
(292, 'Alvaro García', 10, 'Delantero', 18, 'Español', 0, 0, 0, 0, 0),
(293, 'James Rodríguez', 10, 'Centrocampista', 10, 'Colombiano', 0, 0, 0, 0, 0),
(294, 'Sergio Camello', 10, 'Delantero', 14, 'Español', 0, 0, 0, 0, 0),
(295, 'Isi Palazón', 10, 'Centrocampista', 7, 'Español', 0, 0, 0, 0, 0),
(296, 'Jorge de Frutos', 10, 'Delantero', 19, 'Español', 0, 0, 0, 0, 0),
(297, 'Gerard Gumbau', 10, 'Centrocampista', 15, 'Español', 0, 0, 0, 0, 0),
(298, 'Óscar Valentín', 10, 'Centrocampista', 23, 'Español', 0, 0, 0, 0, 0),
(299, 'Adri Embarba', 10, 'Delantero', 21, 'Español', 0, 0, 0, 0, 0),
(300, 'Sergi Guardiola', 10, 'Delantero', 12, 'Español', 0, 0, 0, 0, 0),
(301, 'Álex Remiro', 5, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(302, 'Unai Marrero', 5, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(303, 'Álvaro Odriorzola', 5, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(304, 'Aritz Elustondo', 5, 'Defensa', 6, 'Español', 0, 0, 0, 0, 0),
(305, 'Igor Zubeldia', 5, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(306, 'Aihen Muñoz', 5, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(307, 'Nayef Aguerd', 5, 'Defensa', 21, 'Marroquí', 0, 0, 0, 0, 0),
(308, 'Martin Zubimendi', 5, 'Centrocampista', 4, 'Español', 0, 0, 0, 0, 0),
(309, 'Brais Méndez', 5, 'Centrocampista', 23, 'Español', 0, 0, 0, 0, 0),
(310, 'Beñat Turrientes', 5, 'Centrocampista', 22, 'Español', 0, 0, 0, 0, 0),
(311, 'Takefusa Kubo', 5, 'Delantero', 14, 'Japonés', 0, 0, 0, 0, 0),
(312, 'Sergio Gómez', 5, 'Centrocampista', 17, 'Español', 0, 0, 0, 0, 0),
(313, 'Ander Barrenetxea', 5, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(314, 'Umar Sadiq', 5, 'Delantero', 19, 'Nigeriano', 0, 0, 0, 0, 0),
(315, 'Mikel Oyarzabal', 5, 'Delantero', 10, 'Español', 0, 0, 0, 0, 0),
(316, 'Sheraldo Becker', 5, 'Delantero', 11, 'Surimeño', 0, 0, 0, 0, 0),
(317, 'Jon Pacheco', 5, 'Defensa', 20, 'Español', 0, 0, 0, 0, 0),
(318, 'Hamari Traoré', 5, 'Defensa', 18, 'Maliano', 0, 0, 0, 0, 0),
(319, 'Luka Sucic', 5, 'Centrocampista', 24, 'Croata', 0, 0, 0, 0, 0),
(320, 'Orri Óskarsson', 5, 'Delantero', 9, 'Islandés', 0, 0, 0, 0, 0),
(321, 'Ørjan Nyland', 4, 'Portero', 13, 'Noruego', 0, 0, 0, 0, 0),
(322, 'Álvaro Fernández', 4, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(323, 'Jesús Navas', 4, 'Defensa', 16, 'Español', 0, 0, 0, 0, 0),
(324, 'Valentín Barco', 4, 'Defensa', 19, 'Argentino', 0, 0, 0, 0, 0),
(325, 'Nemanja Gudelj', 4, 'Centrocampista', 6, 'Serbio', 0, 0, 0, 0, 0),
(326, 'Tanguy Nianzou', 4, 'Defensa', 24, 'Francés', 0, 0, 0, 0, 0),
(327, 'Loïc Badé', 4, 'Defensa', 22, 'Francés', 0, 0, 0, 0, 0),
(328, 'Marcao', 4, 'Defensa', 23, 'Brasileño', 0, 0, 0, 0, 0),
(329, 'Sambi Lokonga', 4, 'Centrocampista', 12, 'Belga', 0, 0, 0, 0, 0),
(330, 'Saúl Ñiguez', 4, 'Centrocampista', 17, 'Español', 0, 0, 0, 0, 0),
(331, 'Lucien Agoumé', 4, 'Centrocampista', 18, 'Francés', 0, 0, 0, 0, 0),
(332, 'Suso', 4, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(333, 'Juanlu Sánchez', 4, 'Centrocampista', 26, 'Español', 0, 0, 0, 0, 0),
(334, 'Kelechi Ihenacho', 4, 'Delantero', 9, 'Nigeriano', 0, 0, 0, 0, 0),
(335, 'Chidera Ejuke', 4, 'Delantero', 21, 'Nigeriano', 0, 0, 0, 0, 0),
(336, 'Isaac Romero', 4, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(337, 'Dodi Lukébakio', 4, 'Delantero', 11, 'Belga', 0, 0, 0, 0, 0),
(338, 'Gonzalo Montiel', 4, 'Defensa', 15, 'Argentino', 0, 0, 0, 0, 0),
(339, 'Jose Ángel Carmona', 4, 'Defensa', 32, 'Español', 0, 0, 0, 0, 0),
(340, 'Djibril Sow', 4, 'Centrocampista', 20, 'Suizo', 0, 0, 0, 0, 0),
(341, 'Giorgi Mamardashvili', 9, 'Portero', 25, 'Georgiano', 0, 0, 0, 0, 0),
(342, 'Jaume Domènech', 9, 'Portero', 1, 'Español', 0, 0, 0, 0, 0),
(343, 'José Gayà', 9, 'Defensa', 14, 'Español', 0, 0, 0, 0, 0),
(344, 'Cristhian Mosquera', 9, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(345, 'Mouctar Diakhaby', 9, 'Defensa', 4, 'Guineano', 0, 0, 0, 0, 0),
(346, 'Thierry Correia', 9, 'Defensa', 12, 'Portugués', 0, 0, 0, 0, 0),
(347, 'Dimitri Foulquier', 9, 'Defensa', 20, 'Francés', 0, 0, 0, 0, 0),
(348, 'Javier Guerra', 9, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(349, 'Pepelu', 9, 'Centrocampista', 18, 'Español', 0, 0, 0, 0, 0),
(350, 'André Almeida', 9, 'Centrocampista', 10, 'Portugués', 0, 0, 0, 0, 0),
(351, 'Hugo Guillamón', 9, 'Defensa', 6, 'Español', 0, 0, 0, 0, 0),
(352, 'Fran Pérez', 9, 'Centrocampista', 23, 'Español', 0, 0, 0, 0, 0),
(353, 'Diego López', 9, 'Delantero', 16, 'Español', 0, 0, 0, 0, 0),
(354, 'Samu Castillejo', 9, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(355, 'Hugo Duro', 9, 'Delantero', 9, 'Español', 0, 0, 0, 0, 0),
(356, 'Dani Gómez', 9, 'Delantero', 17, 'Español', 0, 0, 0, 0, 0),
(357, 'Jesús Vázquez', 9, 'Defensa', 21, 'Español', 0, 0, 0, 0, 0),
(358, 'Sergi Canós', 9, 'Centrocampista', 7, 'Español', 0, 0, 0, 0, 0),
(359, 'Rafa Mir', 9, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(360, 'Luis Rioja', 9, 'Delantero', 22, 'Español', 0, 0, 0, 0, 0),
(361, 'André Ferreira', 16, 'Portero', 1, 'Portugués', 0, 0, 0, 0, 0),
(362, 'Karl Hein', 16, 'Portero', 13, 'Estonio', 0, 0, 0, 0, 0),
(363, 'Luis Pérez', 16, 'Defensa', 2, 'Español', 0, 0, 0, 0, 0),
(364, 'Javier Sánchez', 16, 'Defensa', 5, 'Español', 0, 0, 0, 0, 0),
(365, 'David Torres', 16, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(366, 'Lucas Rosa', 16, 'Defensa', 22, 'Español', 0, 0, 0, 0, 0),
(367, 'Cenk Özkacar', 16, 'Defensa', 6, 'Turco', 0, 0, 0, 0, 0),
(368, 'Eray Cömert', 16, 'Defensa', 15, 'Suizo', 0, 0, 0, 0, 0),
(369, 'Kike Pérez', 16, 'Centrocampista', 8, 'Español', 0, 0, 0, 0, 0),
(370, 'Victor Meseguer', 16, 'Centrocampista', 4, 'Español', 0, 0, 0, 0, 0),
(371, 'Mario Martín', 16, 'Centrocampista', 12, 'Español', 0, 0, 0, 0, 0),
(372, 'Iván Sánchez', 16, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(373, 'Mamadou Sylla', 16, 'Delantero', 7, 'Senegalés', 0, 0, 0, 0, 0),
(374, 'Marcos André', 16, 'Delantero', 9, 'Brasileño', 0, 0, 0, 0, 0),
(375, 'Raúl Moro', 16, 'Delantero', 11, 'Español', 0, 0, 0, 0, 0),
(376, 'Juanmi Latasa', 16, 'Delantero', 14, 'Español', 0, 0, 0, 0, 0),
(377, 'Kenedy', 16, 'Delantero', 24, 'Brasileño', 0, 0, 0, 0, 0),
(378, 'Darwin Machís', 16, 'Defensa', 18, 'Venezolano', 0, 0, 0, 0, 0),
(379, 'Selim Amallah', 16, 'Centrocampista', 3, 'Marroquí', 0, 0, 0, 0, 0),
(380, 'Amath Ndiaye', 16, 'Delantero', 19, 'Senegalés', 0, 0, 0, 0, 0),
(381, 'Diego Conde', 8, 'Portero', 13, 'Español', 0, 0, 0, 0, 0),
(382, 'Luiz Júnior', 8, 'Portero', 1, 'Brasileño', 0, 0, 0, 0, 0),
(383, 'Raúl Albiol', 8, 'Defensa', 3, 'Español', 0, 0, 0, 0, 0),
(384, 'Juan Bernat', 8, 'Defensa', 12, 'Español', 0, 0, 0, 0, 0),
(385, 'Juan Foyth', 8, 'Defensa', 8, 'Argentino', 0, 0, 0, 0, 0),
(386, 'Kiko Femenia', 8, 'Defensa', 17, 'Español', 0, 0, 0, 0, 0),
(387, 'Logan Costa', 8, 'Defensa', 2, 'Argelino', 0, 0, 0, 0, 0),
(388, 'Etienne Capoue', 8, 'Centrocampista', 6, 'Caboverdiano', 0, 0, 0, 0, 0),
(389, 'Ramón Terrats', 8, 'Centrocampista', 20, 'Español', 0, 0, 0, 0, 0),
(390, 'Alejandro Baena', 8, 'Centrocampista', 16, 'Español', 0, 0, 0, 0, 0),
(391, 'Dani Parejo', 8, 'Centrocampista', 10, 'Español', 0, 0, 0, 0, 0),
(392, 'Yeremy Pino', 8, 'Delantero', 21, 'Español', 0, 0, 0, 0, 0),
(393, 'Gerard Moreno', 8, 'Delantero', 7, 'Español', 0, 0, 0, 0, 0),
(394, 'Ilias Akhomach', 8, 'Delantero', 11, 'Marroquí', 0, 0, 0, 0, 0),
(395, 'Thierno Barry', 8, 'Delantero', 15, 'Francés', 0, 0, 0, 0, 0),
(396, 'Ayoze Pérez', 8, 'Delantero', 22, 'Español', 0, 0, 0, 0, 0),
(397, 'Alfonso Pedraza', 8, 'Defensa', 24, 'Español', 0, 0, 0, 0, 0),
(398, 'Pape Gueye', 8, 'Centrocampista', 18, 'Senegalés', 0, 0, 0, 0, 0),
(399, 'Nicolas Pépé', 8, 'Delantero', 19, 'Costamarfileño', 0, 0, 0, 0, 0),
(400, 'Santi Comesaña', 8, 'Centrocampista', 14, 'Español', 0, 0, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `partidos`
--

CREATE TABLE `partidos` (
  `id` int(11) NOT NULL,
  `equipo_local` int(11) NOT NULL,
  `equipo_visitante` int(11) NOT NULL,
  `goles_local` int(11) DEFAULT 0,
  `goles_visitante` int(11) DEFAULT 0,
  `fecha` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `partidos`
--

INSERT INTO `partidos` (`id`, `equipo_local`, `equipo_visitante`, `goles_local`, `goles_visitante`, `fecha`) VALUES
(1, 1, 2, 1, 0, '2023-10-01'),
(2, 3, 14, 2, 0, '2024-05-15'),
(5, 4, 5, 0, 2, '2024-05-15'),
(7, 15, 9, 5, 3, '2024-10-15');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `equipos`
--
ALTER TABLE `equipos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `equipo_id` (`equipo_id`,`temporada`);

--
-- Indices de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_id` (`equipo_id`);

--
-- Indices de la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `equipo_local` (`equipo_local`),
  ADD KEY `equipo_visitante` (`equipo_visitante`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `equipos`
--
ALTER TABLE `equipos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT de la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `jugadores`
--
ALTER TABLE `jugadores`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=405;

--
-- AUTO_INCREMENT de la tabla `partidos`
--
ALTER TABLE `partidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estadisticas`
--
ALTER TABLE `estadisticas`
  ADD CONSTRAINT `estadisticas_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `jugadores`
--
ALTER TABLE `jugadores`
  ADD CONSTRAINT `jugadores_ibfk_1` FOREIGN KEY (`equipo_id`) REFERENCES `equipos` (`id`) ON DELETE SET NULL;

--
-- Filtros para la tabla `partidos`
--
ALTER TABLE `partidos`
  ADD CONSTRAINT `partidos_ibfk_1` FOREIGN KEY (`equipo_local`) REFERENCES `equipos` (`id`),
  ADD CONSTRAINT `partidos_ibfk_2` FOREIGN KEY (`equipo_visitante`) REFERENCES `equipos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
