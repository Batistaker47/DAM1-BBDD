-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 08-03-2024 a las 13:11:45
-- Versión del servidor: 10.4.11-MariaDB
-- Versión de PHP: 7.4.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_foro`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `mensajes_eliminar` (IN `id` INT)  DELETE FROM mensajes WHERE mens_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mensajes_insertar` (IN `texto` TEXT, IN `fecha` TIMESTAMP, IN `tema` INT, IN `usuario` INT)  INSERT INTO mensajes VALUES
(null,texto,CURRENT_TIMESTAMP,tema,usuario)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mensajes_Select_All` ()  SELECT * FROM mensajes$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `mensajes_Select_ID_Usuario` (IN `id_user` INT)  SELECT * FROM mensajes WHERE mens_usu_id = id_user$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `temas_eliminar` (IN `id` INT)  DELETE FROM temas WHERE tema_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `temas_insertar` (IN `nombre` VARCHAR(50), IN `descripcion` TEXT)  INSERT INTO temas VALUES
(null,nombre,descripcion)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `temas_Select_All` ()  SELECT * FROM temas ORDER BY tema_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_insertar` (IN `alias` VARCHAR(50), IN `contraseña` VARCHAR(50), IN `foto` VARCHAR(50), IN `administrador` BOOLEAN)  INSERT INTO usuarios VALUES
(null,alias,md5(contraseña),foto,administrador)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usuarios_Select_All` ()  SELECT * FROM usuarios ORDER BY usu_alias$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mensajes`
--

CREATE TABLE `mensajes` (
  `mens_id` int(10) UNSIGNED NOT NULL,
  `mens_texto` text DEFAULT NULL,
  `mens_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mens_tema_id` int(10) UNSIGNED NOT NULL,
  `mens_usu_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `mensajes`
--

INSERT INTO `mensajes` (`mens_id`, `mens_texto`, `mens_fecha`, `mens_tema_id`, `mens_usu_id`) VALUES
(1, 'El Real Madrid es el mejor equipo del mundo', '2024-03-07 09:57:59', 1, 1),
(2, '¿Hay alguien a quien le gusten los Strings en Java? ¡Los odio!', '2024-03-07 09:57:59', 2, 1),
(4, 'Alguien sabe como descargar el mod del Heroes III en HD?', '2024-03-07 10:16:09', 2, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `temas`
--

CREATE TABLE `temas` (
  `tema_id` int(10) UNSIGNED NOT NULL,
  `tema_nombre` varchar(50) DEFAULT NULL,
  `tema_descripcion` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `temas`
--

INSERT INTO `temas` (`tema_id`, `tema_nombre`, `tema_descripcion`) VALUES
(1, 'Fútbol', 'En esta sección se pueden poner comentarios acerca de los partidos de la jornada, merado de fichajes, fútbol internacional... Sean bienvenidos al mejor foro de fútbol de España!'),
(2, 'Programación', 'Java, Python, C++.... ¿Tienes dudas acerca de algún lenguaje en concreto? Cuéntanos tus dudas, aquí hay muchos patos dispuestos a escucharte!'),
(4, 'Exclusivos PlayStation', 'God of War, Spiderman, The Last of Us...\r\nPlayStation y su catálogo de juegos propio da para muuchas líneas.\r\nPara vosotros, jugadores.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(10) UNSIGNED NOT NULL,
  `usu_alias` varchar(50) DEFAULT NULL,
  `usu_password` varchar(50) DEFAULT NULL,
  `usu_foto` varchar(50) DEFAULT NULL,
  `usu_admin` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_alias`, `usu_password`, `usu_foto`, `usu_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 'u10.gif', 1),
(2, 'batistaker47', '4a4f1931254afb6148a04c67bcdceba4', 'u15.gif', 0),
(5, 'pepopipu', 'b9577b57ae9a1592d1f1deb64041bca3', 'u09.gif', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD PRIMARY KEY (`mens_id`),
  ADD KEY `mens_tema_id` (`mens_tema_id`),
  ADD KEY `mens_usu_id` (`mens_usu_id`);

--
-- Indices de la tabla `temas`
--
ALTER TABLE `temas`
  ADD PRIMARY KEY (`tema_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_alias` (`usu_alias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `mensajes`
--
ALTER TABLE `mensajes`
  MODIFY `mens_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `temas`
--
ALTER TABLE `temas`
  MODIFY `tema_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `mensajes`
--
ALTER TABLE `mensajes`
  ADD CONSTRAINT `mensajes_ibfk_1` FOREIGN KEY (`mens_tema_id`) REFERENCES `temas` (`tema_id`),
  ADD CONSTRAINT `mensajes_ibfk_2` FOREIGN KEY (`mens_usu_id`) REFERENCES `usuarios` (`usu_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
