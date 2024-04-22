-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 11-10-2023 a las 11:59:08
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
-- Base de datos: `bd_restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `cat_id` int(11) NOT NULL,
  `cat_nombre` varchar(50) NOT NULL,
  `cat_descripcion` text NOT NULL,
  `cat_encargado` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `ing_id` int(11) NOT NULL,
  `ing_nombre` varchar(50) NOT NULL,
  `ing_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos`
--

CREATE TABLE `platos` (
  `pl_id` int(11) NOT NULL,
  `pl_nombre` varchar(50) NOT NULL,
  `pl_descripcion` mediumtext NOT NULL,
  `pl_dificultad` varchar(20) NOT NULL,
  `pl_foto` varchar(50) NOT NULL,
  `pl_precio` decimal(10,2) NOT NULL,
  `cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `platos_ingredientes`
--

CREATE TABLE `platos_ingredientes` (
  `pi_pl_id` int(11) NOT NULL,
  `pi_ing_id` int(11) NOT NULL,
  `pi_cantidad` int(11) NOT NULL,
  `pi_medida` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`ing_id`);

--
-- Indices de la tabla `platos`
--
ALTER TABLE `platos`
  ADD PRIMARY KEY (`pl_id`),
  ADD KEY `r-platos-categoria` (`cat_id`);

--
-- Indices de la tabla `platos_ingredientes`
--
ALTER TABLE `platos_ingredientes`
  ADD PRIMARY KEY (`pi_pl_id`,`pi_ing_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `ing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `platos`
--
ALTER TABLE `platos`
  MODIFY `pl_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `platos`
--
ALTER TABLE `platos`
  ADD CONSTRAINT `r-platos-categoria` FOREIGN KEY (`cat_id`) REFERENCES `categoria` (`cat_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-platos-platos_ingredientes` FOREIGN KEY (`pl_id`) REFERENCES `platos_ingredientes` (`pi_pl_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `platos_ingredientes`
--
ALTER TABLE `platos_ingredientes`
  ADD CONSTRAINT `r-ingredientes-platos_ingredientes` FOREIGN KEY (`pi_ing_id`) REFERENCES `ingredientes` (`ing_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
