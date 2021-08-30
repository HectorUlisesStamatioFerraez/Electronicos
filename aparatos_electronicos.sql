-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-08-2021 a las 06:17:15
-- Versión del servidor: 10.4.19-MariaDB
-- Versión de PHP: 8.0.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `aparatos_electronicos`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_create` (IN `p_nombre` VARCHAR(255), IN `p_calle` VARCHAR(255), IN `p_colonia` VARCHAR(255), IN `p_CodigoPostal` INT, IN `p_Estado` VARCHAR(255), IN `p_Pais` VARCHAR(255), IN `p_fechaRegistro` DATE)  BEGIN
	DECLARE v_idAddress INT;
    
	INSERT INTO direcciones(calle, colonia, CodigoPostal, Estado, Pais) VALUES(p_calle, p_colonia, p_codigoPostal, p_estado, p_pais);
    
    SELECT LAST_INSERT_ID() INTO v_idAddress;
    
    INSERT INTO registroproducto(nombre,fechaRegistro, addressId, status) VALUES(p_nombre,p_fechaRegistro,v_idAddress,1);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_delete` (IN `p_id` INT)  BEGIN
UPDATE registroproducto
SET status=0
WHERE id = p_id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findAll` ()  BEGIN

SELECT * FROM registroproducto AS G INNER JOIN direcciones AS A ON (G.addressId = A.idAddress);

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_findById` (IN `p_id` INT)  BEGIN

SELECT * FROM registroproducto AS G INNER JOIN direcciones AS A ON (G.addressId = A.idAddress) WHERE id = p_id ;

END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_update` (IN `p_id` INT, IN `p_nombre` VARCHAR(255), IN `p_idAddress` INT, IN `p_calle` VARCHAR(255), IN `p_colonia` VARCHAR(255), IN `p_CodigoPostal` INT, IN `p_Estado` VARCHAR(255), IN `p_Pais` VARCHAR(255), IN `p_fechaRegistro` DATE)  BEGIN
UPDATE `Direcciones` SET `calle`=p_calle,`colonia`=p_colonia,`CodigoPostal`=p_CodigoPostal,`Estado`=p_Estado,`Pais`=p_Pais WHERE idAddress = p_idAddress;

UPDATE registroproducto SET nombre = p_nombre, fechaRegistro = p_fechaRegistro WHERE id = p_id;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direcciones`
--

CREATE TABLE `direcciones` (
  `idAddress` int(11) NOT NULL,
  `calle` varchar(255) NOT NULL,
  `colonia` varchar(255) NOT NULL,
  `codigoPostal` int(5) NOT NULL,
  `estado` varchar(255) NOT NULL,
  `pais` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `direcciones`
--

INSERT INTO `direcciones` (`idAddress`, `calle`, `colonia`, `codigoPostal`, `estado`, `pais`) VALUES
(16, 'San Miguel', 'Tlalpan', 62758, 'Ciudad de México', 'México'),
(17, 'Reforma', 'Independencia', 78956, 'Morelos', 'México'),
(18, 'Morelos', 'DSA', 312424, 'Morelos', 'México'),
(19, 'Morelos', 'Parres', 32156, 'Morelos', 'México'),
(20, 'Cocoyoc', 'DSADA', 23454, 'Morelos', 'México'),
(21, 'Tabachines', 'Lomas del Carril', 62583, 'Morelos', 'México'),
(22, 'San Cristóbal Colón', 'El Paraíso', 67890, 'Veracruz', 'México'),
(23, 'Rosas', 'Lomas de Guadalupe', 123456, 'Chiapas', 'México'),
(24, 'José María Morelos', 'Chipitlán', 62070, 'Morelos', 'México'),
(25, 'Melchor Ocampo', 'Luis Echeverria', 62772, 'Morelos', 'México'),
(26, 'Vicente Guerrero', 'Azteca', 65789, 'Morelos', 'México'),
(27, 'Vicente Guerrero', 'Azteca', 65789, 'Morelos', 'México'),
(28, 'Miguel Hidalgo', 'Chamilpa', 62210, 'Morelos', 'México'),
(29, 'Torrres', 'La estación', 67543, 'Morelos', 'México'),
(30, 'Geranios', 'Palo escrito', 67804, 'Morelos', 'México');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `registroproducto`
--

CREATE TABLE `registroproducto` (
  `id` int(11) NOT NULL,
  `nombre` varchar(120) NOT NULL,
  `addressId` int(11) NOT NULL,
  `fechaRegistro` date NOT NULL,
  `status` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `registroproducto`
--

INSERT INTO `registroproducto` (`id`, `nombre`, `addressId`, `fechaRegistro`, `status`) VALUES
(10, 'Celular', 21, '2021-08-28', 0),
(11, 'Audífonos', 22, '2021-08-28', 1),
(12, 'Televisión', 23, '2021-08-13', 0),
(13, 'Webcam', 24, '2021-09-01', 1),
(14, 'Ventiladores para Laptop', 25, '2021-08-28', 1),
(15, 'Micrófono', 26, '2021-09-02', 1),
(17, 'Bocinas', 28, '2021-08-27', 0),
(18, 'Mouse', 29, '2021-08-18', 1),
(19, 'Tablet', 30, '2021-08-25', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  ADD PRIMARY KEY (`idAddress`);

--
-- Indices de la tabla `registroproducto`
--
ALTER TABLE `registroproducto`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_id_address` (`addressId`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `direcciones`
--
ALTER TABLE `direcciones`
  MODIFY `idAddress` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de la tabla `registroproducto`
--
ALTER TABLE `registroproducto`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `registroproducto`
--
ALTER TABLE `registroproducto`
  ADD CONSTRAINT `fk_id_address` FOREIGN KEY (`addressId`) REFERENCES `direcciones` (`idAddress`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
