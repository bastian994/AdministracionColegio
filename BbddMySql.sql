-- MySQL dump 10.13  Distrib 8.0.16, for Win64 (x86_64)
--
-- Host: localhost    Database: administracion
-- ------------------------------------------------------
-- Server version	8.0.16

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alumno`
--

DROP TABLE IF EXISTS `alumno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `alumno` (
  `id_alumno` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `fk_colegio_alumno` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_alumno`),
  KEY `fk_colegio_alumno_idx` (`fk_colegio_alumno`),
  CONSTRAINT `fk_colegio_alumno` FOREIGN KEY (`fk_colegio_alumno`) REFERENCES `colegio` (`id_colegio`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alumno`
--

LOCK TABLES `alumno` WRITE;
/*!40000 ALTER TABLE `alumno` DISABLE KEYS */;
INSERT INTO `alumno` VALUES (1,'Rodrigo Muñoz',1),(2,'Diego Gonzales',2),(3,'Juan Pino',1);
/*!40000 ALTER TABLE `alumno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asignatura`
--

DROP TABLE IF EXISTS `asignatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `asignatura` (
  `id_asignatura` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignatura`
--

LOCK TABLES `asignatura` WRITE;
/*!40000 ALTER TABLE `asignatura` DISABLE KEYS */;
INSERT INTO `asignatura` VALUES (1,'Lenguaje'),(2,'Historia'),(3,'Matematicas'),(4,'Ciencias');
/*!40000 ALTER TABLE `asignatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colegio`
--

DROP TABLE IF EXISTS `colegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `colegio` (
  `id_colegio` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_colegio`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colegio`
--

LOCK TABLES `colegio` WRITE;
/*!40000 ALTER TABLE `colegio` DISABLE KEYS */;
INSERT INTO `colegio` VALUES (1,'LICEO COMERCIAL MIRAMAR','MACUL 1212'),(2,'LICEO INSTITUTO NACIONAL','AV LIBERTADOR B. OHIGGINS 1212');
/*!40000 ALTER TABLE `colegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nota`
--

DROP TABLE IF EXISTS `nota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nota` (
  `id_nota` int(11) NOT NULL AUTO_INCREMENT,
  `fk_alumno_nota` int(11) NOT NULL,
  `fk_asignatura_nota` int(11) DEFAULT NULL,
  `nota` float NOT NULL,
  PRIMARY KEY (`id_nota`),
  KEY `fk_alumno_nota_idx` (`fk_alumno_nota`),
  KEY `fk_asignatura_nota_idx` (`fk_asignatura_nota`),
  CONSTRAINT `fk_alumno_nota` FOREIGN KEY (`fk_alumno_nota`) REFERENCES `alumno` (`id_alumno`),
  CONSTRAINT `fk_asignatura_nota` FOREIGN KEY (`fk_asignatura_nota`) REFERENCES `asignatura` (`id_asignatura`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nota`
--

LOCK TABLES `nota` WRITE;
/*!40000 ALTER TABLE `nota` DISABLE KEYS */;
INSERT INTO `nota` VALUES (1,1,1,5.5),(2,2,1,4.5),(3,3,1,6.5),(4,1,2,2.5),(5,2,2,6.5),(6,3,2,4.5),(7,2,1,1.4);
/*!40000 ALTER TABLE `nota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profesor`
--

DROP TABLE IF EXISTS `profesor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `profesor` (
  `id_profesor` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `fk_asignatura_profesor` int(11) DEFAULT NULL,
  `fk_colegio_profesor` int(11) DEFAULT NULL,
  `activo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id_profesor`),
  KEY `fk_asignatura_profesor_idx` (`fk_asignatura_profesor`),
  KEY `fk_colegio_profesor_idx` (`fk_colegio_profesor`),
  CONSTRAINT `fk_asignatura_profesor` FOREIGN KEY (`fk_asignatura_profesor`) REFERENCES `asignatura` (`id_asignatura`),
  CONSTRAINT `fk_colegio_profesor` FOREIGN KEY (`fk_colegio_profesor`) REFERENCES `colegio` (`id_colegio`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profesor`
--

LOCK TABLES `profesor` WRITE;
/*!40000 ALTER TABLE `profesor` DISABLE KEYS */;
INSERT INTO `profesor` VALUES (1,'Bastian Muñoz','1994-03-08',1,1,1),(2,'Juan Perez','1995-04-16',2,1,1),(3,'Francisco Chavez','1982-04-25',3,2,1),(4,'Francisco Perez','1972-07-16',3,1,1),(5,'Juan Chavez','1995-04-16',4,1,0);
/*!40000 ALTER TABLE `profesor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-06-04 21:49:53
