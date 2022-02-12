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
-- Table structure for table `tradepost`
--

DROP TABLE IF EXISTS `tradepost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `tradepost` (
  `tp_id` int(11) NOT NULL,
  `tp_title` varchar(30) NOT NULL,
  `tp_goodsctg` char(10) NOT NULL,
  `tp_goodsimg` varchar(100) NOT NULL,
  `tp_content` text NOT NULL,
  `tp_date` char(20) NOT NULL,
  `m_id` char(15) NOT NULL,
  `tp_nickname` char(10) NOT NULL,
  `tp_hits` int(11) DEFAULT '0',
  `tp_goodsprice` int(11) NOT NULL,
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
INSERT INTO `tradepost` VALUES (1,'why책 날씨~','book','upload/111.jpg','why책&nbsp;날씨&nbsp;한권&nbsp;팔아요','2021-05-24 09:19:37','test1','홀릭홀릭',0,4000,'used','deliveryDealing','FeeInclusion'),(2,'why 시리즈 전권 판매!!!!','book','upload/22.jpg','직거래합니다&nbsp;서울&nbsp;환영','2021-05-24 09:20:09','test1','홀릭홀릭',0,50000,'almost','directDealing','FeeInclusion'),(3,'동화책 5권 팔아요!!','book','upload/43.jpg','택배거래합니다.\r<br>*착불*입니다.&nbsp;흥정불가','2021-05-24 09:20:42','test1','홀릭홀릭',0,12000,'almost','deliveryDealing','collectible'),(4,'핑크색 갓난아이 신발 팔아요!','shoes','upload/112.jpg','핑크색&nbsp;여자아이&nbsp;신발&nbsp;팔아요!!','2021-05-24 09:21:23','test1','홀릭홀릭',4,3000,'new','deliveryDealing','FeeInclusion'),(5,'아이 강아지 슬리퍼 팔아요!','shoes','upload/23.jpg','직거래&nbsp;가능&nbsp;~&nbsp;맘스톡&nbsp;주세요!@!#@#','2021-05-24 09:22:09','test1','홀릭홀릭',2,2000,'almost','deliveryDealing','FeeInclusion'),(6,'여자아이 구두 팔아요!!','shoes','upload/113.jpg','사용감&nbsp;조금&nbsp;있지만&nbsp;괜찮습니다.','2021-05-24 09:22:37','test1','홀릭홀릭',0,3400,'almost','deliveryDealing','FeeInclusion'),(7,'귀여운 곰탱이 인형 두개 팔아요','toy','upload/114.jpg','귀여운&nbsp;곰탱이&nbsp;두마리&nbsp;데려가여','2021-05-24 09:41:16','test1','홀릭홀릭',1,8000,'almost','deliveryDealing','FeeInclusion'),(8,'건담 미니어쳐','toy','upload/72.jpg','건담&nbsp;미니어쳐&nbsp;팔아요&nbsp;쌉니다','2021-05-24 09:41:52','test1','홀릭홀릭',0,1000,'new','deliveryDealing','FeeInclusion'),(9,'예쁜 공주인형 팔아요','toy','upload/92.jpg','공주인형&nbsp;팝니다&nbsp;두개&nbsp;합쳐서&nbsp;5천원이에요','2021-05-24 09:47:54','test1','홀릭홀릭',0,5000,'almost','deliveryDealing','FeeInclusion'),(10,'남자아이 한복 팔아요','clothes','upload/73.jpg','평택&nbsp;직거래합니다&nbsp;맘스톡으로&nbsp;상의해요','2021-05-24 09:48:38','test1','홀릭홀릭',1,10000,'almost','directDealing','FeeInclusion'),(11,'갓난애기 옷 세트','clothes','upload/162.jpg','세트로&nbsp;입으면&nbsp;정말&nbsp;이쁜&nbsp;갓난아기&nbsp;옷이에요!!','2021-05-24 09:49:14','test1','홀릭홀릭',1,5000,'new','deliveryDealing','FeeInclusion'),(12,'아이 내복 팔아요','clothes','upload/147.jpg','아이&nbsp;내복&nbsp;팔아요&nbsp;3벌&nbsp;한꺼번에&nbsp;팝니다&nbsp;싼거에요&nbsp;정말&nbsp;흥정X','2021-05-24 09:49:51','test1','홀릭홀릭',2,4000,'almost','deliveryDealing','FeeInclusion'),(13,'아이 옷 세트 팔아요','clothes','upload/132.jpg','여아한테&nbsp;어울리는&nbsp;옷&nbsp;팝니다&nbsp;직거래&nbsp;경기&nbsp;환영','2021-05-24 09:50:44','test1','홀릭홀릭',6,5000,'new','directDealing','FeeInclusion');
/*!40000 ALTER TABLE `tradepost` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:26:16
