-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-04-2024 a las 09:16:56
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
-- Base de datos: `bd_pedidos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Clientes_Cargar_Por_Codigo` (IN `codigo` VARCHAR(4))  SELECT * FROM clientes WHERE cli_codigo = codigo$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clientes_Cargar_Todos` ()  SELECT * FROM clientes ORDER BY cli_empresa$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clientes_Eliminar` (IN `cod` VARCHAR(4))  NO SQL
    COMMENT 'Eliminar todos los datos de una empresa según su código'
DELETE FROM clientes
WHERE 
	cli_codigo = cod$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clientes_Insertar` (IN `codigo` VARCHAR(4), IN `empresa` VARCHAR(30), IN `direccion` VARCHAR(60), IN `poblacion` VARCHAR(20), IN `telefono` VARCHAR(16), IN `responsable` VARCHAR(30))  INSERT INTO clientes VALUES
(codigo,empresa,direccion,poblacion,telefono,responsable,'')$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Clientes_Modificar` (IN `cod` VARCHAR(4), IN `emp` VARCHAR(30), IN `dir` VARCHAR(50), IN `pob` VARCHAR(20), IN `tel` VARCHAR(16), IN `resp` VARCHAR(30))  UPDATE clientes SET
	cli_empresa = emp,
    cli_direccion = dir,
    cli_poblacion = pob,
    cli_telefono = tel,
    cli_responsable = resp
