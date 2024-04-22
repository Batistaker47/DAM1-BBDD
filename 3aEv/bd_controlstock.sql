-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 10:19:21
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
-- Base de datos: `bd_controlstock`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_nombre`) VALUES
(1, 'Cliente 1'),
(2, 'Cliente 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradas_stock`
--

CREATE TABLE `entradas_stock` (
  `es_id` int(11) NOT NULL,
  `es_prov_id` int(11) NOT NULL,
  `es_prod_id` int(11) NOT NULL,
  `es_cantidad` int(11) NOT NULL,
  `es_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `entradas_stock`
--

INSERT INTO `entradas_stock` (`es_id`, `es_prov_id`, `es_prod_id`, `es_cantidad`, `es_fecha`) VALUES
(1, 1, 1, 190, '2024-04-02 08:01:01'),
(3, 1, 1, 188, '2024-04-02 08:15:12'),
(4, 1, 1, 200, '2024-04-02 08:15:31');

--
-- Disparadores `entradas_stock`
--
DELIMITER $$
CREATE TRIGGER `AfterInsertEntrada` AFTER INSERT ON `entradas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock + NEW.es_cantidad
WHERE prod_id = NEW.es_prod_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeDeleteEntradas` BEFORE DELETE ON `entradas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock - OLD.es_cantidad
WHERE
prod_id = OLD.es_prod_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeUpdateEntrada` BEFORE UPDATE ON `entradas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock - OLD.es_cantidad + NEW.es_cantidad
WHERE
prod_id = OLD.es_prod_id
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prod_id` int(11) NOT NULL,
  `prod_nombre` varchar(50) NOT NULL,
  `prod_precioEntrada` decimal(10,2) NOT NULL,
  `prod_precioVenta` decimal(10,2) NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prod_id`, `prod_nombre`, `prod_precioEntrada`, `prod_precioVenta`, `prod_stock`, `prod_prov_id`) VALUES
(1, 'Regalices', '1.00', '2.00', 150, 1),
(2, 'Chicles', '0.50', '1.50', 0, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `prov_id` int(11) NOT NULL,
  `prov_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`prov_id`, `prov_nombre`) VALUES
(1, 'Proveedor 1'),
(2, 'Proveedor 2');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas_stock`
--

CREATE TABLE `salidas_stock` (
  `se_id` int(11) NOT NULL,
  `se_cli_id` int(11) NOT NULL,
  `se_prod_id` int(11) NOT NULL,
  `se_cantidad` int(11) NOT NULL,
  `se_fecha` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `salidas_stock`
--

INSERT INTO `salidas_stock` (`se_id`, `se_cli_id`, `se_prod_id`, `se_cantidad`, `se_fecha`) VALUES
(6, 1, 1, 50, '2024-04-02 08:15:45');

--
-- Disparadores `salidas_stock`
--
DELIMITER $$
CREATE TRIGGER `AfterInsertSalida` AFTER INSERT ON `salidas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock - NEW.se_cantidad
WHERE
	prod_id = NEW.se_prod_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeDeleteSalidas` BEFORE DELETE ON `salidas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock + OLD.se_cantidad
WHERE
	prod_id = OLD.se_prod_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeUpdateSalidas` BEFORE UPDATE ON `salidas_stock` FOR EACH ROW UPDATE productos SET
prod_stock = prod_stock + OLD.se_cantidad - NEW.se_cantidad
WHERE
	prod_id = NEW.se_prod_id
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `entradas_stock`
--
ALTER TABLE `entradas_stock`
  ADD PRIMARY KEY (`es_id`),
  ADD KEY `r-es-proveedores` (`es_prov_id`),
  ADD KEY `r-es-productos` (`es_prod_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `r-prod-prov` (`prod_prov_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`prov_id`);

--
-- Indices de la tabla `salidas_stock`
--
ALTER TABLE `salidas_stock`
  ADD PRIMARY KEY (`se_id`),
  ADD KEY `r-es-proveedores` (`se_cli_id`),
  ADD KEY `r-es-productos` (`se_prod_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `entradas_stock`
--
ALTER TABLE `entradas_stock`
  MODIFY `es_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `salidas_stock`
--
ALTER TABLE `salidas_stock`
  MODIFY `se_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `entradas_stock`
--
ALTER TABLE `entradas_stock`
  ADD CONSTRAINT `r-es-productos` FOREIGN KEY (`es_prod_id`) REFERENCES `productos` (`prod_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-es-proveedores` FOREIGN KEY (`es_prov_id`) REFERENCES `proveedores` (`prov_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `r-prod-prov` FOREIGN KEY (`prod_prov_id`) REFERENCES `proveedores` (`prov_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `salidas_stock`
--
ALTER TABLE `salidas_stock`
  ADD CONSTRAINT `r-se-clientes` FOREIGN KEY (`se_cli_id`) REFERENCES `clientes` (`cli_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-se-productos` FOREIGN KEY (`se_prod_id`) REFERENCES `productos` (`prod_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
