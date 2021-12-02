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
-- Table structure for table `tb_matricula`
--

DROP TABLE IF EXISTS `tb_matricula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tb_matricula` (
  `id_matricula` int NOT NULL AUTO_INCREMENT,
  `id_nivel` int NOT NULL,
  `nome` varchar(45) NOT NULL,
  `cpf` varchar(45) NOT NULL,
  `nascimento` varchar(45) NOT NULL,
  `endereco` varchar(45) NOT NULL,
  `nome_mae` varchar(45) NOT NULL,
  `nome_pai` varchar(45) NOT NULL,
  `id_disciplina` int DEFAULT NULL,
  PRIMARY KEY (`id_matricula`),
  KEY `id_nivel_idx` (`id_nivel`),
  KEY `id_disciplina_idx` (`id_disciplina`),
  CONSTRAINT `id_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `tb_nivel` (`id_nivel`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_matricula`
--

LOCK TABLES `tb_matricula` WRITE;
/*!40000 ALTER TABLE `tb_matricula` DISABLE KEYS */;
INSERT INTO `tb_matricula` VALUES (16,1,'Boss','000.000.000-00','0000-00-00','Rua Nao Sei','Maria','Mario',NULL),(18,3,'Nicolas Beck','555.666.999-00','70-80-0000','Nao sei','Maria ','Mario',NULL),(19,2,'Daniela','000.000.000-00','00-00-0000','Nao Sei','Maria ','Mario',NULL),(20,3,'Maria Jose','000.000.000-10','00-00-0000','Nao sei','Maria','Mario',NULL),(21,3,'gui','000.000.000-00','00-00-0000','asd','asd','asd',NULL),(23,3,'asd','000.000.000-00','00-00-0000','asdasd','asd','asd',NULL),(24,3,'asd','000.000.000-00','00-00-0000','asd','asd','asd',NULL),(25,3,'sad','000.000.000-00','00-00-0000','asd','asd','asd',NULL),(26,3,'asd','000.000.000-00','00-00-0000','asdas','asdasd','asdsas',NULL),(27,3,'asdsad','000.000.000-00','00-00-0000','asdsa','asdasd','asdas',NULL),(28,3,'sad','000.000.000-00','00-00-000','saa','saas','asasa',NULL),(29,3,'asdasd','000.000.000-01','00-00-0000','asd','sad','sad',NULL),(30,3,'asd','00','00-00-0000','asd','asd','asd',NULL),(31,3,'das','111.111.111-10','00-00-0000','sad','sad','sad',NULL),(32,3,'Guilherme','123.456.789-00','18-09-1999','Nao sei','Maria','Mario',NULL),(33,3,'dsfds','dsfdsfsdf','','','','',NULL),(34,2,'Pedro','000.000.000-57','0000-00-00','Rua Nao Sei','Maria','Mario',1),(35,2,'Pedrou','000.222.333-56','0000-00-00','ffodade','maria','maria',NULL),(36,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(37,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(38,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(39,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(40,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(41,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(42,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(43,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(44,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(45,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(46,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(47,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(48,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(49,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(50,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(51,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(52,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(53,2,'saddd','111.555.888-69','0000-00-00','sad','asd','sad',1),(54,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(55,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(56,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(57,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(58,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(59,2,'saddd','000.555.444-52','0000-00-00','sad','asd','sad',1),(60,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(61,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(62,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(63,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(64,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(65,2,'saddd','000.555.444-52','00-00-0000','sad','asd','sad',1),(66,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(67,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(68,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(69,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(70,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(71,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(72,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(73,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(74,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(75,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(76,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(77,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(78,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(79,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(80,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(81,2,'Pedon','777.777.777-77','12-15-2015','nao sei','maria','maria',1),(82,2,'Pedri','777.777.777-77','18-58-5456','sad','asd','sad',1),(83,3,'Guilherme Oribka Serafim','097.186.599-00','18-09-1999','Rua NA','Jo','Rafa',0),(84,2,'Joao Mendes','123.132.198-20','18-09-1980','Rua NA','Maria','Mario',2),(85,2,'Maria Antonia','456.654.987-89','20-12-1985','Rua NA','Maria','Mario',3),(86,2,'Ana Martins','123.456.789-23','12-09-1975','Rua NA','Maria','Mario',4),(87,2,'Daniela Silva','456.987.123-15','18-04-1985','Rua NA','Maria ','Mario',5),(88,2,'Antonio','789.456.123-89','12-12-1980','Rua NA','Maria','Mario',6),(89,3,'Jaime','123.456.752-20','12-12-2012','Rua NA','Maria','Mario',0);
/*!40000 ALTER TABLE `tb_matricula` ENABLE KEYS */;
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
