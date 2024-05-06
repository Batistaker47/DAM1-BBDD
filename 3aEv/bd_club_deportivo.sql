-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 06-05-2024 a las 11:29:55
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
-- Base de datos: `bd_club_deportivo`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `anuncios_eliminar` (IN `_id` INT)  DELETE FROM anuncios WHERE anun_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `anuncios_insertar` (IN `_texto` TEXT, IN `_alta` DATE, IN `_baja` DATE)  INSERT INTO anuncios VALUES
(null, _texto , _alta, _baja )$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `anuncios_modificar` (IN `_texto` TEXT, IN `_alta` DATE, IN `_baja` DATE, IN `_id` INT)  NO SQL
    COMMENT 'Funcion para modificar anuncios'
UPDATE anuncios SET
	anun_texto = _texto,
    anun_fecha_alta = _alta,
    anun_fecha_baja = _baja
WHERE 
	anun_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `anuncios_seleccionar_todo` ()  SELECT * FROM anuncios$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `anuncios_select_by_id` (IN `_id` INT)  NO SQL
    COMMENT 'Funcion para seleccionar los anuncios por id'
SELECT * FROM anuncios WHERE anun_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_eliminar` (IN `_id` INT)  DELETE FROM deportes WHERE dte_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Insertar` (IN `_nombre` VARCHAR(50), IN `_baja` DATE)  NO SQL
    COMMENT 'Función para insertar deportes'
INSERT INTO deportes VALUES
(null, _nombre, CURRENT_TIMESTAMP, _baja)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_modificar` (IN `_nombre` VARCHAR(50), IN `_fecha_alta` DATE, IN `_fecha_baja` DATE, IN `_id` INT)  NO SQL
    COMMENT 'Función para modificar deportes'
UPDATE deportes SET
	dte_nombre = _nombre,
    dte_fecha_alta = _fecha_alta,
    dte_fecha_baja = _fecha_baja
WHERE
	dte_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Select_All` ()  SELECT * FROM deportes ORDER BY dte_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportes_Select_by_Id` (IN `_id` INT)  NO SQL
    COMMENT 'Función para seleccionar todos los deportes por ID'
SELECT * FROM deportes WHERE dte_id = _id ORDER BY dte_nombre$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_eliminar` (IN `_id` INT(50))  DELETE FROM deportistas WHERE dta_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_Insertar` (IN `_nombre` VARCHAR(50), IN `_password` VARCHAR(50), IN `_telefono` VARCHAR(50), IN `_alta` DATE, IN `_baja` DATE, IN `_admin` BOOLEAN)  INSERT INTO deportistas VALUES
	(null, _nombre, md5(_password), _telefono ,_alta,_baja,_admin)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_modificar` (IN `_nombre` VARCHAR(50), IN `_password` VARCHAR(50), IN `_telefono` VARCHAR(50), IN `_alta` DATE, IN `_baja` DATE, IN `_admin` BOOLEAN, IN `_id` INT)  UPDATE deportistas SET
	dta_nombre = _nombre,
    dta_password = md5(_password),
    dta_telefono = _telefono,
    dta_fecha_alta = _alta,
    dta_fecha_baja = _baja,
    dta_admin = _admin
WHERE dta_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_select_all` ()  SELECT * FROM deportistas ORDER BY dta_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `deportistas_select_by_id` (IN `_id` INT)  NO SQL
    COMMENT 'Funcion para seleccionar deportistas por su id'
SELECT * FROM deportistas WHERE dta_id = _id$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `anuncios`
--

CREATE TABLE `anuncios` (
  `anun_id` int(11) NOT NULL,
  `anun_texto` text NOT NULL,
  `anun_fecha_alta` date DEFAULT NULL,
  `anun_fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `anuncios`
--

INSERT INTO `anuncios` (`anun_id`, `anun_texto`, `anun_fecha_alta`, `anun_fecha_baja`) VALUES
(1, 'El próximo día <b>2024-05-02</b> comenzará un curso de <b>xxxxxxxxxxx</b>.<br>Apúntate!!!', '2024-05-01', '2024-05-31'),
(2, 'Compre Cocacola<BR>o<BR>FantaO<br>o<BR>Schweppes', '2024-04-30', '2024-04-01'),
(3, 'Visite nuestro bar', '2024-10-24', '2024-05-02'),
(4, 'El próximo día <b>2024-05-02</b> comenzará un curso de <b>bbbbbbbbbbbbb</b>.<br>Apúntate!!!', '2024-05-02', '2024-06-19'),
(8, 'El próximo día <b>2024-05-02</b> comenzará un curso de <b>sdfsdsdf</b>', '2024-05-02', '0000-00-00'),
(9, 'El próximo día <b>2024-05-02</b> comenzará un curso de <b>sgsgg</b> y finalizará el día <b>2024-10-01</b>', '2024-05-02', '2024-10-01'),
(13, 'El día 2024-05-04 comienza un curso de -trig-.<br>Termina el día 2050-12-31.<br><br>¡¡ Apúntate !!', '2050-12-31', '2024-05-04');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dte_id` int(11) NOT NULL,
  `dte_nombre` varchar(50) NOT NULL,
  `dte_fecha_alta` date DEFAULT NULL,
  `dte_fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dte_id`, `dte_nombre`, `dte_fecha_alta`, `dte_fecha_baja`) VALUES
(1, 'Fútbol', '2024-05-02', NULL),
(2, 'Golf', '2024-05-02', NULL),
(3, 'Baloncesto', '2024-05-02', NULL),
(4, 'Pádel', '2024-05-02', NULL),
(5, 'Bádminton', '2024-05-02', NULL),
(6, 'Judo', '2024-05-02', NULL),
(7, 'Tenis', '2024-05-02', NULL),
(15, 'r', '2024-05-02', NULL),
(17, 'perico', '2024-05-02', NULL),
(18, 'xxxxxxxxxxx', '2024-05-02', NULL),
(19, 'bbbbbbbbbbbbb', '2024-05-02', NULL),
(20, 'sdfsdsdf', '2024-05-02', '2050-12-31'),
(21, 'sgsgg', '2024-05-02', '2024-10-01'),
(22, 'Hípica', NULL, NULL),
(23, 'Hípica', NULL, NULL),
(24, 'hockey', '2024-05-02', NULL),
(25, 'pingpong', '2024-05-02', '2024-05-23'),
(26, 'Motos', '2024-05-03', NULL),
(32, 'trig', '2024-05-04', '2050-12-31');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes_deportistas`
--

