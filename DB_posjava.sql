-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-06-2024 a las 19:19:09
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `posjava`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockDeProducto` (IN `productoId` INT, IN `nuevoStock` INT)   BEGIN
    UPDATE productos SET Stock = nuevoStock WHERE IdProducto = productoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarClientesPorFechaCrea` (IN `fecha` DATE)   BEGIN
    SELECT COUNT(*) AS NumeroClientes FROM clientes WHERE FechaCrea = fecha;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `DesactivarProducto` (IN `productoId` INT)   BEGIN
    UPDATE productos SET Estado = '0' WHERE IdProducto = productoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCategoriasPorNombreYEstado` ()   BEGIN
    SELECT Nombre, Estado
    FROM categorias
    WHERE Estado = '1' AND Nombre LIKE '%Gama%';
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClientesPorRangoFechas` (IN `p_FechaInicio` DATE, IN `p_FechaFin` DATE)   BEGIN
    SELECT * FROM clientes
    WHERE FechaCrea BETWEEN p_FechaInicio AND p_FechaFin;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClientesPorUsuarioCrea` (IN `usuario` INT)   BEGIN
    SELECT Nombre, Correo FROM clientes WHERE UsuarioCrea = usuario;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorCategoria` (IN `categoria` INT)   BEGIN
    SELECT * FROM productos WHERE IdCategoria = categoria;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorRangoDePrecio` (IN `minPrecio` DECIMAL(10,2), IN `maxPrecio` DECIMAL(10,2))   BEGIN
    SELECT * FROM productos WHERE PrecioVenta BETWEEN minPrecio AND maxPrecio;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerProximoIdDisponible` ()   BEGIN
    DECLARE maxId INT;

    -- Obtener el máximo ID actualmente en uso
    SELECT MAX(IdCliente) INTO maxId FROM clientes;

    -- Si no hay registros en la tabla, comenzamos desde 1
    IF maxId IS NULL THEN
        SET maxId = 0;
    END IF;

    -- Devolver el próximo ID disponible
    SELECT maxId + 1 AS ProximoId;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spPCarosxAnio` (IN `year` INT)   BEGIN
    SELECT p.Nombre AS NombreProducto, p.PrecioVenta AS Precio
    FROM productos p
    WHERE YEAR(p.FechaCrea) = year
    ORDER BY p.PrecioVenta DESC
    LIMIT 10;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spStockPorAnio` (IN `year` INT)   BEGIN
    SELECT p.Nombre AS nombre, SUM(p.Stock) AS stock
    FROM productos p
    WHERE YEAR(p.FechaCrea) = year
    GROUP BY p.Nombre;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasPorMes` (IN `an` INT)   BEGIN
    SELECT MONTH(v.FechaVenta) AS mes, SUM(dv.Precio * dv.Cantidad) AS total
    FROM ventas v
    INNER JOIN detallesventa dv ON v.IdVenta = dv.IdVenta
    WHERE YEAR(v.FechaVenta) = an
    GROUP BY MONTH(v.FechaVenta);
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `IdCategoria` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `Descripcion` text DEFAULT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  `Estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`IdCategoria`, `Nombre`, `Descripcion`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`, `Estado`) VALUES
(1, 'Gama Alta', 'Celulares de gama alta con las últimas tecnologías', 1, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(2, 'Gama Media', 'Celulares de gama media con buen rendimiento y precio', 1, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(3, 'Gama Baja', 'Celulares económicos con funciones básicas', 2, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(4, '5G', 'Celulares compatibles con redes 5G', 2, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(5, 'Android', 'Celulares con sistema operativo Android', 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(6, 'iOS', 'Celulares con sistema operativo iOS', 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(7, 'Pantalla Grande', 'Celulares con pantallas de 6.5 pulgadas o más', 4, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(8, 'Compactos', 'Celulares con pantallas de menos de 6 pulgadas', 4, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(9, 'Batería de Larga Duración', 'Celulares con baterías de alta capacidad', 5, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(10, 'Cámara Avanzada', 'Celulares con cámaras de alta resolución y múltiples lentes', 5, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(11, 'Resistentes al Agua', 'Celulares con certificación de resistencia al agua', 6, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(12, 'Dual SIM', 'Celulares con capacidad para dos tarjetas SIM', 6, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(13, 'Ediciones Limitadas', 'Celulares en ediciones especiales y limitadas', 7, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(14, 'Desbloqueados', 'Celulares desbloqueados para cualquier operador', 7, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1),
(15, 'Para Juegos', 'Celulares optimizados para gaming', 8, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `IdCliente` int(11) NOT NULL,
  `Nombre` varchar(100) DEFAULT NULL,
  `NumeroDocumento` varchar(20) DEFAULT NULL,
  `Direccion` text DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(255) DEFAULT NULL,
  `Estado` int(11) NOT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`IdCliente`, `Nombre`, `NumeroDocumento`, `Direccion`, `Telefono`, `Correo`, `Estado`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`) VALUES
