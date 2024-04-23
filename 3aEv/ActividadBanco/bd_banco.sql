-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-04-2024 a las 12:42:05
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
-- Base de datos: `bd_banco`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_borrar` (IN `_id` INT)  begin
	DELETE FROM cuentas WHERE c_num_cta = _id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_insertar` (IN `_nif` VARCHAR(9), IN `_titular` VARCHAR(50))  begin
    INSERT INTO cuentas VALUES
	(null, _nif, _titular, current_date(), 0);
    SELECT last_insert_id() AS id_insertado;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_modificar` (IN `_nif` VARCHAR(9), IN `_titular` VARCHAR(50), IN `_fecha` DATE, IN `_id` INT)  begin
		UPDATE cuentas SET
        c_nif = _nif,
        c_titular = _titular,
        c_fecha_creacion = _fecha
        WHERE 
        c_num_cta = _id;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_por_id` (IN `_id` INT)  begin
		SELECT * FROM cuentas WHERE c_num_cta = _id
        order by c_titular;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_saldo_mayor` (IN `_cantidad` DECIMAL(10,2))  begin
		SELECT * FROM cuentas WHERE c_saldo > _cantidad
        order by c_titular;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_saldo_menor` (IN `_cantidad` DECIMAL(10,2))  begin
		SELECT * FROM cuentas WHERE c_saldo < _cantidad
        order by c_titular;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `cta_todas_filtrado` (IN `_filtro` VARCHAR(50))  begin
		SELECT * FROM cuentas WHERE 
		(c_num_cta LIKE concat('%',_filtro,'%')) OR 
        (c_nif LIKE concat('%',_filtro,'%')) OR 
        (c_titular LIKE concat('%',_filtro,'%')) OR 
        (c_fecha_creacion LIKE concat('%',_filtro,'%'))
        order by c_titular;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_borrar` (IN `_id` INT)  begin
	DELETE FROM movimientos WHERE m_id = _id;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_insertar` (IN `_idCuenta` INT, IN `_importe` DECIMAL(10,2), IN `_concepto` VARCHAR(50))  begin
    INSERT INTO movimientos VALUES
	(null, _idCuenta, current_date(),_importe ,_concepto );
    SELECT last_insert_id() AS id_insertado;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_mayor` (IN `_cantidad` DECIMAL(10,2))  begin
		SELECT * FROM movimientos WHERE m_importe > _cantidad
        order by m_fecha;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_modificar` (IN `_importe` DECIMAL(10,2), IN `_concepto` VARCHAR(50), IN `_id` INT)  begin
		UPDATE movimientos SET
        m_importe = _importe,
        m_concepto = _concepto
        WHERE 
        m_id = _id;
    end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_mvtos_entre_fechas` (IN `_cuenta` INT, IN `_desde` DATETIME, IN `_hasta` DATETIME)  begin
	SELECT * FROM movimientos 
    WHERE
    m_c_num_cta = _cuenta AND
    m_fecha >= _desde AND m_fecha < _hasta;
end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_todos_filtrado` (IN `_filtro` VARCHAR(50))  begin
		SELECT * FROM movimientos WHERE
        (m_id LIKE concat('%',_filtro,'%')) OR
		(m_c_num_cta LIKE concat('%',_filtro,'%')) OR 
        (m_fecha LIKE concat('%',_filtro,'%')) OR 
        (m_importe LIKE concat('%',_filtro,'%')) OR 
        (m_concepto LIKE concat('%',_filtro,'%'))
        order by m_fecha;
	end$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `m_todos_por_id` (IN `_id` INT)  begin
		SELECT * FROM movimientos WHERE m_id = _id
        order by m_fecha;
	end$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cuentas`
--

CREATE TABLE `cuentas` (
  `c_num_cta` int(10) UNSIGNED ZEROFILL NOT NULL,
  `c_nif` varchar(9) NOT NULL,
  `c_titular` varchar(50) NOT NULL,
  `c_fecha_creacion` date NOT NULL DEFAULT current_timestamp(),
  `c_saldo` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cuentas`
--

INSERT INTO `cuentas` (`c_num_cta`, `c_nif`, `c_titular`, `c_fecha_creacion`, `c_saldo`) VALUES
(0000000003, '05455317Q', 'David Pires Manzanares', '2024-04-23', '1500.00'),
(0000000004, '33529487A', 'Alex Álvarez de Sotomayor', '2024-04-23', '0.00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `movimientos`
--

CREATE TABLE `movimientos` (
  `m_id` int(11) NOT NULL,
  `m_c_num_cta` int(10) UNSIGNED ZEROFILL NOT NULL,
  `m_fecha` date NOT NULL DEFAULT current_timestamp(),
  `m_importe` decimal(10,2) DEFAULT NULL,
  `m_concepto` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `movimientos`
--

INSERT INTO `movimientos` (`m_id`, `m_c_num_cta`, `m_fecha`, `m_importe`, `m_concepto`) VALUES
(6, 0000000003, '2024-04-23', '1500.00', '\"NÓMINA\"');

--
-- Disparadores `movimientos`
--
DELIMITER $$
CREATE TRIGGER `trigger_mvto_aI` AFTER INSERT ON `movimientos` FOR EACH ROW UPDATE cuentas SET
	c_saldo = c_saldo + NEW.m_importe
WHERE 
	c_num_cta = NEW.m_c_num_cta
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_mvto_bd` BEFORE DELETE ON `movimientos` FOR EACH ROW UPDATE cuentas SET
c_saldo = c_saldo - OLD.m_importe
WHERE 
c_num_cta = OLD.m_c_num_cta
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trigger_mvto_bu` BEFORE UPDATE ON `movimientos` FOR EACH ROW UPDATE cuentas SET
c_saldo = (c_saldo - OLD.m_importe + NEW.m_importe)
WHERE 
c_num_cta = OLD.m_c_num_cta
$$
DELIMITER ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  ADD PRIMARY KEY (`c_num_cta`);

--
-- Indices de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD PRIMARY KEY (`m_id`),
  ADD KEY `m_c_num_cta` (`m_c_num_cta`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cuentas`
--
ALTER TABLE `cuentas`
  MODIFY `c_num_cta` int(10) UNSIGNED ZEROFILL NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `movimientos`
--
ALTER TABLE `movimientos`
  MODIFY `m_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `movimientos`
--
ALTER TABLE `movimientos`
  ADD CONSTRAINT `movimientos_ibfk_1` FOREIGN KEY (`m_c_num_cta`) REFERENCES `cuentas` (`c_num_cta`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
