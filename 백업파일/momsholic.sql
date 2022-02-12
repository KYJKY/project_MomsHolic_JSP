-- MySQL dump 10.13  Distrib 8.0.23, for Win64 (x86_64)
--
-- Host: localhost    Database: momsholic
-- ------------------------------------------------------
-- Server version	8.0.23

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alarmmsg`
--

DROP TABLE IF EXISTS `alarmmsg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alarmmsg` (
  `al_id` int NOT NULL AUTO_INCREMENT,
  `m_id` char(15) NOT NULL,
  `al_title` varchar(50) NOT NULL DEFAULT '',
  `al_msg` varchar(100) NOT NULL,
  `al_read` int NOT NULL DEFAULT '0',
  `al_date` char(20) NOT NULL,
  PRIMARY KEY (`al_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alarmmsg`
--

LOCK TABLES `alarmmsg` WRITE;
/*!40000 ALTER TABLE `alarmmsg` DISABLE KEYS */;
/*!40000 ALTER TABLE `alarmmsg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `columntbl`
--

DROP TABLE IF EXISTS `columntbl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `columntbl` (
  `co_id` int NOT NULL AUTO_INCREMENT,
  `co_img` varchar(100) DEFAULT NULL,
  `co_title` varchar(30) NOT NULL,
  `co_name` varchar(45) NOT NULL,
  `co_content` text NOT NULL,
  `co_date` datetime NOT NULL,
  `co_likes` int DEFAULT '0',
  `co_hits` int DEFAULT '0',
  PRIMARY KEY (`co_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `columntbl`
--

