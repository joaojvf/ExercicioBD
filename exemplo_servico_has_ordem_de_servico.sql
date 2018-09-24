-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: exemplo
-- ------------------------------------------------------
-- Server version	5.7.18-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `servico_has_ordem_de_servico`
--

DROP TABLE IF EXISTS `servico_has_ordem_de_servico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `servico_has_ordem_de_servico` (
  `id_os_servico` int(11) NOT NULL AUTO_INCREMENT,
  `servico_id_servico` int(11) NOT NULL,
  `ordem_de_servico_numero` int(11) NOT NULL,
  `quantidade` int(11) DEFAULT NULL,
  `valor` double DEFAULT NULL,
  `prazo` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_os_servico`,`servico_id_servico`,`ordem_de_servico_numero`),
  KEY `fk_servico_has_ordem_de_servico_ordem_de_servico1_idx` (`ordem_de_servico_numero`),
  KEY `fk_servico_has_ordem_de_servico_servico1_idx` (`servico_id_servico`),
  CONSTRAINT `fk_servico_has_ordem_de_servico_ordem_de_servico1` FOREIGN KEY (`ordem_de_servico_numero`) REFERENCES `ordem_de_servico` (`numero`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_servico_has_ordem_de_servico_servico1` FOREIGN KEY (`servico_id_servico`) REFERENCES `servico` (`cod_servico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `servico_has_ordem_de_servico`
--

LOCK TABLES `servico_has_ordem_de_servico` WRITE;
/*!40000 ALTER TABLE `servico_has_ordem_de_servico` DISABLE KEYS */;
/*!40000 ALTER TABLE `servico_has_ordem_de_servico` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-09-24  9:09:04
