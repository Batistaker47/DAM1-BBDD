-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-04-2024 a las 10:22:21
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
-- Base de datos: `bd_trigger`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_nombre` varchar(50) NOT NULL,
  `cli_dni` varchar(50) NOT NULL,
  `cli_telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_nombre`, `cli_dni`, `cli_telefono`) VALUES
(3, 'Davidenko', '4357', '65675');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `ClienteAfterInsert` AFTER INSERT ON `clientes` FOR EACH ROW INSERT INTO histórico VALUES
(null,NEW.cli_id,null,null,null,NEW.cli_nombre,NEW.cli_dni,NEW.cli_telefono,1,now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ClientesAfterUpdate` AFTER UPDATE ON `clientes` FOR EACH ROW INSERT INTO histórico VALUES
(null,NEW.cli_id,OLD.cli_nombre,OLD.cli_dni,OLD.cli_telefono,NEW.cli_nombre,NEW.cli_dni,NEW.cli_telefono,1,now())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `ClientesBeforeDelete` BEFORE DELETE ON `clientes` FOR EACH ROW INSERT INTO histórico VALUES 
(null,OLD.cli_id,OLD.cli_nombre,OLD.cli_dni,OLD.cli_telefono,null,null,null,1,now())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `histórico`
--

CREATE TABLE `histórico` (
  `his_id` int(11) NOT NULL,
  `his_cli_id` int(11) DEFAULT NULL,
  `his_nombre_ant` varchar(50) DEFAULT NULL,
  `his_dni_ant` varchar(50) DEFAULT NULL,
  `his_telf_ant` varchar(50) DEFAULT NULL,
  `his_nombre_act` varchar(50) DEFAULT NULL,
  `his_dni_act` varchar(50) DEFAULT NULL,
  `his_telf_act` varchar(50) DEFAULT NULL,
  `his_usu_id` int(11) NOT NULL,
  `his_usu_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `histórico`
--

INSERT INTO `histórico` (`his_id`, `his_cli_id`, `his_nombre_ant`, `his_dni_ant`, `his_telf_ant`, `his_nombre_act`, `his_dni_act`, `his_telf_act`, `his_usu_id`, `his_usu_fecha`) VALUES
(1, 3, NULL, NULL, NULL, 'David', '4357', '65675', 1, '2024-04-04 07:34:06'),
(2, NULL, NULL, NULL, NULL, 'Jose', 'sjfbwk', 'jksvv', 1, '2024-04-04 07:34:52'),
(3, 3, 'David', '4357', '65675', 'Davidenko', '4357', '65675', 1, '2024-04-04 08:03:51'),
(5, NULL, 'Jose', 'sjfbwk', 'jksvv', NULL, NULL, NULL, 1, '2024-04-04 08:08:34'),
(6, NULL, NULL, NULL, NULL, 'Jesus', 'n slbv', 'sjkbv', 1, '2024-04-04 08:12:53'),
(7, NULL, 'Jesus', 'n slbv', 'sjkbv', NULL, NULL, NULL, 1, '2024-04-04 08:13:03'),
(8, NULL, NULL, NULL, NULL, 'Diego', 'uksbf', 'qnjsfd', 1, '2024-04-04 08:17:14'),
(9, NULL, 'Diego', 'uksbf', 'qnjsfd', NULL, NULL, NULL, 1, '2024-04-04 08:17:19'),
(10, NULL, NULL, NULL, NULL, 'aaa', 'aaa', 'aaa', 1, '2024-04-04 08:18:32'),
(11, NULL, 'aaa', 'aaa', 'aaa', NULL, NULL, NULL, 1, '2024-04-04 08:18:58');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nombre`) VALUES
(1, 'Admin');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `histórico`
--
ALTER TABLE `histórico`
  ADD PRIMARY KEY (`his_id`),
  ADD KEY `r-usuarios-historico` (`his_usu_id`),
  ADD KEY `r-cliente-historico` (`his_cli_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `histórico`
--
ALTER TABLE `histórico`
  MODIFY `his_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `histórico`
--
ALTER TABLE `histórico`
  ADD CONSTRAINT `r-cliente-historico` FOREIGN KEY (`his_cli_id`) REFERENCES `clientes` (`cli_id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `r-usuarios-historico` FOREIGN KEY (`his_usu_id`) REFERENCES `usuarios` (`usu_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