LOCK TABLES `columntbl` WRITE;
/*!40000 ALTER TABLE `columntbl` DISABLE KEYS */;
/*!40000 ALTER TABLE `columntbl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diary` (
  `di_id` int NOT NULL AUTO_INCREMENT,
  `m_id` varchar(20) NOT NULL,
  `m_nickname` varchar(20) NOT NULL,
  `di_title` varchar(50) NOT NULL,
  `di_content` text NOT NULL,
  `di_date` datetime NOT NULL,
  `di_comments` int DEFAULT '0',
  `di_hits` int DEFAULT '0',
  `di_img` varchar(100) NOT NULL,
  PRIMARY KEY (`di_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary`
--

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diarycomment`
--

DROP TABLE IF EXISTS `diarycomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diarycomment` (
  `dc_id` int NOT NULL AUTO_INCREMENT,
  `di_id` int NOT NULL,
  `m_id` char(15) NOT NULL,
  `dc_no` int NOT NULL,
  `dc_nickname` char(10) NOT NULL,
  `dc_content` text NOT NULL,
  `dc_date` char(20) NOT NULL,
  `dc_masterid` int NOT NULL,
  `dc_replyno` int NOT NULL,
  `dc_step` int NOT NULL,
  PRIMARY KEY (`dc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diarycomment`
--

LOCK TABLES `diarycomment` WRITE;
/*!40000 ALTER TABLE `diarycomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `diarycomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diaryimg`
--

DROP TABLE IF EXISTS `diaryimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diaryimg` (
  `di_id` int NOT NULL,
  `di_img1` varchar(100) DEFAULT 'noimg',
  `di_img2` varchar(100) DEFAULT 'noimg',
  `di_img3` varchar(100) DEFAULT 'noimg',
  `di_img4` varchar(100) DEFAULT 'noimg',
  PRIMARY KEY (`di_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diaryimg`
--

LOCK TABLES `diaryimg` WRITE;
/*!40000 ALTER TABLE `diaryimg` DISABLE KEYS */;
/*!40000 ALTER TABLE `diaryimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donate`
--

DROP TABLE IF EXISTS `donate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donate` (
  `do_id` int NOT NULL AUTO_INCREMENT,
  `do_img` varchar(100) NOT NULL,
  `do_title` varchar(30) NOT NULL,
  `do_price` varchar(45) NOT NULL,
  `do_date` varchar(20) NOT NULL,
  PRIMARY KEY (`do_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donate`
--

LOCK TABLES `donate` WRITE;
/*!40000 ALTER TABLE `donate` DISABLE KEYS */;
/*!40000 ALTER TABLE `donate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `donatelotto`
--

DROP TABLE IF EXISTS `donatelotto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `donatelotto` (
  `dl_id` int NOT NULL AUTO_INCREMENT,
  `do_id` int NOT NULL,
  `m_id` varchar(20) NOT NULL,
  PRIMARY KEY (`dl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `donatelotto`
--

LOCK TABLES `donatelotto` WRITE;
/*!40000 ALTER TABLE `donatelotto` DISABLE KEYS */;
/*!40000 ALTER TABLE `donatelotto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likecolumn`
--

DROP TABLE IF EXISTS `likecolumn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likecolumn` (
  `co_id` int NOT NULL,
  `m_id` char(10) NOT NULL,
  `co_title` varchar(50) NOT NULL,
  `co_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likecolumn`
--

LOCK TABLES `likecolumn` WRITE;
/*!40000 ALTER TABLE `likecolumn` DISABLE KEYS */;
/*!40000 ALTER TABLE `likecolumn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `likerecipe`
--

DROP TABLE IF EXISTS `likerecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `likerecipe` (
  `re_id` int NOT NULL,
  `m_id` char(10) NOT NULL,
  `re_title` varchar(50) NOT NULL,
  `re_img` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `likerecipe`
--

LOCK TABLES `likerecipe` WRITE;
/*!40000 ALTER TABLE `likerecipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `likerecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `m_id` char(15) NOT NULL,
  `m_nickname` char(10) NOT NULL,
  `m_pw` char(20) NOT NULL,
  `m_name` char(15) NOT NULL,
  `m_addresscode` int NOT NULL,
  `m_address1` varchar(50) NOT NULL,
  `m_address2` varchar(50) NOT NULL,
  `m_email1` char(15) NOT NULL,
  `m_email2` char(15) NOT NULL,
  `m_phone` char(15) NOT NULL,
  `m_birth` char(10) NOT NULL,
  `m_introduce` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`m_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `msgcontent`
--

DROP TABLE IF EXISTS `msgcontent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `msgcontent` (
  `mc_id` int NOT NULL AUTO_INCREMENT,
  `tp_id` int NOT NULL,
  `mc_sendid` char(15) NOT NULL,
  `mc_receiveid` char(15) NOT NULL,
  `mc_content` varchar(100) NOT NULL,
  `mc_date` datetime NOT NULL,
  `mc_read` int NOT NULL,
  `mc_roomid` int NOT NULL,
  PRIMARY KEY (`mc_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `msgcontent`
--

LOCK TABLES `msgcontent` WRITE;
/*!40000 ALTER TABLE `msgcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `msgcontent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipe` (
  `re_id` int NOT NULL AUTO_INCREMENT,
  `re_title` varchar(30) NOT NULL,
  `re_ctg` varchar(10) NOT NULL,
  `re_content` text NOT NULL,
  `re_meterial` varchar(100) NOT NULL,
  `re_like` int DEFAULT '0',
  `re_img` varchar(100) NOT NULL,
  `re_content1` text,
  `re_content2` text,
  `re_content3` text,
  `re_content4` text,
  `re_content5` text,
  `re_content6` text,
  `re_content7` text,
  `re_content8` text,
  `re_content9` text,
  `re_content10` text,
  PRIMARY KEY (`re_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipestep`
--

DROP TABLE IF EXISTS `recipestep`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recipestep` (
  `re_id` int NOT NULL,
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
/*!40000 ALTER TABLE `recipestep` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradecomment`
--

DROP TABLE IF EXISTS `tradecomment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradecomment` (
  `tc_id` int NOT NULL,
  `tp_id` int NOT NULL,
  `m_id` char(15) NOT NULL,
  `tc_no` int NOT NULL,
  `tc_nickname` char(10) NOT NULL,
  `tc_content` text NOT NULL,
  `tc_date` char(20) NOT NULL,
  `tc_masterid` int NOT NULL,
  `tc_replyno` int NOT NULL DEFAULT '0',
  `tc_step` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`tc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradecomment`
--

LOCK TABLES `tradecomment` WRITE;
/*!40000 ALTER TABLE `tradecomment` DISABLE KEYS */;
/*!40000 ALTER TABLE `tradecomment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradehistory`
--

DROP TABLE IF EXISTS `tradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradehistory` (
  `th_no` int NOT NULL,
  `tp_id` int NOT NULL,
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
  `th_price` int NOT NULL,
  `th_isaccepted` int DEFAULT '0',
  `th_issended` int DEFAULT '0',
  `th_isend` int DEFAULT '0',
  PRIMARY KEY (`th_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradehistory`
--

LOCK TABLES `tradehistory` WRITE;
/*!40000 ALTER TABLE `tradehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `tradehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradeimg`
--

DROP TABLE IF EXISTS `tradeimg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradeimg` (
  `tp_id` int NOT NULL,
  `ti_img1` varchar(100) DEFAULT 'noimg',
  `ti_img2` varchar(100) DEFAULT 'noimg',
  `ti_img3` varchar(100) DEFAULT 'noimg',
  `ti_img4` varchar(100) DEFAULT 'noimg',
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradeimg`
--

LOCK TABLES `tradeimg` WRITE;
/*!40000 ALTER TABLE `tradeimg` DISABLE KEYS */;
INSERT INTO `tradeimg` VALUES (1,NULL,NULL,NULL,'702818010100137994.png'),(2,NULL,NULL,'702817957922734141.png',NULL),(3,NULL,NULL,'702817170823839784.png',NULL),(4,NULL,'702817194547085403.png',NULL,NULL),(5,'647726018093776917.png','647725828842717204.png','647730343092289546.png',NULL),(6,NULL,NULL,'702816762491830272.png',NULL),(7,NULL,'7028179579227341411.png',NULL,'7028167624918302721.png'),(8,'647730360465096704.png','7028180101001379941.png','7028180311638016401.png','7028180311638016402.png'),(9,NULL,NULL,NULL,NULL),(10,NULL,'702817016867848203.png',NULL,NULL);
/*!40000 ALTER TABLE `tradeimg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradepost`
--

DROP TABLE IF EXISTS `tradepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradepost` (
  `tp_id` int NOT NULL,
  `tp_title` varchar(30) NOT NULL,
  `tp_goodsctg` char(10) NOT NULL,
  `tp_goodsimg` varchar(100) NOT NULL,
  `tp_content` text NOT NULL,
  `tp_date` char(20) NOT NULL,
  `m_id` char(15) NOT NULL,
  `tp_nickname` char(10) NOT NULL,
  `tp_hits` int DEFAULT '0',
  `tp_goodsprice` int NOT NULL,
  `tp_goodscondition` char(10) NOT NULL,
  `tp_dealing` char(15) NOT NULL,
  `tp_deliveryfee` char(15) NOT NULL,
  PRIMARY KEY (`tp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradepost`
--

LOCK TABLES `tradepost` WRITE;
/*!40000 ALTER TABLE `tradepost` DISABLE KEYS */;
/*!40000 ALTER TABLE `tradepost` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wish`
--

DROP TABLE IF EXISTS `wish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wish` (
  `tp_id` int NOT NULL,
  `m_id` char(10) NOT NULL,
  `tp_title` varchar(30) NOT NULL,
  `tp_price` int NOT NULL,
  `tp_goodsimg` varchar(100) NOT NULL,
  `tp_date` char(20) NOT NULL,
  `tp_hits` int NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wish`
--

LOCK TABLES `wish` WRITE;
/*!40000 ALTER TABLE `wish` DISABLE KEYS */;
/*!40000 ALTER TABLE `wish` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-24  6:30:37
