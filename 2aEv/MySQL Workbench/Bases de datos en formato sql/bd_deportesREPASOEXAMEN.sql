-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-02-2024 a las 13:57:50
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
-- Base de datos: `deportes`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_borrar` (IN `id` INT)  DELETE FROM deportes
WHERE dep_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Insertar` (IN `nombre` VARCHAR(50))  INSERT INTO deportes VALUES 
(null,nombre)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Modificar` (IN `id` INT, IN `nombre` VARCHAR(50))  UPDATE deportes SET 
	dep_nombre = nombre
WHERE
	dep_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Seleccionar_por_ID` (IN `id` INT)  SELECT * FROM deportes WHERE dep_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Seleccionar_Todo` ()  SELECT * FROM deportes ORDER BY dep_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_cuantos_deportes` (IN `nombre` VARCHAR(50))  SELECT nombre, COUNT(dd_dep_id) FROM deportistas, deportes_deportistas
WHERE
    dta_id = dd_dta_id AND
    dta_nombre = nombre
GROUP BY
	dta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_filtro` (IN `filtro` VARCHAR(50))  SELECT * FROM deportistas
WHERE
    dta_nombre LIKE filtro$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_filtro_edad` (IN `desde` INT, IN `hasta` INT)  SELECT * FROM deportistas
WHERE
    dta_edad >= desde AND dta_edad <= hasta$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_filtro_más_viejo` (IN `cuantos` INT)  SELECT * FROM deportistas
ORDER BY dta_edad DESC
LIMIT cuantos$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_Insertar` (IN `nombre` VARCHAR(50), IN `apellidos` VARCHAR(50), IN `edad` INT)  INSERT INTO deportistas VALUES
	(null,nombre,apellidos,edad)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_Modificar` (IN `nombre` VARCHAR(50), IN `apellidos` VARCHAR(50), IN `edad` INT, IN `id` INT)  UPDATE deportistas SET
	dta_nombre = nombre,
    dta_apellidos = apellidos,
    dta_edad = edad
WHERE
	dta_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_Seleccionar_Todo` ()  SELECT * FROM deportistas ORDER BY dta_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_subconsultas` (IN `deporte1` VARCHAR(50), IN `deporte2` VARCHAR(50))  SELECT dta_nombre, dta_apellidos, dta_edad FROM 
deportistas, 
deportes_deportistas, 
deportes
WHERE
	dep_id = dd_dep_id AND
	dta_id = dd_dta_id AND
    (dep_nombre = deporte1 OR dep_nombre = deporte2)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_subconsultas2` (IN `deporte1` VARCHAR(50), IN `deporte2` VARCHAR(50))  SELECT * FROM deportistas
WHERE
    dta_id IN
    (
        #DE LOS DEPORTES CUYO NOMBRE SEA DEPORTE1 O DEPORTE2
        SELECT 
        	dd_dta_id 
        FROM 
        	deportes_deportistas, deportes 
        WHERE 
        	dd_dep_id = dep_id AND 
        	dep_nombre IN (deporte1,deporte2)
    )$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dep_id` int(10) UNSIGNED NOT NULL,
  `dep_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dep_id`, `dep_nombre`) VALUES
(2, 'Baloncesto'),
(1, 'Fútbol'),
(3, 'Golf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes_deportistas`
--

CREATE TABLE `deportes_deportistas` (
  `dd_dep_id` int(10) UNSIGNED NOT NULL,
  `dd_dta_id` int(11) NOT NULL,
  `dd_valoracion` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes_deportistas`
--

INSERT INTO `deportes_deportistas` (`dd_dep_id`, `dd_dta_id`, `dd_valoracion`) VALUES
(1, 1, 100),
(1, 2, 0),
(2, 1, 0),
(2, 3, 0),
(3, 1, 0),
(3, 3, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `dta_id` int(11) NOT NULL,
  `dta_nombre` varchar(50) NOT NULL,
  `dta_apellidos` varchar(50) NOT NULL,
  `dta_edad` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`dta_id`, `dta_nombre`, `dta_apellidos`, `dta_edad`) VALUES
(1, 'David', 'Pires', 26),
(2, 'Lucía', 'Sánchez', 25),
(3, 'Jose', 'Alcaraz', 28),
(4, 'Gonzalo', 'Sánchez', 20);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dep_id`),
  ADD UNIQUE KEY `dep_nombre` (`dep_nombre`);

--
-- Indices de la tabla `deportes_deportistas`
--
ALTER TABLE `deportes_deportistas`
  ADD PRIMARY KEY (`dd_dep_id`,`dd_dta_id`),
  ADD KEY `dd_dta_id` (`dd_dta_id`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`dta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dep_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `dta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deportes_deportistas`
--
ALTER TABLE `deportes_deportistas`
  ADD CONSTRAINT `deportes_deportistas_ibfk_1` FOREIGN KEY (`dd_dep_id`) REFERENCES `deportes` (`dep_id`),
  ADD CONSTRAINT `deportes_deportistas_ibfk_2` FOREIGN KEY (`dd_dta_id`) REFERENCES `deportistas` (`dta_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
