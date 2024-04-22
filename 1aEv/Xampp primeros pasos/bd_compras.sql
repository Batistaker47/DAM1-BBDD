-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-10-2023 a las 12:22:49
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
-- Base de datos: `bd_compras`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_id` int(11) NOT NULL,
  `cli_nombre` varchar(50) NOT NULL,
  `cli_apellidos` varchar(50) NOT NULL,
  `cli_direccion` varchar(50) NOT NULL,
  `cli_telefono` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_id`, `cli_nombre`, `cli_apellidos`, `cli_direccion`, `cli_telefono`) VALUES
(1, 'Pepe', 'Ruiz', 'C/x', '661661661'),
(2, 'Juan', 'Alvarez', 'C/y', '662662662'),
(3, 'Ana', 'Alonso', 'Avda/z', '777777777'),
(4, 'Eva', 'Perez', 'Pl/w', '999999999');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes_productos`
--

CREATE TABLE `clientes_productos` (
  `cp_cli_id` int(11) NOT NULL,
  `cp_prod_id` int(11) NOT NULL,
  `cp_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `clientes_productos`
--

INSERT INTO `clientes_productos` (`cp_cli_id`, `cp_prod_id`, `cp_fecha`) VALUES
(2, 1, '2023-10-06 10:09:57'),
(2, 6, '2023-10-06 10:10:53'),
(3, 2, '2023-10-06 10:09:24'),
(3, 3, '2023-10-06 10:09:24'),
(4, 1, '2023-10-06 10:09:57');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prod_id` int(11) NOT NULL,
  `prod_nombre` varchar(50) NOT NULL,
  `prod_precio` decimal(10,2) NOT NULL,
  `prod_descripcion` mediumtext NOT NULL,
  `prod_stock` int(11) NOT NULL,
  `prod_prov_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prod_id`, `prod_nombre`, `prod_precio`, `prod_descripcion`, `prod_stock`, `prod_prov_id`) VALUES
(1, 'Flores', '22.00', 'Rosas y claveles', 7000, 1),
(2, 'Cerezas', '5.00', 'Murcia, muy ricas', 7000000, 2),
(3, 'Balones', '15.99', 'Redondo y del Mundial de fútbol', 3000, 3),
(4, 'Cacahuetes', '2.05', 'Almería y de Rusia', 400, 2),
(6, 'x', '20.00', '20', 1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `prov_id` int(11) NOT NULL,
  `prov_nombre` varchar(50) NOT NULL,
  `prov_apellidos` varchar(50) NOT NULL,
  `prov_direccion` varchar(50) NOT NULL,
  `prov_provincia` varchar(50) NOT NULL,
  `prov_telefono` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`prov_id`, `prov_nombre`, `prov_apellidos`, `prov_direccion`, `prov_provincia`, `prov_telefono`) VALUES
(1, 'Prov1', '1-1', 'C/kajaja', 'Madrid', '333333333'),
(2, 'Prov2', '2-2', 'C/sldmvñsv', 'Barcelona', '000000000'),
(3, 'Prov3', '3-3', 'C/spvmox', 'Ciudad Real', '888484675');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_id`);

--
-- Indices de la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD PRIMARY KEY (`cp_cli_id`,`cp_prod_id`,`cp_fecha`),
  ADD KEY `r_cp_productos` (`cp_prod_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prod_id`),
  ADD KEY `r_productos_proveedores` (`prod_prov_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`prov_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `cli_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `prod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `prov_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clientes_productos`
--
ALTER TABLE `clientes_productos`
  ADD CONSTRAINT `r_cp_clientes` FOREIGN KEY (`cp_cli_id`) REFERENCES `clientes` (`cli_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r_cp_productos` FOREIGN KEY (`cp_prod_id`) REFERENCES `productos` (`prod_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `r_productos_proveedores` FOREIGN KEY (`prod_prov_id`) REFERENCES `proveedores` (`prov_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
