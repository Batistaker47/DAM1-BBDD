-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 29-04-2024 a las 08:03:29
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_trivial`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_borrar` (IN `_id` INT)  DETERMINISTIC BEGIN
	DELETE FROM categorias WHERE cat_id = _id;
    SELECT row_count() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_id` (IN `_id` INT)  DETERMINISTIC SELECT * FROM categorias WHERE cat_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_insertar` (IN `_categ` VARCHAR(50), IN `_color` VARCHAR(50))  DETERMINISTIC BEGIN
	INSERT INTO categorias VALUES
		(null, _categ, _color);
    SELECT last_insert_id() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_modificar` (IN `_id` INT, IN `_categ` VARCHAR(50), IN `_color` VARCHAR(50))  DETERMINISTIC BEGIN
	UPDATE categorias SET
		cat_categoria = _categ,
        cat_color = _color
    WHERE cat_id = _id;
    SELECT row_count() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_todas` ()  DETERMINISTIC SELECT * FROM categorias ORDER BY cat_categoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `categ_todas_con_num` ()  DETERMINISTIC SELECT c.*, count(p.pr_id) as contador 
    FROM categorias as c, preguntas as p    
    WHERE c.cat_id = p.pr_cat_id
    GROUP BY c.cat_id
    ORDER BY c.cat_categoria$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_borrar` (IN `_id` INT)  DETERMINISTIC BEGIN
	DELETE FROM preguntas WHERE pr_id = _id;
    SELECT row_count() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_id` (IN `_id` INT)  DETERMINISTIC SELECT p.* FROM preguntas as p WHERE pr_id = _id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_insertar` (IN `_preg` TEXT, IN `_r1` TEXT, IN `_r2` TEXT, IN `_r3` TEXT, IN `_r4` TEXT, IN `_valida` INT, IN `_cat_id` INT)  DETERMINISTIC BEGIN
	INSERT INTO preguntas VALUES (null, _preg, _r1, _r2, _r3, _r4, _valida, _cat_id);
    SELECT row_count() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_modificar` (IN `_id` INT, IN `_preg` TEXT, IN `_r1` TEXT, IN `_r2` TEXT, IN `_r3` TEXT, IN `_r4` TEXT, IN `_valida` INT, IN `_cat_id` INT)  DETERMINISTIC BEGIN
	UPDATE preguntas as p SET
		p.pr_cat_id = _cat_id,
        p.pr_pregunta = _preg,
        p.pr_r1 = _r1,
        p.pr_r2 = _r2,
        p.pr_r3 = _r3,
        p.pr_r4 = _r4,
        p.pr_valida = _valida
    WHERE pr_id = _id;
    SELECT row_count() as respuesta;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_todas` ()  DETERMINISTIC SELECT c.cat_categoria, c.cat_color, p.* 
FROM preguntas as p, categorias as c
WHERE p.pr_cat_id = c.cat_id$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `preg_todas_random` (IN `_cat_id` INT, IN `_cuantas` INT)  DETERMINISTIC SELECT * FROM preguntas as p
    WHERE p.pr_cat_id = _cat_id
    ORDER BY rand() 
    LIMIT _cuantas$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usu_insertar` (IN `_nom` VARCHAR(50), IN `_alias` VARCHAR(50), IN `_pass` VARCHAR(50), IN `_foto` VARCHAR(50))  DETERMINISTIC BEGIN
		INSERT INTO usuarios VALUES (null, _nom, _alias, _pass, _foto, 0);
    	SELECT last_insert_id() as respuesta;
	END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `usu_login` (IN `_nom_` VARCHAR(50), IN `_pass` VARCHAR(50))  DETERMINISTIC SELECT * FROM usuarios WHERE usu_alias = _nom AND usu_password = md5(_pass)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `cat_id` int(11) NOT NULL,
  `cat_categoria` varchar(50) NOT NULL,
  `cat_color` varchar(50) NOT NULL,
  `para_trivial` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`cat_id`, `cat_categoria`, `cat_color`, `para_trivial`) VALUES