WHERE
	cli_codigo = cod$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `Gracias` (`cadena` CHAR(20)) RETURNS CHAR(50) CHARSET utf8 COLLATE utf8_spanish_ci RETURN CONCAT('Muchas Gracias ', cadena,'!')$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `agrupacion por pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `agrupacion por pedidos` (
`NUMERO` int(11)
,`ARTICULOS` bigint(21)
,`IMPORTE` decimal(42,2)
,`MAXIMO_UDS` int(11)
,`MINIMO_UDS` int(11)
,`MEDIA_UDS` decimal(14,4)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `calculo_iva`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `calculo_iva` (
`prod_seccion` varchar(30)
,`prod_nombre` varchar(30)
,`PRECIO SIN IVA` decimal(10,2)
,`prod_iva` int(10)
,`PRECIO CON IVA` decimal(25,6)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `cli_codigo` varchar(4) NOT NULL,
  `cli_empresa` varchar(30) DEFAULT NULL,
  `cli_direccion` varchar(50) DEFAULT NULL,
  `cli_poblacion` varchar(20) DEFAULT NULL,
  `cli_telefono` varchar(16) DEFAULT NULL,
  `cli_responsable` varchar(30) DEFAULT NULL,
  `cli_historial` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`cli_codigo`, `cli_empresa`, `cli_direccion`, `cli_poblacion`, `cli_telefono`, `cli_responsable`, `cli_historial`) VALUES
('CT01', 'BELTRÁN E HIJOS', 'LAS FUENTES 78', 'MADRID', '(914) 45- 64- 35', 'ANGEL MARTÍNEZ', ''),
('CT02', 'LA MODERNA', 'LA PALOMA 123', 'OVIEDO', '(985) 32- 34- 34', 'JUAN GARCÍA', ''),
('CT03', 'EL ESPAÑOLITO', 'MOTORES 34', 'BARCELONA', '(934) 56- 53- 43', 'ANA FERNÁNDEZ', ''),
('CT04', 'EXPORTASA', 'VALLECAS 34', 'MADRID', '(913) 45- 23- 78', 'ELVIRA GÓMEZ', ''),
('CT06', 'CONFECCIONES AMPARO', 'LOS MOROS 23', 'GIJÓN', '(985) 75- 43- 32', 'LUÍS ÁLVAREZ', ''),
('CT07', 'LA CASA DEL JUGUETE', 'AMÉRICA 45', 'MADRID', '(912) 64- 99- 87', 'ELÍAS PÉREZ', ''),
('CT08', 'JUGUETERÍA SUÁREZ', 'PARIS 123', 'BARCELONA', '(933) 45- 78- 66', 'JUAN GARCÍA', ''),
('CT09', 'ALMACÉN POPULAR', 'LAS FUENTES 124', 'BILBAO', '(942) 34- 71- 27', 'JOSÉ ÁLVAREZ', ''),
('CT10', 'FERETERÍA EL CLAVO', 'PASEO DE ÁLAMOS 78', 'MADRID', '(914) 35- 48- 66', 'MANUEL MENÉNDEZ', ''),
('CT11', 'JUGUETES MARTÍNEZ', 'VIA LAYETANA 245', 'BARCELONA', '(936) 62- 85- 54', 'FRANCISCO CUEVAS', ''),
('CT12', 'FERNÁNDEZ SL', 'PASEO DEL MAR 45', 'SANTANDER', '(942) 04- 95- 86', 'ELISA COLLADO', ''),
('CT13', 'CONFECCIONES ARTÍMEZ', 'GENERAL PERÓN 45', 'A CORUÑA', '(981) 34- 52- 39', 'ESTEBAN PASCUAL', ''),
('CT14', 'DEPORTES GARCÍA', 'GUZMÁN EL BUENO 45', 'MADRID', '(913) 29- 94- 75', 'ANA JIMÉNEZ', ''),
('CT15', 'EXCLUSIVAS FERNÁNDEZ', 'LLOBREGAT 250', 'BARCELONA', '(939) 55- 83- 65', 'LUISA FERNÁNDEZ', ''),
('CT16', 'DEPORTES MORÁN', 'AUTONOMÍA 45', 'LUGO', '(982) 98- 69- 44', 'JOSÉ MANZANO', ''),
('CT17', 'BAZAR FRANCISCO', 'CARMEN 45', 'ZAMORA', '(980) 49- 52- 88', 'CARLOS BELTRÁN', ''),
('CT18', 'JUGUETES LA SONRISA', 'LA BAÑEZA 67', 'LEÓN', '(987) 94- 53- 68', 'FAUSTINO PÉREZ', ''),
('CT19', 'CONFECCIONES GALÁN', 'FUENCARRAL 78', 'MADRID', '(913) 85- 92- 34', 'JUAN GARCÍA', ''),
('CT20', 'LA CURTIDORA', 'OLIVARES 3', 'MÁLAGA', '(953) 75- 62- 59', 'MARÍA GÓMEZ', ''),
('CT21', 'LÍNEA JOVEN', 'SIERPES 78', 'SEVILLA', '(953) 45- 25- 67', 'ASUNCIÓN SALADO', ''),
('CT22', 'BAZAR EL BARAT', 'DIAGONAL 56', 'BARCELONA', '(936) 69- 28- 66', 'ELISA DAPENA', ''),
('CT23', 'EL PALACIO DE LA MODA', 'ORTEGA Y GASSET 129', 'MADRID', '(927) 78- 52- 35', 'LAURA CARRASCO', ''),
('CT24', 'SÁEZ Y CÍA', 'INFANTA MERCEDS 23', 'SEVILLA', '(954) 86- 92- 34', 'MANUEL GUERRA', ''),
('CT25', 'DEPORTES EL MADRILEÑO', 'CASTILLA 345', 'ZARAGOZA', '(976) 38- 89- 34', 'CARLOS GONZÁLEZ', ''),
('CT26', 'FERRETERÍA LA ESCOBA', 'ORENSE 7', 'MADRID', '(918) 45- 93- 46', 'JOSÉ GARCÍA', ''),
('CT27', 'JUGUETES EL BARATO', 'VÍA AUGUSTA 245', 'BARCELONA', '(933) 48- 69- 84', 'ELVIRA IGLESIAS', 'sdç\nsd\nsd\nsd'),
('CT28', 'CONFECCIONES HERMINIA', 'CORRIDA 345', 'GIJÓN', '(985) 59- 73- 15', 'ABEL GONZÁLEZ', ''),
('CT30', 'BAZAR EL ARGENTINO', 'ATOCHA 55', 'MADRID', '(912) 49- 59- 73', 'ADRIÁN ÁLVAREZ', ''),
('CT31', 'LA TIENDA ELEGANTE', 'EL COMENDADOR 67', 'ZARAGOZA', '(975) 69- 40- 35', 'JOSÉ PASCUAL', ''),
('CT32', 'DEPORTES NAUTICOS GARCÍA', 'JUAN FERNÁNDEZ 89', 'ÁVILA', '(920) 26- 86- 48', 'JUAN CONRADO', ''),
('CT33', 'CONFECCIONES RUIZ', 'LLOBREGAT 345', 'BARCELONA', '(934) 58- 76- 15', 'CARLOS SANZ', ''),
('CT34', 'BAZAR LA FARAONA', 'CASTILLA Y LEÓN 34', 'MADRID', '(915) 48- 36- 27', 'ANGEL SANTAMARÍA', ''),
('CT35', 'FERRETERÍA EL MARTILLO', 'CASTELLANOS 205', 'SALAMANCA', '(923) 54- 89- 65', 'JOAQUÍN FERNANDEZ', ''),
('CT36', 'JUGUETES EDUCATIVOS SANZ', 'ORENSE 89', 'MADRID', '(916) 87- 23- 54', 'PEDRO IGLESIAS', ''),
('CT37', 'ALMACENES FERNANDEZ', 'ANTÓN 67', 'TERUEL', '(978) 56- 40- 25', 'MARIA ARDANZA', ''),
('CT38', 'CONFECCIONES MÓNICA', 'MOTORES 67', 'BARCELONA', '(935) 68- 12- 45', 'PEDRO SERRANO', ''),
('CT39', 'FERRETERÍA LIMA', 'VALLECAS 45', 'MADRID', '(913) 53- 27- 85', 'LUIS GARCÍA', ''),
('CT40', 'DEPORTES EL BRASILEÑO', 'ABEL MARTÍNEZ 67', 'SALAMANCA', '(921) 54- 87- 62', 'CARLOS GÓMEZ', ''),
('jt01', 'Javier', 'c/', 'alcobendas', '9191919191', 'yo', 'sdg');

--
-- Disparadores `clientes`
--
DELIMITER $$
CREATE TRIGGER `AfterInsert` AFTER INSERT ON `clientes` FOR EACH ROW INSERT INTO ttrigger VALUES
(null,NEW.cli_empresa, now(), 'ALTA')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeDelete` BEFORE DELETE ON `clientes` FOR EACH ROW INSERT INTO ttrigger VALUES
(null, OLD.cli_empresa, now(), 'ELIMINADO')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `BeforeUpdate` BEFORE UPDATE ON `clientes` FOR EACH ROW INSERT INTO ttrigger VALUES 
(null, NEW.cli_empresa, now(), 'MODIFICADO')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `clientes_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `clientes_pedidos` (
`cli_empresa` varchar(30)
,`cli_poblacion` varchar(20)
,`ped_numero` int(11)
,`ped_fecha` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `group by`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `group by` (
`prod_seccion` varchar(30)
,`NUM_PRODUCTOS` bigint(21)
,`PRECIO_MAXIMO` decimal(10,2)
,`PRECIO_MINIMO` decimal(10,2)
,`PRECIO_MEDIO` decimal(14,6)
,`SUMA_PRECIOS` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `ped_numero` int(11) NOT NULL,
  `ped_cli_codigo` varchar(4) DEFAULT NULL,
  `ped_fecha` date DEFAULT NULL,
  `ped_descuento` int(2) DEFAULT NULL,
  `ped_forma_pago` varchar(20) DEFAULT NULL,
  `ped_enviado` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`ped_numero`, `ped_cli_codigo`, `ped_fecha`, `ped_descuento`, `ped_forma_pago`, `ped_enviado`) VALUES
(1, 'CT01', '2000-03-11', 2, 'CONTADO', 1),
(3, 'CT23', '2000-03-18', 6, 'APLAZADO', 0),
(5, 'CT25', '2000-03-31', 9, 'CONTADO', 0),
(7, 'CT12', '2000-04-12', 7, 'CONTADO', 0),
(8, 'CT01', '2000-04-15', 2, 'TARJETA', 1),
(9, 'CT21', '2000-04-21', 4, 'CONTADO', 0),
(11, 'CT04', '2001-05-01', 8, 'CONTADO', 1),
(12, 'CT06', '2001-05-19', 9, 'CONTADO', 1),
(13, 'CT13', '2000-04-30', 3, 'APLAZADO', 0),
(16, 'CT25', '2001-05-11', 12, 'CONTADO', 0),
(19, 'CT10', '2002-05-22', 7, 'CONTADO', 1),
(21, 'CT16', '2001-05-28', 3, 'CONTADO', 0),
(22, 'CT07', '2000-05-31', 5, 'TARJETA', 1),
(25, 'CT18', '2000-06-02', 6, 'CONTADO', 0),
(26, 'CT09', '2001-06-04', 7, 'APLAZADO', 1),
(27, 'CT34', '2000-06-06', 4, 'CONTADO', 0),
(28, 'CT28', '2000-06-08', 8, 'APLAZADO', 0),
(29, 'CT30', '2001-04-02', 6, 'TARJETA', 0),
(30, 'CT02', '2000-08-15', 6, 'CONTADO', 1),
(31, 'CT30', '2000-06-08', 5, 'TARJETA', 1),
(32, 'CT14', '2001-06-20', 6, 'APLAZADO', 0),
(34, 'CT26', '2002-06-23', 5, 'TARJETA', 0),
(35, 'CT26', '2001-06-30', 6, 'CONTADO', 0),
(37, 'CT24', '2001-07-02', 3, 'TARJETA', 1),
(39, 'CT20', '2001-07-08', 6, 'TARJETA', 1),
(40, 'CT04', '2002-07-12', 12, 'CONTADO', 0),
(42, 'CT34', '2002-07-15', 7, 'APLAZADO', 1),
(43, 'CT09', '2001-07-18', 7, 'CONTADO', 0),
(44, 'CT34', '2002-07-20', 4, 'APLAZADO', 0),
(45, 'CT30', '2002-07-22', 7, 'TARJETA', 0),
(46, 'CT31', '2002-07-25', 6, 'CONTADO', 0),
(47, 'CT34', '2000-07-31', 8, 'APLAZADO', 0),
(48, 'CT18', '2002-08-30', 3, 'CONTADO', 0),
(49, 'CT28', '2002-09-02', 3, 'CONTADO', 0),
(50, 'CT09', '2002-09-05', 8, 'APLAZADO', 0);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pedidos de cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pedidos de cliente` (
`EMPRESA` varchar(30)
,`NUMERO` int(11)
,`NOMBRE` varchar(30)
,`UNIDADES` int(11)
,`PRECIO` decimal(10,2)
,`IMPORTE` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `pedidos valorados`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `pedidos valorados` (
`NUMERO` int(11)
,`NOMBRE` varchar(30)
,`UNIDADES` int(11)
,`PRECIO` decimal(10,2)
,`IMPORTE` decimal(20,2)
);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos_detalle`
--

CREATE TABLE `pedidos_detalle` (
  `pedd_ped_numero` int(11) NOT NULL,
  `pedd_prod_codigo` varchar(4) CHARACTER SET utf8 NOT NULL,
  `pedd_unidades` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32 COLLATE=utf32_spanish_ci;

--
-- Volcado de datos para la tabla `pedidos_detalle`
--

INSERT INTO `pedidos_detalle` (`pedd_ped_numero`, `pedd_prod_codigo`, `pedd_unidades`) VALUES
(1, 'AR01', 11),
(1, 'AR04', 10),
(1, 'AR15', 4),
(1, 'AR22', 18),
(3, 'AR02', 20),
(3, 'AR22', 3),
(5, 'AR04', 16),
(7, 'AR06', 16),
(8, 'AR02', 6),
(8, 'AR06', 5),
(8, 'AR07', 6),
(8, 'AR10', 2),
(8, 'AR12', 30),
(8, 'AR15', 15),
(8, 'AR18', 20),
(8, 'AR19', 18),
(8, 'AR25', 5),
(8, 'AR32', 15),
(8, 'AR33', 18),
(8, 'AR34', 5),
(8, 'AR35', 24),
(9, 'AR06', 14),
(11, 'AR08', 1),
(12, 'AR08', 12),
(13, 'AR08', 8),
(16, 'AR10', 17),
(19, 'AR13', 4),
(21, 'AR15', 11),
(22, 'AR17', 6),
(22, 'AR26', 4),
(22, 'AR28', 21),
(25, 'AR19', 12),
(26, 'AR19', 12),
(27, 'AR21', 11),
(28, 'AR21', 22),
(29, 'AR22', 12),
(30, 'AR23', 33),
(31, 'AR24', 31),
(32, 'AR25', 11),
(34, 'AR22', 7),
(34, 'AR27', 3),
(35, 'AR22', 9),
(35, 'AR27', 12),
(37, 'AR27', 11),
(39, 'AR29', 22),
(40, 'AR30', 1),
(42, 'AR31', 21),
(43, 'AR32', 3),
(44, 'AR22', 22),
(45, 'AR36', 21),
(46, 'AR37', 8),
(47, 'AR38', 12),
(48, 'AR38', 13),
(49, 'AR39', 13),
(50, 'AR39', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `prod_codigo` varchar(4) NOT NULL,
  `prod_seccion` varchar(30) DEFAULT NULL,
  `prod_nombre` varchar(30) DEFAULT NULL,
  `prod_precio` decimal(10,2) DEFAULT NULL,
  `prod_iva` int(10) NOT NULL,
  `prod_fecha` date DEFAULT NULL,
  `prod_importado` tinyint(1) DEFAULT NULL,
  `prod_pais_origen` varchar(30) DEFAULT NULL,
  `prod_foto` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`prod_codigo`, `prod_seccion`, `prod_nombre`, `prod_precio`, `prod_iva`, `prod_fecha`, `prod_importado`, `prod_pais_origen`, `prod_foto`) VALUES
('AR01', 'FERRETERÍA', 'DESTORNILLADOR', '7.00', 21, '2000-10-22', 0, 'ESPAÑA', NULL),
('AR02', 'CONFECCIÓN', 'TRAJE CABALLERO', '284.00', 21, '2002-03-11', 1, 'ITALIA', NULL),
('AR03', 'JUGUETERÍA', 'COCHE TELEDIRIGIDO', '159.00', 21, '2002-05-26', 1, 'MARRUECOS', NULL),
('AR04', 'DEPORTES', 'RAQUETA TENIS', '95.00', 21, '2000-03-20', 1, 'USA', NULL),
('AR06', 'DEPORTES', 'MANCUERNAS', '60.00', 21, '2000-09-13', 1, 'USA', NULL),
('AR07', 'CONFECCIÓN', 'SERRUCHO', '30.00', 21, '2001-03-23', 1, 'FRANCIA', NULL),
('AR08', 'JUGUETERÍA', 'CORREPASILLOS', '103.00', 21, '2000-04-11', 1, 'JAPÓN', NULL),
('AR09', 'CONFECCIÓN', 'PANTALÓN SEÑORA', '174.00', 21, '2000-01-10', 1, 'MARRUECOS', NULL),
('AR10', 'JUGUETERÍA', 'CONSOLA VIDEO', '442.00', 21, '2002-09-24', 1, 'USA', NULL),
('AR11', 'CERÁMICA', 'TUBOS', '168.00', 21, '2000-02-04', 1, 'CHINA', NULL),
('AR12', 'FERRETERÍA', 'LLAVE INGLESA', '24.00', 21, '2001-05-23', 1, 'USA', NULL),
('AR13', 'CONFECCIÓN', 'CAMISA CABALLERO', '67.00', 21, '2002-08-11', 0, 'ESPAÑA', NULL),
('AR14', 'JUGUETERÍA', 'TREN ELÉCTRICO', '1505.00', 21, '2001-07-03', 1, 'JAPÓN', NULL),
('AR15', 'CERÁMICA', 'PLATO DECORATIVO', '54.00', 21, '2000-06-07', 1, 'CHINA', NULL),
('AR16', 'FERRETERÍA', 'ALICATES', '6.00', 21, '2000-04-17', 1, 'ITALIA', NULL),
('AR17', 'JUGUETERÍA', 'MUÑECA ANDADORA', '105.00', 21, '2001-01-04', 0, 'ESPAÑA', NULL),
('AR18', 'DEPORTES', 'PISTOLA OLÍMPICA', '46.00', 21, '2001-02-02', 1, 'SUECIA', NULL),
('AR19', 'CONFECCIÓN', 'BLUSA SRA.', '101.00', 21, '2000-03-18', 1, 'CHINA', NULL),
('AR20', 'CERÁMICA', 'JUEGO DE TE', '43.00', 21, '2001-01-15', 1, 'CHINA', NULL),
('AR21', 'CERÁMICA', 'CENICERO', '19.00', 21, '2001-07-02', 1, 'JAPÓN', NULL),
('AR22', 'FERRETERÍA', 'MARTILLO', '11.00', 21, '2001-09-04', 0, 'ESPAÑA', NULL),
('AR23', 'CONFECCIÓN', 'CAZADORA PIEL', '522.00', 21, '2001-07-10', 1, 'ITALIA', NULL),
('AR24', 'DEPORTES', 'BALÓN RUGBY', '111.00', 21, '2000-11-11', 1, 'USA', NULL),
('AR25', 'DEPORTES', 'BALÓN BALONCESTO', '75.00', 21, '2001-06-25', 1, 'JAPÓN', NULL),
('AR26', 'JUGUETERÍA', 'FUERTE DE SOLDADOS', '143.00', 21, '2000-11-25', 1, 'JAPÓN', NULL),
('AR27', 'CONFECCIÓN', 'ABRIGO CABALLERO', '500000.00', 21, '2002-04-05', 1, 'ITALIA', NULL),
('AR28', 'DEPORTES', 'BALÓN FÚTBOL', '43.00', 21, '2002-07-04', 0, 'ESPAÑA', NULL),
('AR29', 'CONFECCIÓN', 'ABRIGO SRA', '360.00', 21, '2001-05-03', 1, 'MARRUECOS', NULL),
('AR30', 'FERRETERÍA', 'DESTORNILLADOR', '9.00', 21, '2002-02-20', 1, 'FRANCIA', NULL),
('AR31', 'JUGUETERÍA', 'PISTOLA CON SONIDOS', '57.00', 21, '2001-04-15', 0, 'ESPAÑA', NULL),
('AR32', 'DEPORTES', 'CRONÓMETRO', '439.00', 21, '2002-01-03', 1, 'USA', NULL),
('AR33', 'CERÁMICA', 'MACETA', '29.00', 21, '2000-02-23', 0, 'ESPAÑA', NULL),
('AR34', 'OFICINA', 'PIE DE LÁMPARA', '39.00', 21, '2001-05-27', 1, 'TURQUÍA', NULL),
('AR35', 'FERRETERÍA', 'LIMA GRANDE', '22.00', 21, '2002-08-10', 0, 'ESPAÑA', NULL),
('AR36', 'FERRETERÍA', 'JUEGO DE BROCAS', '15.00', 21, '2002-07-04', 1, 'TAIWÁN', NULL),
('AR37', 'CONFECCIÓN', 'CINTURÓN DE PIEL', '4.00', 21, '2002-05-12', 0, 'ESPAÑA', NULL),
('AR38', 'DEPORTES', 'CAÑA DE PESCA', '270.00', 21, '2000-02-14', 1, 'USA', NULL),
('AR39', 'CERÁMICA', 'JARRA CHINA', '127.00', 21, '2002-09-02', 1, 'CHINA', NULL),
('AR40', 'DEPORTES', 'BOTA ALPINISMO', '144.00', 21, '2002-05-05', 0, 'ESPAÑA', NULL),
('AR41', 'DEPORTES', 'PALAS DE PING PONG', '21.00', 21, '2002-02-02', 0, 'ESPAÑA', NULL),
('AR42', 'DEPORTES', 'Camiseta Fitness', '55.00', 21, '2001-05-15', 0, 'ESPAÑA', NULL),
('ar43', 'DEPORTES', 'Camiseta basket', '40.00', 21, '2016-05-01', 0, 'ESPAÑA', NULL),
('jrt1', 'Informática', 'Impresora', '200.00', 21, '2016-09-10', 1, 'China', NULL),
('jrt3', 'Informática', 'Teclado', '22.30', 21, '0018-03-09', 1, 'China', NULL),
('jrt4', 'Informática', 'Tec4', '22.60', 21, '2016-04-07', 1, 'China', NULL),
('jrt5', 'Informática', 'Tec5', '14.30', 21, '2016-09-12', 1, 'China', NULL),
('jrta', 'Informática', 'PC', '2000.00', 21, '2016-04-07', 0, 'España', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ttrigger`
--

CREATE TABLE `ttrigger` (
  `tr_id` int(11) NOT NULL,
  `tr_nombre` varchar(50) NOT NULL,
  `tr_fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `tr_accion` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ttrigger`
--

INSERT INTO `ttrigger` (`tr_id`, `tr_nombre`, `tr_fecha`, `tr_accion`) VALUES
(1, 'PIRES&SON', '2024-04-02 06:59:05', 'ALTA'),
(2, 'PA', '2024-04-02 07:09:19', 'MODIFICADO'),
(3, 'PA', '2024-04-02 07:10:12', 'ELIMINADO');

-- --------------------------------------------------------

--
-- Estructura para la vista `agrupacion por pedidos`
--
DROP TABLE IF EXISTS `agrupacion por pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `agrupacion por pedidos`  AS  select `pv`.`NUMERO` AS `NUMERO`,count(0) AS `ARTICULOS`,sum(`pv`.`IMPORTE`) AS `IMPORTE`,max(`pv`.`UNIDADES`) AS `MAXIMO_UDS`,min(`pv`.`UNIDADES`) AS `MINIMO_UDS`,avg(`pv`.`UNIDADES`) AS `MEDIA_UDS` from `pedidos valorados` `pv` where `pv`.`IMPORTE` > 2000 group by `pv`.`NUMERO` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `calculo_iva`
--
DROP TABLE IF EXISTS `calculo_iva`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `calculo_iva`  AS  select `p`.`prod_seccion` AS `prod_seccion`,`p`.`prod_nombre` AS `prod_nombre`,`p`.`prod_precio` AS `PRECIO SIN IVA`,`p`.`prod_iva` AS `prod_iva`,`p`.`prod_precio` * (100 + `p`.`prod_iva`) / 100 AS `PRECIO CON IVA` from `productos` `p` order by `p`.`prod_seccion`,`p`.`prod_nombre` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `clientes_pedidos`
--
DROP TABLE IF EXISTS `clientes_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `clientes_pedidos`  AS  select `c`.`cli_empresa` AS `cli_empresa`,`c`.`cli_poblacion` AS `cli_poblacion`,`p`.`ped_numero` AS `ped_numero`,`p`.`ped_fecha` AS `ped_fecha` from (`clientes` `c` join `pedidos` `p`) where `c`.`cli_codigo` = `p`.`ped_cli_codigo` order by `c`.`cli_empresa`,`p`.`ped_numero` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `group by`
--
DROP TABLE IF EXISTS `group by`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `group by`  AS  select `productos`.`prod_seccion` AS `prod_seccion`,count(`productos`.`prod_codigo`) AS `NUM_PRODUCTOS`,max(`productos`.`prod_precio`) AS `PRECIO_MAXIMO`,min(`productos`.`prod_precio`) AS `PRECIO_MINIMO`,avg(`productos`.`prod_precio`) AS `PRECIO_MEDIO`,sum(`productos`.`prod_precio`) AS `SUMA_PRECIOS` from `productos` where 1 group by `productos`.`prod_seccion` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pedidos de cliente`
--
DROP TABLE IF EXISTS `pedidos de cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedidos de cliente`  AS  select `cl`.`cli_empresa` AS `EMPRESA`,`pd`.`pedd_ped_numero` AS `NUMERO`,`pr`.`prod_nombre` AS `NOMBRE`,`pd`.`pedd_unidades` AS `UNIDADES`,`pr`.`prod_precio` AS `PRECIO`,`pd`.`pedd_unidades` * `pr`.`prod_precio` AS `IMPORTE` from (((`pedidos_detalle` `pd` join `productos` `pr`) join `clientes` `cl`) join `pedidos` `pe`) where `pr`.`prod_codigo` = `pd`.`pedd_prod_codigo` and `pd`.`pedd_ped_numero` = `pe`.`ped_numero` and `pe`.`ped_cli_codigo` = `cl`.`cli_codigo` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `pedidos valorados`
--
DROP TABLE IF EXISTS `pedidos valorados`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pedidos valorados`  AS  select `pd`.`pedd_ped_numero` AS `NUMERO`,`pr`.`prod_nombre` AS `NOMBRE`,`pd`.`pedd_unidades` AS `UNIDADES`,`pr`.`prod_precio` AS `PRECIO`,`pd`.`pedd_unidades` * `pr`.`prod_precio` AS `IMPORTE` from (`pedidos_detalle` `pd` join `productos` `pr`) where `pr`.`prod_codigo` = `pd`.`pedd_prod_codigo` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`cli_codigo`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`ped_numero`),
  ADD KEY `ped_cli_codigo` (`ped_cli_codigo`);

--
-- Indices de la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD PRIMARY KEY (`pedd_ped_numero`,`pedd_prod_codigo`),
  ADD KEY `cod_articulo` (`pedd_prod_codigo`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`prod_codigo`);

--
-- Indices de la tabla `ttrigger`
--
ALTER TABLE `ttrigger`
  ADD PRIMARY KEY (`tr_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ttrigger`
--
ALTER TABLE `ttrigger`
  MODIFY `tr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `pedidos_ibfk_1` FOREIGN KEY (`ped_cli_codigo`) REFERENCES `clientes` (`cli_codigo`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos_detalle`
--
ALTER TABLE `pedidos_detalle`
  ADD CONSTRAINT `pedidos_detalle_ibfk_1` FOREIGN KEY (`pedd_ped_numero`) REFERENCES `pedidos` (`ped_numero`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pedidos_detalle_ibfk_2` FOREIGN KEY (`pedd_prod_codigo`) REFERENCES `productos` (`prod_codigo`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
