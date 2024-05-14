-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost: 3307
-- Tiempo de generación: 13-06-2023 a las 19:01:13
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `pet_manager`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cat`
--

CREATE TABLE `cat` (
  `cat_code` varchar(5) NOT NULL,
  `cat_breed` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cat`
--

INSERT INTO `cat` (`cat_code`, `cat_breed`) VALUES
('002', 'Angora'),
('004', 'Caracat'),
('006', 'Criollo'),
('008', 'Siames');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `doctor`
--

CREATE TABLE `doctor` (
  `doc_code` varchar(10) NOT NULL,
  `doc_name` varchar(30) NOT NULL,
  `doc_licencia` varchar(20) NOT NULL,
  `doc_veterinary` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `doctor`
--

INSERT INTO `doctor` (`doc_code`, `doc_name`, `doc_licencia`, `doc_veterinary`) VALUES
('1001201776', 'Angie Alfonso', 'LS98464', '56474893'),
('1012316748', 'Jennyfer Sanchez', 'CG34567', '56474893');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dog`
--

CREATE TABLE `dog` (
  `dog_code` varchar(5) NOT NULL,
  `dog_breed` varchar(20) NOT NULL,
  `dog_pedigree` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `dog`
--

INSERT INTO `dog` (`dog_code`, `dog_breed`, `dog_pedigree`) VALUES
('001', 'Criollo', 0),
('003', 'Pastor Aleman', 1),
('005', 'Schanauzer', 1),
('007', 'Bull Dog', 1),
('009', 'Beagle', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pet`
--

CREATE TABLE `pet` (
  `pet_code` varchar(3) NOT NULL,
  `pet_name` varchar(20) NOT NULL,
  `pet_bornYear` int(11) NOT NULL,
  `pet_color` varchar(10) NOT NULL,
  `pet_healthStatus` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pet`
--

INSERT INTO `pet` (`pet_code`, `pet_name`, `pet_bornYear`, `pet_color`, `pet_healthStatus`) VALUES
('001', 'Bonnie', 2021, 'Negro', 'Sano'),
('002', 'Nieves', 2019, 'Blanco', 'Enfermo'),
('003', 'Pulgas', 2022, 'Cafe', 'Sano'),
('004', 'Tito', 2014, 'Cafe', 'Fracturado'),
('005', 'Spike', 2016, 'Gris', 'Muerto'),
('006', 'Pimienta', 2018, 'amarillo', 'Sano'),
('007', 'Rokki', 2016, 'Cafe', 'hospitalizado'),
('008', 'Kitty', 2023, 'Cafe', 'Sano'),
('009', 'Tony', 2013, 'Gris', 'Muerto');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pethospital`
--

CREATE TABLE `pethospital` (
  `peth_code` varchar(3) NOT NULL,
  `peth_vete` varchar(10) NOT NULL,
  `peth_pet` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pethospital`
--

INSERT INTO `pethospital` (`peth_code`, `peth_vete`, `peth_pet`) VALUES
('P01', '56474893', '001'),
('P02', '56474893', '002'),
('P03', '56474893', '003');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `veterinary`
--

CREATE TABLE `veterinary` (
  `vet_code` varchar(10) NOT NULL,
  `vet_name` varchar(20) NOT NULL,
  `vet_phone` varchar(20) NOT NULL,
  `vet_addres` varchar(30) NOT NULL,
  `vet_pacientType` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `veterinary`
--

INSERT INTO `veterinary` (`vet_code`, `vet_name`, `vet_phone`, `vet_addres`, `vet_pacientType`) VALUES
('56474893', 'Kapporet', '061-789045', 'Kapporet@Kapp.com.co', 'Animal');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cat`
--
ALTER TABLE `cat`
  ADD PRIMARY KEY (`cat_code`);

--
-- Indices de la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD PRIMARY KEY (`doc_code`),
  ADD KEY `doc_veterinary` (`doc_veterinary`);

--
-- Indices de la tabla `dog`
--
ALTER TABLE `dog`
  ADD PRIMARY KEY (`dog_code`);

--
-- Indices de la tabla `pet`
--
ALTER TABLE `pet`
  ADD PRIMARY KEY (`pet_code`);

--
-- Indices de la tabla `pethospital`
--
ALTER TABLE `pethospital`
  ADD PRIMARY KEY (`peth_code`),
  ADD KEY `peth_vete` (`peth_vete`),
  ADD KEY `peth_pet` (`peth_pet`);

--
-- Indices de la tabla `veterinary`
--
ALTER TABLE `veterinary`
  ADD PRIMARY KEY (`vet_code`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cat`
--
ALTER TABLE `cat`
  ADD CONSTRAINT `cat_ibfk_1` FOREIGN KEY (`cat_code`) REFERENCES `pet` (`pet_code`);

--
-- Filtros para la tabla `doctor`
--
ALTER TABLE `doctor`
  ADD CONSTRAINT `doctor_ibfk_1` FOREIGN KEY (`doc_veterinary`) REFERENCES `veterinary` (`vet_code`);

--
-- Filtros para la tabla `dog`
--
ALTER TABLE `dog`
  ADD CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`dog_code`) REFERENCES `pet` (`pet_code`);

--
-- Filtros para la tabla `pethospital`
--
ALTER TABLE `pethospital`
  ADD CONSTRAINT `pethospital_ibfk_1` FOREIGN KEY (`peth_vete`) REFERENCES `veterinary` (`vet_code`),
  ADD CONSTRAINT `pethospital_ibfk_2` FOREIGN KEY (`peth_pet`) REFERENCES `pet` (`pet_code`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