(1, 'Literatura y Arte', 'Marrón', 1),
(2, 'Ciencia y Naturaleza', 'Verde', 1),
(3, 'Historia', 'Amarillo', 1),
(4, 'Geografía', 'Azul', 1),
(5, 'Deporte y Juegos', 'Naranja', 1),
(6, 'Espectáculos', 'Rosa', 1),
(10, 'Programación', 'black', 0),
(11, 'MYSQL', 'black', 0),
(12, 'Javascript', 'green', 0),
(13, 'Java', 'blue', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `historial`
--

CREATE TABLE `historial` (
  `his_id` int(11) NOT NULL,
  `his_usu_id` int(11) NOT NULL,
  `his_num_preguntas` int(11) NOT NULL,
  `his_num_acertadas` int(11) NOT NULL,
  `his_num_falladas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preguntas`
--

CREATE TABLE `preguntas` (
  `pr_id` int(11) NOT NULL,
  `pr_pregunta` text NOT NULL,
  `pr_r1` text NOT NULL,
  `pr_r2` text NOT NULL,
  `pr_r3` text NOT NULL,
  `pr_r4` text NOT NULL,
  `pr_valida` int(11) NOT NULL,
  `pr_cat_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `preguntas`
--

INSERT INTO `preguntas` (`pr_id`, `pr_pregunta`, `pr_r1`, `pr_r2`, `pr_r3`, `pr_r4`, `pr_valida`, `pr_cat_id`) VALUES
(1, '¿En qué deporte se usa tiza?', 'Billar', 'Hockey', 'Dardos', 'Fútbol', 1, 5),
(2, '¿Qué instrumento musical tiene nombre y forma geométricos?', 'Triángulo', 'Violín', 'Guitarra', 'Piano', 1, 1),
(3, '¿Quién escribió \"Hansel y Gretel\"?', 'Los hermanos Grimm.', 'Hans Christian Andersen.', 'Charles Perrault.', 'Felix María Samaniego.', 1, 1),
(4, 'El gentilicio de la provincia de Granada es:', 'Granadino.', 'Granadiniano.', 'Granadiense.', 'Granadieniense.', 1, 4),
(8, '¿Qué lenguaje de programación es conocido por su uso en desarrollo web?', 'Python', 'Java', 'HTML', 'C++', 3, 10),
(9, '¿Qué significa CSS en desarrollo web?', 'Creative Style Sheets', 'Computer Style Sheets', 'Cascading Style Sheets', 'Compressed Style Sheets', 3, 10),
(10, '¿Cuál de los siguientes no es un lenguaje de programación?', 'CSS', 'JavaScript', 'SQL', 'XML', 1, 10),
(11, '¿Qué es un bucle en programación?', 'Una función matemática', 'Una estructura de control', 'Un tipo de dato', 'Una biblioteca estándar', 2, 10),
(12, '¿Cuál es la extensión de archivo comúnmente asociada con los archivos de código en Python?', '.java', '.py', '.cpp', '.html', 2, 10),
(13, '¿Qué significa SQL en programación?', 'Simple Query Language', 'Standard Query Language', 'Structured Query Language', 'Scripted Query Language', 3, 10),
(14, '¿Qué es un IDE en programación?', 'Integrated Developer Environment', 'Internet Developer Engine', 'Instructional Development Environment', 'Interface Design Enhancement', 1, 10),
(15, '¿Cuál de las siguientes no es una estructura de datos en programación?', 'Array', 'Queue', 'Stack', 'Namespace', 4, 10),
(16, '¿Qué es un método en programación orientada a objetos?', 'Una función que se aplica a una clase', 'Un tipo de variable', 'Un conjunto de instrucciones', 'Una declaración condicional', 1, 10),
(17, '¿Qué es Git en el contexto de programación?', 'Un lenguaje de programación', 'Un sistema de control de versiones', 'Una biblioteca estándar de Python', 'Un entorno de desarrollo integrado', 2, 10),
(20, '¿Cuál es el resultado de sumar 5 y 3 en Python?', '8', '\"8\"', '53', 'Ninguna de las anteriores', 1, 10),
(21, '¿Cuál es el resultado de sumar \"5\" y \"3\" en Javascript?', '8', '53', '\"8\"', 'Ninguna de las anteriores', 2, 10),
(22, '¿Qué hace la función console.log() en Javascript?', 'Lee un archivo', 'Imprime texto en la consola', 'Ejecuta una función matemática', 'Define una variable', 2, 10),
(23, '¿Qué significa HTML en desarrollo web?', 'Hyper Text Markup Language', 'High Tech Markup Language', 'Hyperlink Text Manipulation Language', 'Home Tool Markup Language', 1, 10),
(24, '¿Cuál es el resultado de la siguiente expresión en Javascript: 5 % 2?', '2', '2.5', '3', '1', 4, 10),
(25, '¿Qué hace la función trim() en Javascript?', 'Calcula el logaritmo natural de un número', 'Devuelve la longitud de un objeto', 'Convierte un número a su valor absoluto', 'Quita los espacios anteriores y posteriores al texto', 4, 10),
(26, '¿Qué hace la función Math.floor(numero) en Javascript?', 'Devuelve el entero inmediatamente superior al número', 'Devuelve el entero inmediatamente inferior al número', 'Redondea el número', 'Calcula un número aleatorio', 2, 10),
(27, '¿Qué hace la función Math.floor(numero) en Javascript?', 'Devuelve el entero inmediatamente superior al número', 'Devuelve el entero inmediatamente inferior al número', 'Redondea el número', 'Calcula un número aleatorio', 1, 10),
(28, '¿Qué hace la función MAth.round(numero) en Javascript?', 'Redondea el último decimal', 'Redondea al entero mas cercano', 'Redondea a 2 decimales', 'No existe', 2, 10),
(29, '¿Qué función Math permite calcular potencias en Javascript?', 'pot', 'pow', 'exp', 'cua', 2, 10),
(30, '¿Qué es un algoritmo en programación?', 'Un lenguaje de programación', 'Una función matemática', 'Un conjunto de instrucciones para resolver un problema', 'Una estructura de datos', 3, 10),
(31, '¿Qué símbolos indica función en Javascript?', '()', '{}', '[]', 'function', 1, 10),
(32, '¿Qué símbolos indican array Javascript?', '()', '{}', '[]', 'No existen', 3, 10),
(33, '¿Qué símbolos indican objeto json en Javascript?', '()', '{}', '[]', ':', 2, 10),
(34, '¿Cuantos parámetros admite una función en Javascript?', '1', '2', '5', 'Los que necesites', 4, 10),
(35, '¿Cuantos parámetros puede retornar una función en Javascript?', 'Uno', 'Dos', 'Ninguno', 'Los que necesites', 1, 10),
(36, '¿Cuál de los siguientes no es un tipo de bucle en Javascript?', 'for', 'while', 'repeat', 'foreach', 3, 10),
(37, '¿Qué operador permite concatenar textos en Javascript?', '.', '+', ',', '-', 2, 10),
(40, '¿Qué operador permite concatenar textos en PHP?', '.', '+', '-', '*', 1, 10),
(41, '¿Qué comando se utiliza para seleccionar datos de una tabla en SQL?', 'SELECT', 'INSERT', 'UPDATE', 'DELETE', 1, 11),
(42, '¿Qué comando se utiliza para filtrar resultados de una tabla en SQL?', 'WHERE', 'FROM', 'ORDER BY', 'GROUP BY', 1, 11),
(43, '¿Qué cláusula se utiliza para agrupar resultados en una consulta SQL?', 'GROUP BY', 'ORDER BY', 'ARRANGE BY', 'ARRANGE BY', 1, 11),
(44, '¿Qué cláusula <b>NO</b> elimina datos de una tabla en SQL?', 'DELETE', 'REMOVE', 'TRUNCATE', 'DROP', 2, 11),
(45, '¿Qué comando se utiliza para crear una nueva tabla en SQL?', 'MAKE TABLE', '<table>', 'NEW TABLE', 'CREATE TABLE', 4, 11),
(46, '¿Qué cláusula se utiliza para limitar el número de filas devueltas en una consulta SQL?', 'TOP', 'ROWS', 'LIMIT', 'FIRST', 3, 11),
(47, '¿Qué función se utiliza para calcular el número total de filas en una tabla en SQL?', 'SUM()', 'AVG()', 'MAX()', 'COUNT()', 4, 11),
(48, '¿Qué comando se utiliza para eliminar una tabla en SQL?', 'DELETE TABLE', 'REMOVE TABLE', 'DROP TABLE', 'ERASE TABLE', 3, 11),
(49, '¿Qué cláusula se utiliza para seleccionar solo filas únicas en una consulta SQL?', 'DISTINCT', 'UNIQUE', 'SINGLE', 'ONLY', 1, 11),
(50, '¿Qué comando se utiliza para agregar una nueva columna a una tabla existente en SQL?', 'ALTER TABLE', 'MODIFY COLUMN', 'ADD COLUMN', 'INSERT COLUMN', 3, 11),
(51, '¿Qué cláusula se utiliza para renombrar una columna en SQL?', 'RENAME COLUMN', 'ALTER COLUMN', 'MODIFY COLUMN', 'RENAME TO', 4, 11),
(52, '¿Qué función se utiliza para concatenar valores en SQL?', 'CONCAT()', 'JOIN()', 'LEFT JOIN()', 'MERGE()', 1, 11),
(53, '¿Qué cláusula se utiliza para seleccionar una fila aleatoria de una tabla en SQL?', 'RANDOM', 'RAND()', 'SAMPLE', 'ROW', 2, 11),
(54, '¿Qué función se utiliza para encontrar la longitud de una cadena en SQL?', 'LENGTH()', 'CHAR_LENGTH()', 'STRING_LENGTH()', 'SIZE()', 2, 11),
(55, '¿Qué comando se utiliza para eliminar todas las filas de una tabla en SQL?', 'TRUNCATE TABLE', 'DROP TABLE', 'DELETE ALL', 'CLEAR TABLE', 1, 11),
(56, '¿Qué función se utiliza para convertir un valor en mayúsculas en SQL?', 'TOUPPER()', 'UCASE()', 'CAPITALIZE()', 'UPPER()', 4, 11),
(57, '¿Qué comando se utiliza para eliminar una columna de una tabla en SQL?', 'DROP COLUMN', 'DELETE COLUMN', 'REMOVE COLUMN', 'ERASE COLUMN', 1, 11),
(58, '¿Qué función se utiliza para encontrar la posición de una subcadena dentro de una cadena en SQL?', 'POSITION()', 'LOCATE()', 'FIND()', 'INSTR()', 2, 11),
(59, '¿Qué función se utiliza para obtener la fecha y hora actual en SQL?', 'NOW()', 'CURRENT_TIME()', 'GETDATE()', 'TODAY()', 1, 11),
(60, '¿Qué función se utiliza para obtener el día de la semana de una fecha en SQL?', 'DAY()', 'WEEKDAY()', 'DAYOFWEEK()', 'WEEKDAYNAME()', 3, 11),
(61, '¿Qué cláusula se utiliza para agregar una condición a un JOIN en SQL?', 'JOIN', 'WHERE', 'ON', 'AND', 3, 11),
(62, '¿Qué comando se utiliza para cambiar el tipo de datos de una columna en SQL?', 'ALTER COLUMN', 'MODIFY COLUMN', 'CHANGE COLUMN', 'CONVERT COLUMN', 3, 11),
(65, '¿Qué función se utiliza para obtener el número de meses entre dos fechas en SQL?', 'MONTHS_BETWEEN()', 'DATEDIFF()', 'INTERVAL()', 'MONTH_DIFF()', 1, 11),
(66, '¿Qué cláusula se utiliza para especificar condiciones de agregación en SQL?', 'GROUP BY', 'HAVING', 'WHERE', 'AGGREGATE', 2, 11),
(67, '¿Qué comando se utiliza para eliminar un índice de una tabla en SQL?', 'REMOVE INDEX', 'DELETE INDEX', 'ERASE INDEX', 'DROP INDEX', 4, 11),
(68, '¿Qué comando se utiliza para cambiar el nombre de una tabla en SQL?', 'ALTER TABLE', 'RENAME TABLE', 'UPDATE TABLE', 'CHANGE TABLE', 2, 11),
(69, '¿Qué función se utiliza para obtener la fecha actual en SQL?', 'GETDATE()', 'CURRENT_DATE()', 'TODAY()', 'NOW()', 1, 11),
(70, '¿Qué función se utiliza para convertir un valor en minúsculas en SQL?', 'LCASE()', 'TOLOWER()', 'LOWER()', 'CASE_LOWER()', 3, 11),
(71, '¿Qué función se utiliza para obtener el día del mes de una fecha en SQL?', 'DATE_DAY()', 'DAYOFMONTH()', 'MONTH()', 'DAY()', 4, 11),
(72, '¿Qué comando se utiliza para eliminar una base de datos en SQL?', 'DELETE DATABASE', 'REMOVE DATABASE', 'DROP DATABASE', 'ERASE DATABASE', 3, 11),
(73, '¿Qué función se utiliza para obtener la hora actual en SQL?', 'GETTIME()', 'TIME()', 'SYSDATE()', 'CURRENT_TIME()', 4, 11),
(74, '¿Qué comando se utiliza para eliminar una restricción de clave foránea en SQL?', 'DROP CONSTRAINT', 'DELETE CONSTRAINT', 'REMOVE CONSTRAINT', 'ERASE CONSTRAINT', 1, 11);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `usu_id` int(11) NOT NULL,
  `usu_nombre` varchar(50) NOT NULL,
  `usu_alias` varchar(50) NOT NULL,
  `usu_password` varchar(256) NOT NULL,
  `usu_foto` varchar(50) NOT NULL,
  `usu_admin` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`usu_id`, `usu_nombre`, `usu_alias`, `usu_password`, `usu_foto`, `usu_admin`) VALUES
(1, 'administrador', 'administrador', '91f5167c34c400758115c2a6826ec2e3', 'u12.gif', 1),
(2, 'usuario', 'usuario', 'f8032d5cae3de20fcec887f395ec9a6a', 'u02.gif', 0),
(3, 'Pepe', 'pepe', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(7, 'Pepe2', 'pepe2', '926e27eecdbc7a18858b3798ba99bddd', 'anonimo.png', 0),
(8, 'Juana', 'juana', 'a94652aa97c7211ba8954dd15a3cf838', 'u03.gif', 0);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`cat_id`);

--
-- Indices de la tabla `historial`
--
ALTER TABLE `historial`
  ADD PRIMARY KEY (`his_id`),
  ADD KEY `r_his_usu` (`his_usu_id`);

--
-- Indices de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD PRIMARY KEY (`pr_id`),
  ADD KEY `Preguntas_pr_gen_id_idx` (`pr_cat_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`usu_id`),
  ADD UNIQUE KEY `usu_alias` (`usu_alias`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `cat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `historial`
--
ALTER TABLE `historial`
  MODIFY `his_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `preguntas`
--
ALTER TABLE `preguntas`
  MODIFY `pr_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=75;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `usu_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `historial`
--
ALTER TABLE `historial`
  ADD CONSTRAINT `r_his_usu` FOREIGN KEY (`his_usu_id`) REFERENCES `usuarios` (`usu_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `preguntas`
--
ALTER TABLE `preguntas`
  ADD CONSTRAINT `preguntas_ibfk_1` FOREIGN KEY (`pr_cat_id`) REFERENCES `categorias` (`cat_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
