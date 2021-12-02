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
-- Table structure for table `tb_login`
--

DROP TABLE IF EXISTS `tb_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_login` (
  `id_matricula` int NOT NULL,
  `email_login` varchar(45) NOT NULL,
  `senha_login` varchar(45) NOT NULL,
  KEY `id_matricula_idx` (`id_matricula`),
  CONSTRAINT `id_matricula` FOREIGN KEY (`id_matricula`) REFERENCES `tb_matricula` (`id_matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_login`
--

LOCK TABLES `tb_login` WRITE;
/*!40000 ALTER TABLE `tb_login` DISABLE KEYS */;
INSERT INTO `tb_login` VALUES (16,'boss@adm.com','123'),(18,'nicolasbeck@freud.com','niconi'),(19,'daniela@freud.com','daniela123@'),(20,'mariajose@freud.com','mariajose123@'),(21,'gui@freud.com','gui123@'),(25,'sad@freud.com','sad123@'),(27,'asdsad@freud.com','asdsad123@'),(25,'sad@freud.com','sad123@'),(29,'asdasd@freud.com','asdasd123@'),(31,'das@freud.com','das123@'),(32,'guilherme@freud.com','gui123'),(33,'dsfds@freud.com','dsfds123@'),(35,'pedrou@freud.com','pedrou123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(36,'saddd@freud.com','saddd123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(66,'pedon@freud.com','pedon123@'),(82,'pedri@freud.com','pedri123@'),(83,'guilhermeoribkaserafim@freud.com','gui123'),(84,'joaomendes@freud.com','joaomendes123@'),(85,'mariaantonia@freud.com','mariaantonia123@'),(86,'anamartins@freud.com','anamartins123@'),(87,'danielasilva@freud.com','danielasilva123@'),(88,'antonio@freud.com','antonio123@'),(89,'jaime@freud.com','jaime123@');
/*!40000 ALTER TABLE `tb_login` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-29 19:31:49
