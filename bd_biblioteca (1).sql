-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-11-2024 a las 00:23:24
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_biblioteca`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bibliotecarios`
--

CREATE TABLE `bibliotecarios` (
  `id` int(2) NOT NULL,
  `nombres` varchar(60) NOT NULL DEFAULT '',
  `celular` varchar(20) NOT NULL DEFAULT '',
  `correo` varchar(60) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_prestamo`
--

CREATE TABLE `detalle_prestamo` (
  `id` int(6) NOT NULL,
  `id_usuario` int(4) NOT NULL DEFAULT 0,
  `fecha_prestamo` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL,
  `id_libro` int(4) NOT NULL DEFAULT 0,
  `id_prestamo` int(6) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id` int(4) NOT NULL,
  `titulo` varchar(100) NOT NULL DEFAULT '',
  `autor` varchar(100) NOT NULL DEFAULT '',
  `n_paginas` int(4) NOT NULL DEFAULT 0,
  `cantidad` int(3) NOT NULL DEFAULT 0,
  `ubicacion` varchar(10) NOT NULL DEFAULT '',
  `anio` varchar(4) NOT NULL DEFAULT '',
  `editorial` varchar(60) NOT NULL DEFAULT '',
  `pais` varchar(60) NOT NULL DEFAULT '',
  `categoria` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id`, `titulo`, `autor`, `n_paginas`, `cantidad`, `ubicacion`, `anio`, `editorial`, `pais`, `categoria`) VALUES
(1, '100 años de soledad', 'Gabriel García Márquez', 200, 0, '0', '0', '0', '0', '0'),
(2, 'aves sin nido', 'clorinda mato de turnez', 180, 0, '0', '0', '0', '0', '0'),
(3, 'Tradiciones peruanas', 'Ricardo Palma', 300, 0, '0', '0', '0', '0', '0'),
(5, 'Orgullo y prejuicio', 'Jane Austen', 354, 0, '0', '0', '0', '0', '0'),
(6, 'El retrato de Dorian Gray', 'oscar willey', 304, 0, '0', '0', '0', '0', '0'),
(7, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 309, 0, '0', '0', '0', '0', '0'),
(8, 'la divina comedia', 'dante', 100, 0, '0', '0', '0', '0', '0'),
(10, 'tradiciones en salsa verde', 'ricardo palma', 150, 0, '0', '0', '0', '0', '0'),
(13, '100 años de soledad', 'desconocido', 100, 0, '0', '0', '0', '0', '0'),
(14, 'mi raza', 'luis caceres velazquez', 380, 0, '0', '0', '0', '0', '0');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `id` int(6) NOT NULL,
  `id_bibliotecario` int(2) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(4) NOT NULL,
  `nombres` varchar(80) NOT NULL DEFAULT '''''',
  `apellido` varchar(20) NOT NULL DEFAULT '''''',
  `dni` varchar(8) NOT NULL DEFAULT '''''',
  `correo` varchar(20) NOT NULL DEFAULT '',
  `celular` varchar(10) NOT NULL DEFAULT '''''',
  `user` varchar(20) NOT NULL DEFAULT '''''',
  `password` varchar(20) NOT NULL DEFAULT '',
  `direccion` varchar(60) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bibliotecarios`
--
ALTER TABLE `bibliotecarios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_usuario_idx` (`id_usuario`),
  ADD KEY `fk_id_libro_idx` (`id_libro`),
  ADD KEY `fk_id_prestamo_idx` (`id_prestamo`);

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`,`titulo`,`autor`,`n_paginas`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_bibliotecario_idx` (`id_bibliotecario`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bibliotecarios`
--
ALTER TABLE `bibliotecarios`
  MODIFY `id` int(2) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(4) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_prestamo`
--
ALTER TABLE `detalle_prestamo`
  ADD CONSTRAINT `fk_id_libro` FOREIGN KEY (`id_libro`) REFERENCES `libros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_prestamo` FOREIGN KEY (`id_prestamo`) REFERENCES `prestamo` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_id_usuario` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `fk_id_bibliotecario` FOREIGN KEY (`id_bibliotecario`) REFERENCES `bibliotecarios` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
