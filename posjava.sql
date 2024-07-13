-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: posjava
-- ------------------------------------------------------
-- Server version	8.0.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorias`
--

DROP TABLE IF EXISTS `categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categorias` (
  `IdCategoria` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Descripcion` text COLLATE utf8mb4_general_ci,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  `Estado` int NOT NULL,
  PRIMARY KEY (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorias`
--

LOCK TABLES `categorias` WRITE;
/*!40000 ALTER TABLE `categorias` DISABLE KEYS */;
INSERT INTO `categorias` VALUES (1,'Gama Alta','Celulares de gama alta con las últimas tecnologías',1,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(2,'Gama Media','Celulares de gama media con buen rendimiento y precio',1,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(3,'Gama Baja','Celulares económicos con funciones básicas',2,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(4,'5G','Celulares compatibles con redes 5G',2,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(5,'Android','Celulares con sistema operativo Android',3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(6,'iOS','Celulares con sistema operativo iOS',3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(7,'Pantalla Grande','Celulares con pantallas de 6.5 pulgadas o más',4,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(8,'Compactos','Celulares con pantallas de menos de 6 pulgadas',4,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(9,'Batería de Larga Duración','Celulares con baterías de alta capacidad',5,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(10,'Cámara Avanzada','Celulares con cámaras de alta resolución y múltiples lentes',5,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(11,'Resistentes al Agua','Celulares con certificación de resistencia al agua',6,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(12,'Dual SIM','Celulares con capacidad para dos tarjetas SIM',6,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(13,'Ediciones Limitadas','Celulares en ediciones especiales y limitadas',7,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(14,'Desbloqueados','Celulares desbloqueados para cualquier operador',7,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL,1),(17,'Gama Media Baja','ssssss',0,'2024-07-13 00:00:00',NULL,NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `NumeroDocumento` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Direccion` text COLLATE utf8mb4_general_ci,
  `Telefono` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Correo` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Estado` int NOT NULL,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Martin','72029016','oquendo','940454121','martin@gmail.com',1,1,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(2,'Jesus','12312345','marquez','908123985','jesus@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(3,'Lucia','45645678','ventanilla','908765432','lucia@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(4,'Carlos','78978901','rimac','912345678','carlos@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(5,'Maria','23423456','la victoria','923456789','maria@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(6,'Jose','56756789','callao','934567890','jose@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(7,'Ana','89089012','Lince','945678901','ana@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(8,'Pedro','34534567','San Isidro','956789012','pedro@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(9,'Elena','67867890','Av. Peru','967890123','elena@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(10,'Luis','90190123','Av. Venezuela','978901234','luis@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(11,'Claudia','45612378','Cono','989012345','claudia@gmail.com',1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detallesventa`
--

DROP TABLE IF EXISTS `detallesventa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detallesventa` (
  `IdDetalleVenta` int NOT NULL AUTO_INCREMENT,
  `IdVenta` int DEFAULT NULL,
  `IdProducto` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Precio` decimal(18,2) DEFAULT NULL,
  `Descuento` decimal(18,2) DEFAULT NULL,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  PRIMARY KEY (`IdDetalleVenta`),
  KEY `IdProducto` (`IdProducto`),
  KEY `IdVenta` (`IdVenta`),
  CONSTRAINT `detallesventa_ibfk_1` FOREIGN KEY (`IdProducto`) REFERENCES `productos` (`IdProducto`),
  CONSTRAINT `detallesventa_ibfk_2` FOREIGN KEY (`IdVenta`) REFERENCES `ventas` (`IdVenta`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detallesventa`
--

LOCK TABLES `detallesventa` WRITE;
/*!40000 ALTER TABLE `detallesventa` DISABLE KEYS */;
INSERT INTO `detallesventa` VALUES (21,21,1,2,499.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(22,22,2,1,399.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(23,29,3,1,899.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(24,24,4,1,999.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(25,25,5,2,899.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(26,26,6,1,499.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(27,27,7,2,399.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(28,28,8,1,399.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(29,30,9,1,399.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(30,31,10,1,349.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(31,32,11,1,849.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(32,33,12,1,999.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(33,34,13,1,299.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(34,35,14,1,399.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(35,36,15,1,349.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(36,37,1,1,1199.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(37,38,2,1,1099.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(38,36,3,1,899.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(39,36,4,1,999.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(40,34,5,1,899.99,0.00,1,'2024-05-29 16:38:28',NULL,NULL,NULL,NULL),(41,41,1,2,1199.99,0.00,1,'2024-07-13 12:19:05',NULL,NULL,NULL,NULL),(42,42,3,1,899.99,0.00,1,'2024-07-13 12:41:28',NULL,NULL,NULL,NULL),(43,42,10,1,349.99,0.00,1,'2024-07-13 12:41:28',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `detallesventa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `IdProducto` int NOT NULL AUTO_INCREMENT,
  `Codigo` text COLLATE utf8mb4_general_ci,
  `Nombre` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Stock` int NOT NULL,
  `Imagen` text COLLATE utf8mb4_general_ci,
  `PrecioVenta` decimal(18,2) NOT NULL,
  `IdCategoria` int NOT NULL,
  `Estado` int NOT NULL,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  PRIMARY KEY (`IdProducto`),
  KEY `IdCategoria` (`IdCategoria`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`IdCategoria`) REFERENCES `categorias` (`IdCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'CEL001','iPhone 13 Pro',96,'1.jpg',1199.99,1,1,1,'2024-05-26 00:00:00',1,'2024-07-10 00:00:00',NULL,NULL),(2,'CEL002','Samsung Galaxy S21 Ultra',41,'2.jpg',1099.99,1,1,2,'2024-05-26 00:00:00',1,'2024-07-10 00:00:00',NULL,NULL),(3,'CEL003','Google Pixel 6 Pro',26,'3.jpg',899.99,1,1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(4,'CEL004','OnePlus 9 Pro',31,'4.jpg',999.99,1,1,4,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(5,'CEL005','Xiaomi Mi 11 Ultra',36,'5.jpg',899.99,1,1,5,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(6,'CEL006','iPhone SE (2022)',56,'6.jpg',499.99,2,1,6,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(7,'CEL007','Samsung Galaxy A52',51,'7.jpg',399.99,2,1,7,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(8,'CEL008','Google Pixel 5a',61,'8.jpg',399.99,2,1,8,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(9,'CEL009','OnePlus Nord 2',66,'9.jpg',399.99,2,1,1,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(10,'CEL010','Xiaomi Redmi Note 11 Pro',71,'10.jpg',349.99,2,1,2,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(11,'CEL011','Samsung Galaxy Tab S7+',21,'11.jpg',849.99,3,1,3,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(12,'CEL012','iPad Pro 2021',16,'12.jpg',999.99,3,1,4,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(13,'CEL013','Samsung Galaxy Watch 4',11,'13.jpg',299.99,4,1,5,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(14,'CEL014','Apple Watch Series 7',6,'14.jpg',399.99,4,1,6,'2024-05-26 00:00:00',NULL,NULL,NULL,NULL),(15,'CEL015','Sony WH-1000XM4',1,'15.jpg',499.99,5,1,7,'2024-05-26 00:00:00',1,'2024-07-10 00:00:00',NULL,NULL);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdUsuario` int NOT NULL AUTO_INCREMENT,
  `NombreUsuario` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `Contrasena` text COLLATE utf8mb4_general_ci,
  `Correo` text COLLATE utf8mb4_general_ci,
  `Imagen` text COLLATE utf8mb4_general_ci,
  `Estado` int DEFAULT NULL,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime NOT NULL,
  `Idcliente` int DEFAULT NULL,
  PRIMARY KEY (`IdUsuario`),
  KEY `fk_clientes2` (`Idcliente`),
  CONSTRAINT `fk_clientes2` FOREIGN KEY (`Idcliente`) REFERENCES `clientes` (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'admin','admin','admin@gmail.com',NULL,1,1,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(2,'cliente','cliente','cliente@gmail.com',NULL,1,1,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',1),(3,'usuario3',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(4,'usuario4',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(5,'usuario5',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(6,'usuario6',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(7,'usuario7',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(8,'usuario8',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(9,'usuario9',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL),(10,'usuario10',NULL,NULL,NULL,NULL,0,'2024-07-13 11:48:47',NULL,NULL,NULL,'2024-07-13 11:48:51',NULL);
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `IdVenta` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int DEFAULT NULL,
  `IdUsuario` int DEFAULT NULL,
  `FechaVenta` datetime DEFAULT NULL,
  `Impuesto` decimal(18,2) DEFAULT NULL,
  `Total` decimal(18,2) DEFAULT NULL,
  `Estado` int DEFAULT NULL,
  `UsuarioCrea` int NOT NULL,
  `FechaCrea` datetime NOT NULL,
  `UsuarioModifica` int DEFAULT NULL,
  `FechaModifica` datetime DEFAULT NULL,
  `UsuarioElimina` int DEFAULT NULL,
  `FechaElimina` datetime DEFAULT NULL,
  PRIMARY KEY (`IdVenta`),
  KEY `IdCliente` (`IdCliente`),
  KEY `IdUsuario` (`IdUsuario`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`IdCliente`) REFERENCES `clientes` (`IdCliente`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (21,1,1,'2023-01-15 10:00:00',10.00,110.00,1,1,'2023-01-15 10:00:00',NULL,NULL,NULL,NULL),(22,2,1,'2023-02-20 12:00:00',15.00,165.00,1,2,'2023-02-20 12:00:00',NULL,NULL,NULL,NULL),(23,3,2,'2023-03-25 14:00:00',12.00,132.00,1,3,'2023-03-25 14:00:00',NULL,NULL,NULL,NULL),(24,4,2,'2023-04-30 16:00:00',18.00,198.00,1,4,'2023-04-30 16:00:00',NULL,NULL,NULL,NULL),(25,5,3,'2023-05-05 18:00:00',20.00,220.00,1,5,'2023-05-05 18:00:00',NULL,NULL,NULL,NULL),(26,6,3,'2023-06-10 20:00:00',25.00,275.00,1,6,'2023-06-10 20:00:00',NULL,NULL,NULL,NULL),(27,7,4,'2023-07-15 09:00:00',22.00,242.00,1,7,'2023-07-15 09:00:00',NULL,NULL,NULL,NULL),(28,8,4,'2023-08-20 11:00:00',30.00,330.00,1,8,'2023-08-20 11:00:00',NULL,NULL,NULL,NULL),(29,9,5,'2023-09-25 13:00:00',28.00,308.00,1,9,'2023-09-25 13:00:00',NULL,NULL,NULL,NULL),(30,10,5,'2023-10-30 15:00:00',35.00,385.00,1,10,'2023-10-30 15:00:00',NULL,NULL,NULL,NULL),(31,1,6,'2023-11-05 17:00:00',32.00,352.00,1,1,'2023-11-05 17:00:00',NULL,NULL,NULL,NULL),(32,2,6,'2023-12-10 19:00:00',40.00,440.00,1,2,'2023-12-10 19:00:00',NULL,NULL,NULL,NULL),(33,3,7,'2024-01-15 08:00:00',45.00,495.00,1,3,'2024-01-15 08:00:00',NULL,NULL,NULL,NULL),(34,4,7,'2024-02-20 10:00:00',42.00,462.00,1,4,'2024-02-20 10:00:00',NULL,NULL,NULL,NULL),(35,5,8,'2024-03-25 12:00:00',50.00,550.00,1,5,'2024-03-25 12:00:00',NULL,NULL,NULL,NULL),(36,6,8,'2024-04-30 14:00:00',48.00,528.00,1,6,'2024-04-30 14:00:00',NULL,NULL,NULL,NULL),(37,7,9,'2024-05-05 16:00:00',55.00,605.00,1,7,'2024-05-05 16:00:00',NULL,NULL,NULL,NULL),(38,8,9,'2024-06-10 18:00:00',52.00,572.00,1,8,'2024-06-10 18:00:00',NULL,NULL,NULL,NULL),(39,9,10,'2024-07-15 20:00:00',60.00,660.00,1,9,'2024-07-15 20:00:00',NULL,NULL,NULL,NULL),(40,10,10,'2024-08-20 09:00:00',58.00,638.00,1,10,'2024-08-20 09:00:00',NULL,NULL,NULL,NULL),(41,1,1,'2024-07-13 12:19:05',216.00,1200.00,1,1,'2024-07-13 12:19:05',NULL,NULL,NULL,NULL),(42,1,1,'2024-07-13 12:41:28',225.00,1250.00,1,1,'2024-07-13 12:41:28',NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'posjava'
--

--
-- Dumping routines for database 'posjava'
--
/*!50003 DROP PROCEDURE IF EXISTS `ActualizarStockDeProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ActualizarStockDeProducto`(IN `productoId` INT, IN `nuevoStock` INT)
BEGIN
    UPDATE productos SET Stock = nuevoStock WHERE IdProducto = productoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ContarClientesPorFechaCrea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ContarClientesPorFechaCrea`(IN `fecha` DATE)
BEGIN
    SELECT COUNT(*) AS NumeroClientes FROM clientes WHERE FechaCrea = fecha;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `DesactivarProducto` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `DesactivarProducto`(IN `productoId` INT)
BEGIN
    UPDATE productos SET Estado = '0' WHERE IdProducto = productoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerCategoriasPorNombreYEstado` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerCategoriasPorNombreYEstado`()
BEGIN
    SELECT Nombre, Estado
    FROM categorias
    WHERE Estado = '1' AND Nombre LIKE '%Gama%';
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerClientesPorRangoFechas` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClientesPorRangoFechas`(IN `p_FechaInicio` DATE, IN `p_FechaFin` DATE)
BEGIN
    SELECT * FROM clientes
    WHERE FechaCrea BETWEEN p_FechaInicio AND p_FechaFin;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerClientesPorUsuarioCrea` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerClientesPorUsuarioCrea`(IN `usuario` INT)
BEGIN
    SELECT Nombre, Correo FROM clientes WHERE UsuarioCrea = usuario;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosPorCategoria` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorCategoria`(IN `categoria` INT)
BEGIN
    SELECT * FROM productos WHERE IdCategoria = categoria;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `ObtenerProductosPorRangoDePrecio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `ObtenerProductosPorRangoDePrecio`(IN `minPrecio` DECIMAL(10,2), IN `maxPrecio` DECIMAL(10,2))
BEGIN
    SELECT * FROM productos WHERE PrecioVenta BETWEEN minPrecio AND maxPrecio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `obtenerProximoIdDisponible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `obtenerProximoIdDisponible`()
BEGIN
    DECLARE maxId INT;

    -- Obtener el máximo ID actualmente en uso
    SELECT MAX(IdCliente) INTO maxId FROM clientes;

    -- Si no hay registros en la tabla, comenzamos desde 1
    IF maxId IS NULL THEN
        SET maxId = 0;
    END IF;

    -- Devolver el próximo ID disponible
    SELECT maxId + 1 AS ProximoId;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spObtenerProximoIdProductoDisponible` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spObtenerProximoIdProductoDisponible`(OUT `proximo_id` INT)
BEGIN
    DECLARE id_disponible INT;
    DECLARE encontrado INT DEFAULT 0;

    DECLARE cur CURSOR FOR
        SELECT IdProducto + 1 AS next_id
        FROM productos p
        WHERE NOT EXISTS (SELECT 1 FROM productos WHERE IdProducto = p.IdProducto + 1)
        ORDER BY IdProducto
        LIMIT 1;

    DECLARE CONTINUE HANDLER FOR NOT FOUND SET encontrado = 1;

    OPEN cur;
    FETCH cur INTO id_disponible;
    IF encontrado THEN
        SELECT IFNULL(MAX(IdProducto), 0) + 1 INTO id_disponible FROM productos;
    END IF;
    CLOSE cur;

    SET proximo_id = id_disponible;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spPCarosxAnio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spPCarosxAnio`(IN `year` INT)
BEGIN
    SELECT p.Nombre AS NombreProducto, p.PrecioVenta AS Precio
    FROM productos p
    WHERE YEAR(p.FechaCrea) = year
    ORDER BY p.PrecioVenta DESC
    LIMIT 10;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spStockPorAnio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spStockPorAnio`(IN `year` INT)
BEGIN
    SELECT p.Nombre AS nombre, SUM(p.Stock) AS stock
    FROM productos p
    WHERE YEAR(p.FechaCrea) = year
    GROUP BY p.Nombre;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `spVentasPorMes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `spVentasPorMes`(IN `an` INT)
BEGIN
    SELECT MONTH(v.FechaVenta) AS mes, SUM(dv.Precio * dv.Cantidad) AS total
    FROM ventas v
    INNER JOIN detallesventa dv ON v.IdVenta = dv.IdVenta
    WHERE YEAR(v.FechaVenta) = an
    GROUP BY MONTH(v.FechaVenta);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FACTURA_VENTA` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FACTURA_VENTA`(in idcliente int,in total numeric(8,1))
begin
	DECLARE last_inserted_id INT;
INSERT INTO ventas (IdCliente, IdUsuario, FechaVenta, Impuesto, Total, Estado, UsuarioCrea, FechaCrea) 
VALUES( idcliente, 1, NOW(), (total*0.18), total, 1, 1, NOW());
SET last_inserted_id = LAST_INSERT_ID();
SELECT last_inserted_id AS IdVenta;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `SP_FACTURA_VENTA_DETALLE` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `SP_FACTURA_VENTA_DETALLE`(idventa int, idproducto int,  cantidad int, precio decimal(18,2))
begin
	INSERT INTO detallesventa
( IdVenta, IdProducto, Cantidad, Precio, Descuento, UsuarioCrea, FechaCrea)
VALUES( idventa, idproducto, cantidad, precio, 0, 1, now());
update productos set Stock= Stock -cantidad where IdProducto =idproducto;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-13 13:00:12
