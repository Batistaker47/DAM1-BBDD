-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2024 a las 12:23:17
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
-- Base de datos: `bd_academia`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumno-asignatura`
--

CREATE TABLE `alumno-asignatura` (
  `alas_alumno_id` int(11) NOT NULL,
  `alas_asig_id` int(11) NOT NULL,
  `alas_fecha` date NOT NULL,
  `alas_nota` decimal(4,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `alumno_id` int(11) NOT NULL,
  `alumno_nombre` varchar(50) NOT NULL,
  `alumno_apellidos` varchar(100) NOT NULL,
  `alumno_nacimiento` date NOT NULL,
  `alumno_curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `alumnos`
--

INSERT INTO `alumnos` (`alumno_id`, `alumno_nombre`, `alumno_apellidos`, `alumno_nacimiento`, `alumno_curso_id`) VALUES
(1, 'Alex', 'Sugimoto', '2024-04-18', 1),
(2, 'Alex', 'Sugimoto', '2024-04-18', 1),
(3, 'Alex', 'Sugimoto', '2024-04-18', 1),
(4, 'Alex', 'Sugimoto', '2024-04-18', 1),
(5, 'Alex', 'Sugimoto', '2024-04-18', 1),
(6, 'David', 'Pires', '1997-08-19', 1),
(7, 'David', 'Pires', '1997-08-19', 1),
(8, 'David', 'Pires', '1997-08-19', 1),
(9, 'David', 'Pires', '1997-08-19', 1),
(10, 'David', 'Pires', '1997-08-19', 1),
(11, 'Pepa', 'A', '0000-00-00', 2),
(12, 'Pepa', 'A', '0000-00-00', 2),
(13, 'Pepa', 'A', '0000-00-00', 2),
(14, 'Pepa', 'A', '0000-00-00', 2),
(15, 'Pepa', 'A', '0000-00-00', 2),
(16, 'Gonzalo', 'Sanchez', '2005-02-08', 3),
(17, 'Gonzalo', 'Sanchez', '2005-02-08', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `asig_id` int(11) NOT NULL,
  `asig_nombre` varchar(50) NOT NULL,
  `asig_descripcion` text NOT NULL,
  `asig_curso_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`asig_id`, `asig_nombre`, `asig_descripcion`, `asig_curso_id`) VALUES
(1, 'BBDD', 'Aprender a utilizar bases de datos en MySQL', 1),
(2, 'BBDD', 'Aprender a utilizar bases de datos en MySQL', 2),
(3, 'Lenguaje de Marcas', 'Aprender a crear páginas web', 1),
(4, 'Lenguaje de Marcas', 'Aprender a crear páginas web', 2),
(5, 'Programación', 'Java con el dios de la programación, Alberto', 1),
(6, 'Programación', 'Java con el dios de la programación, Tomasín', 2),
(7, 'Desarrollo de Interfaces', 'Crear interfaces de videojuegos', 3),
(8, 'Sistemas', 'Python con Alberto', 1),
(9, 'Sistemas', 'No vale para nada', 2),
(10, 'Entornos', 'OLD MARIO >>>>>>>>>>>>>>>> NEW MARIO', 1),
(11, 'FOL', 'No vale para nada', 1),
(12, 'FOL', 'No vale para nada', 2),
(13, 'EIE', 'Igual que FOL', 3),
(14, 'EIE', 'Igual que FOL', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cursos`
--

CREATE TABLE `cursos` (
  `curso_id` int(11) NOT NULL,
  `curso_nombre` varchar(50) NOT NULL,
  `curso_plazas` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cursos`
--

INSERT INTO `cursos` (`curso_id`, `curso_nombre`, `curso_plazas`) VALUES
(1, 'DAM1', 30),
(2, 'DAW1', 25),
(3, 'DAM2', 20),
(4, 'DAW2', 30);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumno-asignatura`
--
ALTER TABLE `alumno-asignatura`
  ADD UNIQUE KEY `alas_alumno_id` (`alas_alumno_id`,`alas_asig_id`,`alas_fecha`),
  ADD KEY `r-alas-asignaturas` (`alas_asig_id`);

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`alumno_id`),
  ADD KEY `r-alumno-curso` (`alumno_curso_id`);

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`asig_id`);

--
-- Indices de la tabla `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`curso_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  MODIFY `alumno_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `asig_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `cursos`
--
ALTER TABLE `cursos`
  MODIFY `curso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumno-asignatura`
--
ALTER TABLE `alumno-asignatura`
  ADD CONSTRAINT `r-alas-alumno` FOREIGN KEY (`alas_alumno_id`) REFERENCES `alumnos` (`alumno_id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `r-alas-asignaturas` FOREIGN KEY (`alas_asig_id`) REFERENCES `asignaturas` (`asig_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `r-alumno-curso` FOREIGN KEY (`alumno_curso_id`) REFERENCES `cursos` (`curso_id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Filtros para la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD CONSTRAINT `r-cursos-asignaturas` FOREIGN KEY (`asig_curso_id`) REFERENCES `cursos` (`curso_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
