-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-09-2023 a las 14:12:58
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
-- Base de datos: `bd_empresa`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamentos`
--

CREATE TABLE `departamentos` (
  `ID_dep` int(11) NOT NULL,
  `Nombre_dep` varchar(50) NOT NULL,
  `Observaciones_dep` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `departamentos`
--

INSERT INTO `departamentos` (`ID_dep`, `Nombre_dep`, `Observaciones_dep`) VALUES
(1, 'COMERCIAL', 'No hacen nada'),
(2, 'ADMINISTRACIÓN', 'Burocracia'),
(3, 'INFORMÁTICA', 'Los mejores');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `ID_empleado` int(11) NOT NULL,
  `Nombre_empleado` varchar(50) NOT NULL,
  `Apellidos_empleado` varchar(50) NOT NULL,
  `Dep_ID_empleado` int(11) NOT NULL,
  `Sueldo_empleado` decimal(10,2) NOT NULL,
  `Telefono_empleado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`ID_empleado`, `Nombre_empleado`, `Apellidos_empleado`, `Dep_ID_empleado`, `Sueldo_empleado`, `Telefono_empleado`) VALUES
(1, 'Pepe', 'Gómez', 1, '1.00', '(34) 666 66 66 66'),
(2, 'Eva', 'Ruíz', 1, '1400.00', '(34) 444 44 44 44'),
(3, 'Ana', 'López', 2, '1000.00', '777777777'),
(4, 'Juan', 'Rodríguez', 3, '2000.00', '333.33.33.33'),
(5, 'Evaristo', 'Hu', 2, '1000.00', ''),
(8, 'David', 'Pires', 3, '150000.00', '');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  ADD PRIMARY KEY (`ID_dep`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`ID_empleado`),
  ADD KEY `R-Empleados-Departamentos` (`Dep_ID_empleado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `departamentos`
--
ALTER TABLE `departamentos`
  MODIFY `ID_dep` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `ID_empleado` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD CONSTRAINT `R-Empleados-Departamentos` FOREIGN KEY (`Dep_ID_empleado`) REFERENCES `departamentos` (`ID_dep`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
