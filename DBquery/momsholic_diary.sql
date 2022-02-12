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
-- Table structure for table `diary`
--

DROP TABLE IF EXISTS `diary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `diary` (
  `di_id` int(11) NOT NULL AUTO_INCREMENT,
  `m_id` varchar(20) NOT NULL,
  `m_nickname` varchar(20) NOT NULL,
  `di_title` varchar(50) NOT NULL,
  `di_content` text NOT NULL,
  `di_date` datetime NOT NULL,
  `di_comments` int(11) DEFAULT '0',
  `di_hits` int(11) DEFAULT '0',
  `di_img` varchar(100) NOT NULL,
  PRIMARY KEY (`di_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diary`
--

LOCK TABLES `diary` WRITE;
/*!40000 ALTER TABLE `diary` DISABLE KEYS */;
INSERT INTO `diary` VALUES (1,'test1','홀릭홀릭','푸른하늘','오늘&nbsp;날씨가&nbsp;좋아서&nbsp;가족들이랑&nbsp;산책다녀왔어요~!!','2021-05-24 10:28:30',0,2,'upload/diary31.jpg'),(2,'test1','홀릭홀릭','스케치북이랑 크레파스 사다줬어요','잘그리죠?','2021-05-24 10:29:18',0,0,'upload/diary4.jpg'),(3,'test1','홀릭홀릭','아이가 아파서 응급실 다녀왔어요','입원하고&nbsp;힘들었는데&nbsp;그래도&nbsp;고비를&nbsp;넘겨서&nbsp;다행이네요&nbsp;ㅠ','2021-05-24 10:29:51',0,11,'upload/ex12.png'),(4,'test1','홀릭홀릭','가족들과 캠핑!!!!','날씨&nbsp;좋은&nbsp;주말에&nbsp;캠핑다녀왔지요!!\r<br>아이들이&nbsp;참&nbsp;좋아했어요~~','2021-05-24 10:30:21',0,0,'upload/ex5.png'),(5,'test1','홀릭홀릭','커피 한잔의 여유','커피&nbsp;한잔의&nbsp;여유를&nbsp;느껴보아요','2021-05-24 10:30:48',0,0,'upload/ex7.png'),(6,'test1','홀릭홀릭','독서합시다','책은&nbsp;마음의&nbsp;양식','2021-05-24 10:31:18',0,1,'upload/ex16.png'),(7,'test1','홀릭홀릭','오랜만에 집 앞 카페!','카페&nbsp;다녀왔어요!!','2021-05-24 10:31:35',0,2,'upload/ex9.png'),(8,'test1','홀릭홀릭','오랜만에 맛집 탐방!','여러분&nbsp;오늘&nbsp;어떤거&nbsp;드셨나요?','2021-05-24 10:31:59',0,2,'upload/ex14.png');
/*!40000 ALTER TABLE `diary` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:26:09