CREATE TABLE `deportes_deportistas` (
  `dte_id` int(11) NOT NULL,
  `dta_id` int(11) NOT NULL,
  `dd_fecha_alta` date NOT NULL DEFAULT current_timestamp(),
  `dd_fecha_baja` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes_deportistas`
--

INSERT INTO `deportes_deportistas` (`dte_id`, `dta_id`, `dd_fecha_alta`, `dd_fecha_baja`) VALUES
(1, 2, '2024-05-01', NULL),
(2, 4, '2024-05-01', NULL),
(3, 1, '2024-05-01', NULL),
(4, 3, '2024-05-01', NULL),
(5, 7, '2024-05-01', NULL),
(6, 5, '2024-05-01', NULL),
(7, 7, '2024-05-01', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `dta_id` int(11) NOT NULL,
  `dta_nombre` varchar(50) NOT NULL,
  `dta_password` varchar(50) NOT NULL,
  `dta_telefono` varchar(20) NOT NULL,
  `dta_fecha_alta` date DEFAULT NULL,
  `dta_fecha_baja` date DEFAULT NULL,
  `dta_admin` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`dta_id`, `dta_nombre`, `dta_password`, `dta_telefono`, `dta_fecha_alta`, `dta_fecha_baja`, `dta_admin`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '', '2024-05-02', NULL, 1),
(2, 'Pablo', '63fb1088241b0acdd7987af0c1f4f7e6', '', '2024-05-02', NULL, 0),
(3, 'Jorge', 'f4a1c8901a3d406f17af67144a3ec71a', '', '2024-05-02', NULL, 0),
(4, 'Loreto', '279583571681a868005a5d7d3af9e0d4', '', '2024-05-02', NULL, 0),
(5, 'Andrea', '28f719c89ef7f33ce2e178490676b5ab', '', '2024-05-02', NULL, 0),
(6, 'Claudia', 'bb07c989b57c25fd7e53395c3e118185', '', '2024-05-02', NULL, 0),
(7, 'Jesus', 'e9829608dd90ff6b8bf7cb50746eae78', '', '2024-05-02', NULL, 0),
(8, 'Sergio', 'dc1d67d1a5e9d52940945516548c8ec3', '', '2024-05-02', NULL, 0),
(9, 'jdf', '1e0fc2a2b65e452f24c6f0c3447dbc95', '', '2024-05-02', NULL, 0),
(10, 'lol', '9cdfb439c7876e703e307864c9167a15', '', '2024-05-02', NULL, 0),
(12, 'xxxx', 'ea416ed0759d46a8de58f63a59077499', 'xxxx', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `facturacion`
--

CREATE TABLE `facturacion` (
  `fac_fecha` date NOT NULL,
  `fac_dta_id` int(11) NOT NULL,
  `fac_num_deportes` int(11) NOT NULL,
  `fac_importe` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  ADD PRIMARY KEY (`anun_id`);

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dte_id`);

--
-- Indices de la tabla `deportes_deportistas`
--
ALTER TABLE `deportes_deportistas`
  ADD PRIMARY KEY (`dte_id`,`dta_id`),
  ADD KEY `dta_id` (`dta_id`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`dta_id`);

--
-- Indices de la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD UNIQUE KEY `fac_fecha` (`fac_fecha`,`fac_dta_id`),
  ADD KEY `r_fac_dta` (`fac_dta_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `anuncios`
--
ALTER TABLE `anuncios`
  MODIFY `anun_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=34;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `dta_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `deportes_deportistas`
--
ALTER TABLE `deportes_deportistas`
  ADD CONSTRAINT `deportes_deportistas_ibfk_1` FOREIGN KEY (`dte_id`) REFERENCES `deportes` (`dte_id`),
  ADD CONSTRAINT `deportes_deportistas_ibfk_2` FOREIGN KEY (`dta_id`) REFERENCES `deportistas` (`dta_id`);

--
-- Filtros para la tabla `facturacion`
--
ALTER TABLE `facturacion`
  ADD CONSTRAINT `r_fac_dta` FOREIGN KEY (`fac_dta_id`) REFERENCES `deportistas` (`dta_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