(1, 'Martin', '72029016', 'oquendo', '940454121', 'martin@gmail.com', 1, 1, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(2, 'Jesus', '12312345', 'marquez', '908123985', 'jesus@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(3, 'Lucia', '45645678', 'rosales', '908765432', 'lucia@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(4, 'Carlos', '78978901', 'suarez', '912345678', 'carlos@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(5, 'Maria', '23423456', 'sanchez', '923456789', 'maria@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(6, 'Jose', '56756789', 'perez', '934567890', 'jose@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(7, 'Ana', '89089012', 'lopez', '945678901', 'ana@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(8, 'Pedro', '34534567', 'garcia', '956789012', 'pedro@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(9, 'Elena', '67867890', 'martinez', '967890123', 'elena@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(10, 'Luis', '90190123', 'hernandez', '978901234', 'luis@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(11, 'Claudia', '45612378', 'torres', '989012345', 'claudia@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(12, 'Miguelito', '12343214', 'utp', '990123456', 'miguel@gmail.com', 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detallesventa`
--

CREATE TABLE `detallesventa` (
  `IdDetalleVenta` int(11) NOT NULL,
  `IdVenta` int(11) DEFAULT NULL,
  `IdProducto` int(11) DEFAULT NULL,
  `Cantidad` int(11) DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Descuento` decimal(18,2) DEFAULT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detallesventa`
--

INSERT INTO `detallesventa` (`IdDetalleVenta`, `IdVenta`, `IdProducto`, `Cantidad`, `Precio`, `Descuento`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`) VALUES
(21, 21, 1, 2, 499.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(22, 22, 2, 1, 399.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(23, 29, 3, 1, 899.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(24, 24, 4, 1, 999.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(25, 25, 5, 2, 899.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(26, 26, 6, 1, 499.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(27, 27, 7, 2, 399.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(28, 28, 8, 1, 399.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(29, 30, 9, 1, 399.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(30, 31, 10, 1, 349.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(31, 32, 11, 1, 849.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(32, 33, 12, 1, 999.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(33, 34, 13, 1, 299.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(34, 35, 14, 1, 399.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(35, 36, 15, 1, 349.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(36, 37, 1, 1, 1199.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(37, 38, 2, 1, 1099.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(38, 36, 3, 1, 899.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(39, 36, 4, 1, 999.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL),
(40, 34, 5, 1, 899.99, 0.00, 1, '2024-05-29 16:38:28', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `IdProducto` int(11) NOT NULL,
  `Codigo` text DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Stock` int(11) NOT NULL,
  `Imagen` text DEFAULT NULL,
  `PrecioVenta` decimal(18,2) NOT NULL,
  `IdCategoria` int(11) NOT NULL,
  `Estado` int(11) NOT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`IdProducto`, `Codigo`, `Nombre`, `Stock`, `Imagen`, `PrecioVenta`, `IdCategoria`, `Estado`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`) VALUES
(1, 'CEL001', 'iPhone 13 Pro', 50, NULL, 1199.99, 1, 1, 1, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(2, 'CEL002', 'Samsung Galaxy S21 Ultra', 45, NULL, 1099.99, 1, 1, 2, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(3, 'CEL003', 'Google Pixel 6 Pro', 30, NULL, 899.99, 1, 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(4, 'CEL004', 'OnePlus 9 Pro', 35, NULL, 999.99, 1, 1, 4, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(5, 'CEL005', 'Xiaomi Mi 11 Ultra', 40, NULL, 899.99, 1, 1, 5, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(6, 'CEL006', 'iPhone SE (2022)', 60, NULL, 499.99, 2, 1, 6, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(7, 'CEL007', 'Samsung Galaxy A52', 55, NULL, 399.99, 2, 1, 7, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(8, 'CEL008', 'Google Pixel 5a', 65, NULL, 399.99, 2, 1, 8, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(9, 'CEL009', 'OnePlus Nord 2', 70, NULL, 399.99, 2, 1, 1, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(10, 'CEL010', 'Xiaomi Redmi Note 11 Pro', 75, NULL, 349.99, 2, 1, 2, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(11, 'CEL011', 'Samsung Galaxy Tab S7+', 25, NULL, 849.99, 3, 1, 3, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(12, 'CEL012', 'iPad Pro 2021', 20, NULL, 999.99, 3, 1, 4, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(13, 'CEL013', 'Samsung Galaxy Watch 4', 15, NULL, 299.99, 4, 1, 5, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(14, 'CEL014', 'Apple Watch Series 7', 10, NULL, 399.99, 4, 1, 6, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL),
(15, 'CEL015', 'Sony WH-1000XM4', 5, NULL, 349.99, 5, 1, 7, '2024-05-26 00:00:00', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL,
  `NombreUsuario` varchar(50) DEFAULT NULL,
  `Contrasena` text DEFAULT NULL,
  `Correo` text DEFAULT NULL,
  `Imagen` text DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`IdUsuario`, `NombreUsuario`, `Contrasena`, `Correo`, `Imagen`, `Estado`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`) VALUES
(1, 'usuario1', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(2, 'usuario2', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(3, 'usuario3', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(4, 'usuario4', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(5, 'usuario5', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(6, 'usuario6', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(7, 'usuario7', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(8, 'usuario8', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(9, 'usuario9', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00'),
(10, 'usuario10', NULL, NULL, NULL, NULL, 0, '0000-00-00 00:00:00', NULL, NULL, NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `IdVenta` int(11) NOT NULL,
  `IdCliente` int(11) DEFAULT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `FechaVenta` datetime DEFAULT NULL,
  `Impuesto` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Estado` int(11) DEFAULT NULL,
  `UsuarioCrea` int(11) NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int(11) DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int(11) DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`IdVenta`, `IdCliente`, `IdUsuario`, `FechaVenta`, `Impuesto`, `Total`, `Estado`, `UsuarioCrea`, `FechaCrea`, `UsuarioModifica`, `FechaModifica`, `UsuarioElimina`, `FechaElimina`) VALUES
(21, 1, 1, '2023-01-15 10:00:00', 10.00, 110.00, 1, 1, '2023-01-15 10:00:00', NULL, NULL, NULL, NULL),
(22, 2, 1, '2023-02-20 12:00:00', 15.00, 165.00, 1, 2, '2023-02-20 12:00:00', NULL, NULL, NULL, NULL),
(23, 3, 2, '2023-03-25 14:00:00', 12.00, 132.00, 1, 3, '2023-03-25 14:00:00', NULL, NULL, NULL, NULL),
(24, 4, 2, '2023-04-30 16:00:00', 18.00, 198.00, 1, 4, '2023-04-30 16:00:00', NULL, NULL, NULL, NULL),
(25, 5, 3, '2023-05-05 18:00:00', 20.00, 220.00, 1, 5, '2023-05-05 18:00:00', NULL, NULL, NULL, NULL),
(26, 6, 3, '2023-06-10 20:00:00', 25.00, 275.00, 1, 6, '2023-06-10 20:00:00', NULL, NULL, NULL, NULL),
(27, 7, 4, '2023-07-15 09:00:00', 22.00, 242.00, 1, 7, '2023-07-15 09:00:00', NULL, NULL, NULL, NULL),
(28, 8, 4, '2023-08-20 11:00:00', 30.00, 330.00, 1, 8, '2023-08-20 11:00:00', NULL, NULL, NULL, NULL),
(29, 9, 5, '2023-09-25 13:00:00', 28.00, 308.00, 1, 9, '2023-09-25 13:00:00', NULL, NULL, NULL, NULL),
(30, 10, 5, '2023-10-30 15:00:00', 35.00, 385.00, 1, 10, '2023-10-30 15:00:00', NULL, NULL, NULL, NULL),
(31, 1, 6, '2023-11-05 17:00:00', 32.00, 352.00, 1, 1, '2023-11-05 17:00:00', NULL, NULL, NULL, NULL),
(32, 2, 6, '2023-12-10 19:00:00', 40.00, 440.00, 1, 2, '2023-12-10 19:00:00', NULL, NULL, NULL, NULL),
(33, 3, 7, '2024-01-15 08:00:00', 45.00, 495.00, 1, 3, '2024-01-15 08:00:00', NULL, NULL, NULL, NULL),
(34, 4, 7, '2024-02-20 10:00:00', 42.00, 462.00, 1, 4, '2024-02-20 10:00:00', NULL, NULL, NULL, NULL),
(35, 5, 8, '2024-03-25 12:00:00', 50.00, 550.00, 1, 5, '2024-03-25 12:00:00', NULL, NULL, NULL, NULL),
(36, 6, 8, '2024-04-30 14:00:00', 48.00, 528.00, 1, 6, '2024-04-30 14:00:00', NULL, NULL, NULL, NULL),
(37, 7, 9, '2024-05-05 16:00:00', 55.00, 605.00, 1, 7, '2024-05-05 16:00:00', NULL, NULL, NULL, NULL),
(38, 8, 9, '2024-06-10 18:00:00', 52.00, 572.00, 1, 8, '2024-06-10 18:00:00', NULL, NULL, NULL, NULL),
(39, 9, 10, '2024-07-15 20:00:00', 60.00, 660.00, 1, 9, '2024-07-15 20:00:00', NULL, NULL, NULL, NULL),
(40, 10, 10, '2024-08-20 09:00:00', 58.00, 638.00, 1, 10, '2024-08-20 09:00:00', NULL, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`IdCategoria`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`IdCliente`);

--
-- Indices de la tabla `detallesventa`
--
ALTER TABLE `detallesventa`
  ADD PRIMARY KEY (`IdDetalleVenta`),
  ADD KEY `IdProducto` (`IdProducto`),
  ADD KEY `IdVenta` (`IdVenta`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`IdProducto`),
  ADD KEY `IdCategoria` (`IdCategoria`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`IdUsuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`IdVenta`),
  ADD KEY `IdCliente` (`IdCliente`),
  ADD KEY `IdUsuario` (`IdUsuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `IdCategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `IdCliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT de la tabla `detallesventa`
--
ALTER TABLE `detallesventa`
  MODIFY `IdDetalleVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `IdProducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `IdUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `IdVenta` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detallesventa`
--
ALTER TABLE `detallesventa`
  ADD CONSTRAINT `detallesventa_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  ADD CONSTRAINT `detallesventa_ibfk_2` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`IdVenta`);

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
