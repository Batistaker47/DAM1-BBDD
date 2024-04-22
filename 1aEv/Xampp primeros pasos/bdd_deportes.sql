-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2024 a las 13:37:39
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
-- Base de datos: `bdd_deportes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes`
--

CREATE TABLE `deportes` (
  `dte_id` int(11) NOT NULL,
  `dte_nombre` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportes`
--

INSERT INTO `deportes` (`dte_id`, `dte_nombre`) VALUES
(1, 'Futbol'),
(2, 'Baloncesto'),
(3, 'Beisbol'),
(4, 'Golf'),
(5, 'Boxeo'),
(6, 'F1'),
(7, 'PingPong'),
(8, 'Natacion'),
(9, 'Atletismo'),
(10, 'Rugby');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportes_deportistas`
--

CREATE TABLE `deportes_deportistas` (
  `dd_dep_id` int(11) NOT NULL,
  `dd_dte_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `deportistas`
--

CREATE TABLE `deportistas` (
  `dep_id` int(11) NOT NULL,
  `dep_nombre` varchar(50) NOT NULL,
  `dep_apellidos` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `deportistas`
--

INSERT INTO `deportistas` (`dep_id`, `dep_nombre`, `dep_apellidos`) VALUES
(1, 'Ashli', 'McGillivrie'),
(2, 'Jaimie', 'Chell'),
(3, 'Hartwell', 'Rolley'),
(4, 'Cherie', 'Senner'),
(5, 'Mortimer', 'Toulson'),
(6, 'Ophelie', 'Peckitt'),
(7, 'Helge', 'Lough'),
(8, 'Phyllis', 'Kibard'),
(9, 'Sidonia', 'Kosiada'),
(10, 'Shoshana', 'Wimpey'),
(11, 'Jesselyn', 'Giacomuzzo'),
(12, 'Crosby', 'Bartkiewicz'),
(13, 'Jackqueline', 'Quinane'),
(14, 'Trstram', 'Ehlerding'),
(15, 'Hadley', 'Mathewson'),
(16, 'Maurizio', 'Glazier'),
(17, 'Bernadette', 'Fettis'),
(18, 'Natasha', 'Beernt'),
(19, 'Granville', 'Mingotti'),
(20, 'Lianna', 'Hannaby'),
(21, 'Rutherford', 'Restall'),
(22, 'Chrisse', 'Jaegar'),
(23, 'Sharon', 'Wyndham'),
(24, 'Obie', 'MacCall'),
(25, 'Richie', 'Vockins'),
(26, 'Gonzalo', 'Winsor'),
(27, 'Scott', 'MacGray'),
(28, 'Danny', 'Tenant'),
(29, 'Bryana', 'Fieldgate'),
(30, 'Theresita', 'Donan'),
(31, 'Deerdre', 'Notton'),
(32, 'Valentia', 'Ligertwood'),
(33, 'Lauree', 'Duer'),
(34, 'Bent', 'Pengilly'),
(35, 'Adelbert', 'Colnet'),
(36, 'Janine', 'Kershow'),
(37, 'Arvy', 'Snoddon'),
(38, 'Kimbra', 'Schubart'),
(39, 'Nikolaos', 'Counter'),
(40, 'Claire', 'Bastick'),
(41, 'Jenni', 'Kittredge'),
(42, 'Jocko', 'Scough'),
(43, 'Maggy', 'Pauleau'),
(44, 'Mariya', 'Sterrick'),
(45, 'Emmett', 'Derrett'),
(46, 'Katina', 'Exrol'),
(47, 'Courtnay', 'Byrnes'),
(48, 'Heall', 'Chew'),
(49, 'Gaynor', 'Crenshaw'),
(50, 'Elissa', 'Leele');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `deportes`
--
ALTER TABLE `deportes`
  ADD PRIMARY KEY (`dte_id`);

--
-- Indices de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  ADD PRIMARY KEY (`dep_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `deportes`
--
ALTER TABLE `deportes`
  MODIFY `dte_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `deportistas`
--
ALTER TABLE `deportistas`
  MODIFY `dep_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
