-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-02-2024 a las 14:05:19
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
-- Base de datos: `bd_moda`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `marcas`
--

CREATE TABLE `marcas` (
  `marca_id` int(11) NOT NULL,
  `marca_nombre` varchar(50) NOT NULL,
  `marca_logo` varchar(50) NOT NULL,
  `marca_descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nombre`, `marca_logo`, `marca_descripcion`) VALUES
(1, 'Agatha Kids', 'logoAgathaKids.jpg', 'Se podría definir el estilo de Agatha Ruiz de la Prada como un estilo muy propio y particular…, un estilo divertido y optimista… con un punto de atrevimiento…, y, \r\ndonde el color y el volumen son protagonistas. Su estilo se basa también en la “moda cómoda”, llegar al mayor número posible de gente (democratización de la moda \r\n“agathizando el mundo”…), en la ecología y en su relación con el arte contemporáneo.En poca palabras tendríamos “Color, caos, concepto”, definiendo a la diseñadora \r\ncomo “la artista más polifacética que existe en España y una de las más originales y tenaces del mundo”'),
(2, 'Bouchra Jarrar', 'logoBouchraJarrar.jpg', 'Lleva cinco colecciones y es considerada una de las promesas de la Alta Costura parisina. Antes de iniciar su propia marca, Bouchra trabajó como \r\nasistente de las casas Balenciaga y Christian Lacroix, y parecía estar condenada a seguir la tradición de los talentos que nunca desarrollan su propia carrera. \r\nAhora es la única mujer que integra el grupo de creadores de la semana de alta costura parisina y el año pasado fue candidata al premio ANDAM, que entrega\r\n el sindicato de costura de Francia y Vogue París. Su estilo es definido como minimalismo de lujo, ya que crea diseños muy simples, pero con códigos.'),
(3, 'CK Men', 'logoCKMen.jpg', 'Los Clásicos diseños de tonos neutrales de Calvin Klein, revolucionaron la industria con un estilo básico y minimalista, \r\nlo que le convirtió en un icono en el mundo de la moda. A finales de los setentas y principios de los ochentas, Klein introdujo un nuevo concepto: \r\npantalones vaqueros a un precio accesible. \r\n\r\nLas habilidades revolucionarias de Klein no pararon allí. En 1982, Klein introdujo su línea de ropa interior de Calvin Klein y creo una línea de perfumes, \r\ncon la introducción de fragancias que se convirtieron en muy populares. Klein fue el primero en lanzar una línea de las fragancias unisex, \r\nlo que subraya mucho mas su papel como pionero.\r\n\r\nNo solamente un visionario de la moda, sino que también se le conoce como genio de la comercialización. Sus polémicas campañas empezaron a final de los años 80\'s \r\ny luego en los 90\'s introdujo en sus campañas a la delgadísima y desconocida Kate Moss, sirviendole esto como un trampolín para su exitosa carrera de modelo.\r\nGracias a su posición en el mundo de la moda \"practica, moderna, chic, minimalista\" el imperio de Calvin Klein ha convertido su moda en una forma vida, \r\ncon sus colecciones para las mujeres, hombres y el hogar, ropa interior, jeans, fragancias para los hombres y mujeres, así como una línea de belleza y cosméticos.\r\n\r\nEs miembro de numerosos comités, y uno de los diseñadores mas solicitados por las grandes celebridades. '),
(4, 'Desigual', 'logoDesigual.jpg', 'Tal y como su propio nombre indica, la marca Desigual \"no es lo mismo\". Se distingue por su diseño multicolor, que despierta emociones positivas y una \r\nsensación de innovación y diversión. No es el lugar para los que se decanten hacia colores oscuros. \r\nDesde 1984 Desigual no ha dejado de sacar al mercado prendas de ropa originales para niños y adultos. La marca se adapta perfectamente a nuestro mundo de hoy, \r\nen el que no hay lugar para la conformidad y lo que realmente cuenta es lo especial y extravagante. Con sus coloridos estampados, los diseñadores pretenden \r\ntransmitir alegría, felicidad y creatividad, además de mantenerse siempre a la moda y no perder el estilo propio. De esta manera, Desigual logra marcar \r\nnuevas tendencias y enamorar a los que quieren alejarse de lo común y corriente. Chaquetas, abrigos, vestidos y faldas: todas las prendas de Desigual \r\nson alternativos y alegres resaltando el estilo individual de la persona que las lleva. En definitiva, Desigual es la marca alternativa que llena tu vida de colores\r\n\r\n¡Únete al colorido, moderno y juvenil mundo de Desigual!\r\n'),
(5, 'Elie Saab', 'logoElieSaab.jpg', 'Elie Saab sabe cuál es la formula del éxito y no está dispuesto a cambiarla. Vestidos de líneas clásicas, aderezados con pedrería y toda la carga de la \r\nfeminidad en sutiles transparencias. El imaginario sofisticado, rebosante de elegancia y delicadeza, del diseñador libanés ha conseguido, con el tiempo, \r\ncrear una legión de fans en el competitivo mundo de la moda, y hoy ha logrado captar todas las miradas en sus pasarelas.\r\n\r\nLa alta costura es un lenguaje en el que Saab se mueve como nadie.'),
(6, 'Jean Paul Gaultier', 'logoJPG.jpg', 'Deja patente su gusto por combinar texturas delicadas y diferentes, como el tul con el cuero, y la ropa informal con piezas formales. \r\nEste mestizaje y mezcla de estilos es algo que no pasa desapercibido a la crítica, lo que le pronostica una exitosa carrera.\r\nSu característico estilo irreverente data de 1981 y es conocido como el enfant terrible (chico rebelde) de la moda francesa. \r\nMuchas de las colecciones de Gaultier están basadas en ropa callejera, inspirándose en la cultura popular, mientras otras, \r\nparticularmente sus colecciones de alta costura, son muy formales y al mismo tiempo inusuales. Ambas forman el amplio espectro abarcado por Gaultier.\r\n'),
(7, 'Roberto Cavalli', 'logoRCM.jpg', 'Roberto Cavalli es sinónimo de alegría y optimismo, con glamour y éxito, lujo y belleza. Su mundo es inconformista y libre, sensual y siempre seductor.\r\n\r\nRoberto Cavalli concibe la moda como una experiencia total. El estilo que propone no es simplemente una manera de vestir, sino una forma de ser: un estilo de vida.\r\n\r\nEs capaz de transmitir una gran energía con todo lo que hace. Su estilo cambia constantemente, en una interminable búsqueda de soluciones técnicas y artísticas nuevas.\r\n\r\nSu capacidad para comprender, sacar y poner de relieve el glamour escondido en cada mujer, es incomparable.\r\n\r\nSu lema es \"un vestido puede cambiar su vida\" y muchas celebridades y amigos de todo el mundo que se identifican con su estilo multifacético. '),
(8, 'Valentino', 'logoValentino.jpg', 'Sutiles vestidos para las más elegantes. En Valentino las cosas se siguen haciendo como siempre se han hecho. \r\nSus valores, tradición y códigos siguen intactos, y la ligereza y ensoñadora belleza es uno de los más sagrados. \r\n\r\n\r\n\r\n\r\n\r\nLa descripción exacta del desfile de Alta Costura de Valentino sería simplemente: “impresionante”. Incluso algunos se atreven a aventurar que el de \r\nla maison italiana es toda una lección de Alta Costura, y en ningún caso hay espacio o lugar para las críticas. \r\n\r\nLa reconfortante sensación de expectativas cumplidas: una inenarrable sucesión de vestidos de princesa, llenos de fantasía y ensueño, una clara evocación\r\na momentos de cuento de hadas que nunca viviremos y una transportación automática a mundos mágicos, llenos de animales, texturas, colores y seres fantásticos. \r\n\r\nTodo impecablemente ideado, estructurado y presentado. Sí, es Valentino. '),
(9, 'Vionnet', 'logoVionnet.jpg', 'El estilo de Vionnet, culto a la belleza de un cuerpo libre, se caracteriza por ser de una modernidad nunca vista hasta entonces; Se basa en el drapeado \r\ndel peplos griego -presente en su logo-, que dejaba en libertad al cuerpo y que, al mismo tiempo, realza las curvas naturales: \r\n“Me he aplicado a liberar, como para la mujer, el tejido de las trabas que se le imponían. He intentado darle un equilibrio tal que el movimiento\r\nno desplazara las líneas, sino que las magnificara” (Vonnet). Un estilo purista que llegó a su máximo apogeo en los años treinta del siglo XX, \r\ncuando las curvas  de la mujer  volvieron a estar presentes en la moda, pasado el momento garconne y rectangular de los años veinte.\r\n\r\nMadeleine Vionnet estudia el cuerpo de la mujer a manera de la Medicina, para de ese modo preservar su belleza natural y obligar al vestido a adaptarse a \r\nla silueta. Los colores que usaba sonclásicos, siendo su preferido el blanco en todos sus matices. Además, la diseñadora procura no recargar excesivamente sus \r\ncreaciones, utilizando como adornos bordados, rosas o nudos estilizados. Enemiga de la moda por ser efímera, Vionnet se dedica a una búsqueda constante \r\nde la coherencia entre el cuerpo y el vestido, lo que le lleva a innovar en las técnicas del corte, y el bies fue su marca de identificación. \r\nNo lo inventó, pero llegó a dominar la técnica como nadie. Apasionada como era de la técnica y de la inventiva, también investigó otras cualidades del tejido\r\ncomo la caída, el reflejo de la luz y la combinación de las dos caras -mate y brillante-.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `modelos`
--

CREATE TABLE `modelos` (
  `mod_id` int(11) NOT NULL,
  `mod_nombre` varchar(50) NOT NULL,
  `mod_foto` varchar(50) NOT NULL,
  `mod_marca_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `modelos`
--

INSERT INTO `modelos` (`mod_id`, `mod_nombre`, `mod_foto`, `mod_marca_id`) VALUES
(1, 'Modelo1', 'Modelo Agatha 1.jpg', 1),
(2, 'Modelo2', 'Modelo Agatha 2.jpg', 1),
(3, 'Modelo3', 'Modelo Agatha 3.jpg', 1),
(4, 'Modelo4', 'Modelo Agatha 4.jpg', 1),
(5, 'Modelo5', 'Modelo Agatha 5.jpg', 1),
(6, 'Modelo6', 'Modelo Agatha 6.jpg', 1),
(7, 'Modelo7', 'Modelo Agatha 7.jpg', 1),
(8, 'Modelo8', 'Modelo Agatha 8.jpg', 1),
(9, 'Modelo9', 'Modelo Agatha 9.jpg', 1),
(10, 'Modelo10', 'Modelo Agatha 10.jpg', 1),
(14, 'Modelo1', 'Modelo bouchra_jarrar 1.jpg', 2),
(15, 'Modelo2', 'Modelo bouchra_jarrar 2.jpg', 2),
(16, 'Modelo3', 'Modelo bouchra_jarrar 3.jpg', 2),
(17, 'Modelo4', 'Modelo bouchra_jarrar 4.jpg', 2),
(18, 'Modelo5', 'Modelo bouchra_jarrar 5.jpg', 2),
(19, 'Modelo6', 'Modelo bouchra_jarrar 6.jpg', 2),
(20, 'Modelo7', 'Modelo bouchra_jarrar 7.jpg', 2),
(21, 'Modelo8', 'Modelo bouchra_jarrar 8.jpg', 2),
(22, 'Modelo9', 'Modelo bouchra_jarrar 9.jpg', 2),
(23, 'Modelo10', 'Modelo bouchra_jarrar 10.jpg', 2),
(24, 'Modelo1', 'Modelo CK 1.jpg', 3),
(25, 'Modelo2', 'Modelo CK 2.jpg', 3),
(26, 'Modelo3', 'Modelo CK 3.jpg', 3),
(27, 'Modelo4', 'Modelo CK 4.jpg', 3),
(28, 'Modelo5', 'Modelo CK 5.jpg', 3),
(29, 'Modelo6', 'Modelo CK 6.jpg', 3),
(30, 'Modelo7', 'Modelo CK 7.jpg', 3),
(31, 'Modelo8', 'Modelo CK 8.jpg', 3),
(32, 'Modelo9', 'Modelo CK 9.jpg', 3),
(33, 'Modelo10', 'Modelo CK 10.jpg', 3),
(34, 'Modelo1', 'Modelo Desigual 1.jpg', 4),
(35, 'Modelo2', 'Modelo Desigual 2.jpg', 4),
(36, 'Modelo3', 'Modelo Desigual 3.jpg', 4),
(37, 'Modelo4', 'Modelo Desigual 4.jpg', 4),
(38, 'Modelo5', 'Modelo Desigual 5.jpg', 4),
(39, 'Modelo6', 'Modelo Desigual 6.jpg', 4),
(40, 'Modelo7', 'Modelo Desigual 7.jpg', 4),
(41, 'Modelo8', 'Modelo Desigual 8.jpg', 4),
(42, 'Modelo9', 'Modelo Desigual 9.jpg', 4),
(43, 'Modelo10', 'Modelo Desigual 10.jpg', 4),
(44, 'Modelo1', 'Modelo Elie Saab 1.jpg', 5),
(45, 'Modelo2', 'Modelo Elie Saab 2.jpg', 5),
(46, 'Modelo3', 'Modelo Elie Saab 3.jpg', 5),
(47, 'Modelo4', 'Modelo Elie Saab 4.jpg', 5),
(48, 'Modelo5', 'Modelo Elie Saab 5.jpg', 5),
(49, 'Modelo6', 'Modelo Elie Saab 6.jpg', 5),
(50, 'Modelo7', 'Modelo Elie Saab 7.jpg', 5),
(51, 'Modelo8', 'Modelo Elie Saab 8.jpg', 5),
(52, 'Modelo9', 'Modelo Elie Saab 9.jpg', 5),
(53, 'Modelo10', 'Modelo Elie Saab 10.jpg', 5),
(54, 'Modelo1', 'Modelo Jean Paul Gaultier 1.jpg', 6),
(55, 'Modelo2', 'Modelo Jean Paul Gaultier 2.jpg', 6),
(56, 'Modelo3', 'Modelo Jean Paul Gaultier 3.jpg', 6),
(57, 'Modelo4', 'Modelo Jean Paul Gaultier 4.jpg', 6),
(58, 'Modelo5', 'Modelo Jean Paul Gaultier 5.jpg', 6),
(59, 'Modelo6', 'Modelo Jean Paul Gaultier 6.jpg', 6),
(60, 'Modelo7', 'Modelo Jean Paul Gaultier 7.jpg', 6),
(61, 'Modelo8', 'Modelo Jean Paul Gaultier 8.jpg', 6),
(62, 'Modelo9', 'Modelo Jean Paul Gaultier 9.jpg', 6),
(63, 'Modelo10', 'Modelo Jean Paul Gaultier 10.jpg', 6),
(64, 'Modelo1', 'Modelo Roberto Cavalli 1.jpg', 7),
(65, 'Modelo2', 'Modelo Roberto Cavalli 2.jpg', 7),
(66, 'Modelo3', 'Modelo Roberto Cavalli 3.jpg', 7),
(67, 'Modelo4', 'Modelo Roberto Cavalli 4.jpg', 7),
(68, 'Modelo5', 'Modelo Roberto Cavalli 5.jpg', 7),
(69, 'Modelo6', 'Modelo Roberto Cavalli 6.jpg', 7),
(70, 'Modelo7', 'Modelo Roberto Cavalli 7.jpg', 7),
(71, 'Modelo8', 'Modelo Roberto Cavalli 8.jpg', 7),
(72, 'Modelo9', 'Modelo Roberto Cavalli 9.jpg', 7),
(73, 'Modelo10', 'Modelo Roberto Cavalli 10.jpg', 7),
(74, 'Modelo1', 'Modelo Valentino 1', 8),
(75, 'Modelo2', 'Modelo Valentino 2.jpg', 8),
(76, 'Modelo3', 'Modelo Valentino 3.jpg', 8),
(77, 'Modelo4', 'Modelo Valentino 4.jpg', 8),
(78, 'Modelo5', 'Modelo Valentino 5.jpg', 8),
(79, 'Modelo6', 'Modelo Valentino 6.jpg', 8),
(80, 'Modelo7', 'Modelo Valentino 7.jpg', 8),
(81, 'Modelo8', 'Modelo Valentino 8.jpg', 8),
(82, 'Modelo9', 'Modelo Valentino 9.jpg', 8),
(83, 'Modelo10', 'Modelo Valentino 10.jpg', 8),
(84, 'Modelo1', 'Modelo Vionnet 1.jpg', 9),
(85, 'Modelo2', 'Modelo Vionnet 2.jpg', 9),
(86, 'Modelo3', 'Modelo Vionnet 3.jpg', 9),
(87, 'Modelo4', 'Modelo Vionnet 4.jpg', 9),
(88, 'Modelo5', 'Modelo Vionnet 5.jpg', 9),
(89, 'Modelo6', 'Modelo Vionnet 6.jpg', 9),
(90, 'Modelo7', 'Modelo Vionnet 7.jpg', 9),
(91, 'Modelo8', 'Modelo Vionnet 8.jpg', 9),
(92, 'Modelo9', 'Modelo Vionnet 9.jpg', 9),
(93, 'Modelo10', 'Modelo Vionnet 10.jpg', 9);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `marcas`
--
ALTER TABLE `marcas`
  ADD PRIMARY KEY (`marca_id`);

--
-- Indices de la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD PRIMARY KEY (`mod_id`),
  ADD KEY `r-marcas-modelos` (`mod_marca_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `marcas`
--
ALTER TABLE `marcas`
  MODIFY `marca_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `modelos`
--
ALTER TABLE `modelos`
  MODIFY `mod_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=94;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `modelos`
--
ALTER TABLE `modelos`
  ADD CONSTRAINT `r-marcas-modelos` FOREIGN KEY (`mod_marca_id`) REFERENCES `marcas` (`marca_id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
