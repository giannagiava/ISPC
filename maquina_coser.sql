-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: maquina_coser_db
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fabricante` (
  `id_fabricante` int NOT NULL AUTO_INCREMENT,
  `nombre_fabricante` varchar(100) NOT NULL,
  `pais_origen` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_fabricante`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'Singer','Estados Unidos');
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `maquina`
--

DROP TABLE IF EXISTS `maquina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `maquina` (
  `id_maquina` int NOT NULL AUTO_INCREMENT,
  `numero_serie` varchar(50) NOT NULL,
  `id_modelo` int DEFAULT NULL,
  `marca` varchar(100) NOT NULL,
  `color` varchar(50) DEFAULT NULL,
  `fecha_fabricacion` date DEFAULT NULL,
  `velocidad_maxima` int DEFAULT NULL,
  `numero_hilos` int DEFAULT NULL,
  `tipo_alimentacion` enum('Eléctrica','Manual','Batería') NOT NULL,
  `potencia` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`id_maquina`),
  UNIQUE KEY `numero_serie` (`numero_serie`),
  KEY `id_modelo` (`id_modelo`),
  CONSTRAINT `maquina_ibfk_1` FOREIGN KEY (`id_modelo`) REFERENCES `modelo` (`id_modelo`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `maquina`
--

LOCK TABLES `maquina` WRITE;
/*!40000 ALTER TABLE `maquina` DISABLE KEYS */;
INSERT INTO `maquina` VALUES (1,'SN123456789',1,'Singer','Blanco','2022-04-10',850,1,'Eléctrica',90.50),(2,'SN987654321',2,'Singer','Gris','2023-01-10',1100,1,'Eléctrica',105.00),(3,'SN112233445',3,'Singer','Negro','2022-10-20',850,1,'Eléctrica',95.00);
/*!40000 ALTER TABLE `maquina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `modelo`
--

DROP TABLE IF EXISTS `modelo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `modelo` (
  `id_modelo` int NOT NULL AUTO_INCREMENT,
  `nombre_modelo` varchar(100) NOT NULL,
  `id_fabricante` int DEFAULT NULL,
  `tipo_maquina` enum('Mecánica','Electrónica','Computarizada') NOT NULL,
  `capacidad_puntadas` int DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id_modelo`),
  KEY `id_fabricante` (`id_fabricante`),
  CONSTRAINT `modelo_ibfk_1` FOREIGN KEY (`id_fabricante`) REFERENCES `fabricante` (`id_fabricante`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `modelo`
--

LOCK TABLES `modelo` WRITE;
/*!40000 ALTER TABLE `modelo` DISABLE KEYS */;
INSERT INTO `modelo` VALUES (1,'Singer Tradition 2250',1,'Mecánica',30,120.99),(2,'Singer Heavy Duty 4411',1,'Mecánica',11,160.00),(3,'Singer Start 1304',1,'Mecánica',6,89.99),(4,'Singer Start 1304',1,'Mecánica',6,1000000.00),(5,'Singer Heavy Duty 4411',1,'Mecánica',11,400000.00),(6,'Singer Tradition 2250',1,'Mecánica',30,300000.00);
/*!40000 ALTER TABLE `modelo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntada`
--

DROP TABLE IF EXISTS `puntada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntada` (
  `id_puntada` int NOT NULL AUTO_INCREMENT,
  `nombre_puntada` varchar(50) NOT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_puntada`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntada`
--

LOCK TABLES `puntada` WRITE;
/*!40000 ALTER TABLE `puntada` DISABLE KEYS */;
INSERT INTO `puntada` VALUES (1,'Puntada Recta','Puntada básica utilizada para coser líneas rectas.'),(2,'Puntada en Zigzag','Puntada utilizada para unir telas elásticas o hacer acabados decorativos.');
/*!40000 ALTER TABLE `puntada` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-08 22:59:28
