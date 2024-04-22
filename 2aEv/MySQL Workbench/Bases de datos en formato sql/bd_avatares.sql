-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-02-2024 a las 09:00:44
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
-- Base de datos: `bd_personas`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `personas_eliminar` (IN `id` INT)  DELETE FROM personas
WHERE
	per_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `personas_Insertar` (IN `descripcion` VARCHAR(50), IN `foto` VARCHAR(50))  INSERT INTO personas VALUES
(null, descripcion,foto)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `personas_modificar` (IN `id` INT, IN `descripcion` VARCHAR(50), IN `foto` VARCHAR(50))  UPDATE personas SET
	per_descripcion = descripcion,
    per_foto = foto
WHERE
	per_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `personas_seleccionar_por_ID` (IN `id` INT)  SELECT * FROM personas WHERE per_id = id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `personas_seleccionar_todo` ()  SELECT * FROM personas$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `per_id` int(11) NOT NULL,
  `per_descripcion` varchar(50) NOT NULL,
  `per_foto` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`per_id`, `per_descripcion`, `per_foto`) VALUES
(1, 'Con gafas', 'ConGafas.png'),
(2, 'Con gafas y pañuelo', 'ConGafasyHiyab.png'),
(3, 'Jeque', 'jeque.png'),
(4, 'Pelo negro y piel negra', 'negro.pmg'),
(5, 'Abuelo', 'abuelo.png'),
(6, 'Steve Jobs', 'SteveJobs.png'),
(7, 'Tomas', 'Tomas.png'),
(8, 'Mujer Calva', 'mujerCalva.png');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas`
--
ALTER TABLE `personas`
  ADD PRIMARY KEY (`per_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas`
--
ALTER TABLE `personas`
  MODIFY `per_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
