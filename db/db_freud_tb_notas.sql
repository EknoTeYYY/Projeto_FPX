-- MySQL dump 10.13  Distrib 8.0.26, for Win64 (x86_64)
--
-- Host: localhost    Database: db_freud
-- ------------------------------------------------------
-- Server version	8.0.26

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
-- Table structure for table `tb_notas`
--

DROP TABLE IF EXISTS `tb_notas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_notas` (
  `id_notas` int NOT NULL AUTO_INCREMENT,
  `id_matricula` int NOT NULL,
  `id_disciplina` int NOT NULL,
  `nota1` float NOT NULL,
  `rec1` float NOT NULL,
  `nota2` float NOT NULL,
  `rec2` float NOT NULL,
  `t1` float NOT NULL,
  `rect1` float NOT NULL,
  PRIMARY KEY (`id_notas`),
  KEY `id_matri_idx` (`id_matricula`),
  KEY `id_disciplina_idx` (`id_disciplina`),
  CONSTRAINT `id_disciplinaaaaaa` FOREIGN KEY (`id_disciplina`) REFERENCES `tb_disciplina` (`id_disciplina`),
  CONSTRAINT `id_matri` FOREIGN KEY (`id_matricula`) REFERENCES `tb_matricula` (`id_matricula`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='							';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_notas`
--

LOCK TABLES `tb_notas` WRITE;
/*!40000 ALTER TABLE `tb_notas` DISABLE KEYS */;
INSERT INTO `tb_notas` VALUES (1,18,1,10,0,10,0,10,0),(2,18,1,10,10,10,10,10,10),(3,18,1,10,10,10,10,10,10),(4,18,1,8.6,7.7,7.5,7.7,5.5,7.7),(5,18,1,10,10,10,10,10,10),(6,18,1,10,10,10,10,10,10),(7,18,1,10,10,10,10,10,10),(8,18,1,10,10,10,10,10,10),(9,18,1,10,10,10,10,10,10),(10,18,1,10,10,10,10,10,10),(11,18,1,10,10,10,10,10,10),(12,18,1,10,10,10,10,10,10),(13,18,1,10,10,10,10,10,10),(14,18,1,10,10,10,10,10,10),(15,18,1,10,10,10,10,10,10),(16,18,1,10,10,10,10,10,10),(17,18,1,10,10,10,10,10,10),(18,18,1,10,10,10,10,10,10),(19,18,1,10,10,10,10,10,10),(20,18,1,10,10,10,10,10,10),(21,18,1,10,10,10,10,10,10),(22,18,1,10,10,10,10,10,10),(23,18,1,10,0,10,0,10,0),(24,18,1,10,0,10,0,10,0),(25,83,1,5,7,8,0,10,0),(26,83,2,5,5,6,5,7,0),(27,83,3,8,0,5,7,4,6),(28,83,4,7,0,7,0,7,0),(29,83,5,8,0,8,0,8,0),(30,83,6,7,0,5,0,5,0),(31,89,1,8,0,7,0,7,0),(32,89,2,7,0,7,0,7,0),(33,89,3,8,0,8,0,8,0),(34,89,4,7,0,7,0,7,0),(35,89,5,7,0,7,0,7,0);
/*!40000 ALTER TABLE `tb_notas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 19:31:48
