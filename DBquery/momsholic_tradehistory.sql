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
-- Table structure for table `tradehistory`
--

DROP TABLE IF EXISTS `tradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tradehistory` (
  `th_no` int(11) NOT NULL,
  `tp_id` int(11) NOT NULL,
  `th_sellerid` char(15) NOT NULL,
  `th_buyerid` char(15) NOT NULL,
  `th_deliverynum` varchar(50) DEFAULT '',
  `th_sellerbank` varchar(10) DEFAULT '',
  `th_sellerbanknum` varchar(20) DEFAULT '',
  `th_date` char(30) NOT NULL,
  `th_buyername` varchar(10) DEFAULT '',
  `th_buyertel` varchar(11) DEFAULT '0',
  `th_addresscode` varchar(6) DEFAULT '0',
  `th_address1` varchar(30) DEFAULT '',
  `th_address2` varchar(30) DEFAULT '',
  `th_title` varchar(30) NOT NULL,
  `th_price` int(11) NOT NULL,
  `th_isaccepted` int(11) DEFAULT '0',
  `th_issended` int(11) DEFAULT '0',
  `th_isend` int(11) DEFAULT '0',
  PRIMARY KEY (`th_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradehistory`
--

LOCK TABLES `tradehistory` WRITE;
/*!40000 ALTER TABLE `tradehistory` DISABLE KEYS */;
INSERT INTO `tradehistory` VALUES (1,13,'test1','test2','dasd','saasdas','13132213','2021-05-24 09:50:44','','','','','','아이 옷 세트 팔아요',5150,1,1,0);
/*!40000 ALTER TABLE `tradehistory` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:26:15
