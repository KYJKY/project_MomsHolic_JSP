-- MySQL dump 10.13  Distrib 8.0.11, for Win64 (x86_64)
--
-- Host: localhost    Database: momsholic
-- ------------------------------------------------------
-- Server version	8.0.11

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
-- Table structure for table `recipestep`
--

DROP TABLE IF EXISTS `recipestep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipestep` (
  `re_id` int(11) NOT NULL,
  `rs_img1` varchar(100) DEFAULT 'noimg',
  `rs_img2` varchar(100) DEFAULT 'noimg',
  `rs_img3` varchar(100) DEFAULT 'noimg',
  `rs_img4` varchar(100) DEFAULT 'noimg',
  `rs_img5` varchar(100) DEFAULT 'noimg',
  `rs_img6` varchar(100) DEFAULT 'noimg',
  `rs_img7` varchar(100) DEFAULT 'noimg',
  `rs_img8` varchar(100) DEFAULT 'noimg',
  `rs_img9` varchar(100) DEFAULT 'noimg',
  `rs_img10` varchar(100) DEFAULT 'noimg',
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipestep`
--

LOCK TABLES `recipestep` WRITE;
/*!40000 ALTER TABLE `recipestep` DISABLE KEYS */;
INSERT INTO `recipestep` VALUES (1,NULL,'2.PNG','3.PNG','4.PNG','5.PNG','6.PNG','7.PNG','8.PNG','9.PNG',NULL),(2,NULL,'1.PNG','21.PNG','31.PNG','41.PNG','51.PNG',NULL,NULL,NULL,NULL),(3,NULL,'11.PNG','22.PNG','32.PNG','42.PNG','52.PNG',NULL,NULL,NULL,NULL),(4,NULL,'12.PNG','33.PNG','43.PNG','61.PNG',NULL,NULL,NULL,NULL,NULL),(5,NULL,'13.PNG','23.PNG','34.PNG','44.PNG','45.PNG','53.PNG',NULL,NULL,NULL);
/*!40000 ALTER TABLE `recipestep` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:26:08
