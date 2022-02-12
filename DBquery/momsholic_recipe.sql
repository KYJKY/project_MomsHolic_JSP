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
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipe` (
  `re_id` int(11) NOT NULL AUTO_INCREMENT,
  `re_title` varchar(30) NOT NULL,
  `re_ctg` varchar(10) NOT NULL,
  `re_content` text NOT NULL,
  `re_meterial` varchar(100) NOT NULL,
  `re_like` int(11) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'소고기버섯리조또 만들기','late','후기&nbsp;이유식으로&nbsp;소개해드릴&nbsp;레시피는&nbsp;소고기버섯리조또에요','치즈 1/2, 분유 약간, 물, 소고기, 송이버섯, 양파',0,'upload/2.PNG','쇠고기,&nbsp;버섯,&nbsp;양파는&nbsp;잘게&nbsp;다져주세요','후라이팬을&nbsp;올리고&nbsp;다진&nbsp;재료를&nbsp;볶아줄건데요\r<br>볶을때는&nbsp;기름대신&nbsp;물을&nbsp;사용해서&nbsp;조리듯&nbsp;볶아주시면&nbsp;되요\r<br>마체프&nbsp;후라이팬은&nbsp;316스텐으로&nbsp;안전하게&nbsp;사용하실&nbsp;수&nbsp;있지만\r<br>그렇지&nbsp;않다면&nbsp;이유식&nbsp;냄비에&nbsp;물을&nbsp;넣고&nbsp;볶으셔도&nbsp;된답니다\r<br>기름&nbsp;대신&nbsp;물을&nbsp;넣고&nbsp;볶는다는&nbsp;점!&nbsp;알아두시구요&nbsp;^^','버섯과&nbsp;양파를&nbsp;먼저&nbsp;넣고\r<br>양파가&nbsp;투명해질때까지&nbsp;볶다가','소고기를&nbsp;넣어서&nbsp;같이&nbsp;볶아주세요\r<br>예열만&nbsp;잘되있다면&nbsp;전혀&nbsp;눌러붙지&nbsp;않고\r<br>깔끔하게&nbsp;요리하실&nbsp;수&nbsp;있지요','재료가&nbsp;익으면&nbsp;밥을&nbsp;넣고&nbsp;볶다가','분유물을&nbsp;넣어주는데요\r<br>원래&nbsp;리조또를&nbsp;만들때&nbsp;우유를&nbsp;넣는데\r<br>후기&nbsp;이유식을&nbsp;시작하고,&nbsp;아직&nbsp;생우유&nbsp;먹는걸&nbsp;시작하지&nbsp;않은&nbsp;아이들에게는\r<br>분유를&nbsp;물에&nbsp;타서&nbsp;우유&nbsp;대신&nbsp;넣어주면\r<br>영양도&nbsp;챙기고,&nbsp;맛도&nbsp;좋아진답니다','끓어&nbsp;오르면&nbsp;약한&nbsp;불로&nbsp;줄여&nbsp;저어가면서\r<br>밥이&nbsp;퍼질&nbsp;때까지&nbsp;끓여주시구요\r<br>마지막에&nbsp;치즈를&nbsp;넣고&nbsp;치즈가&nbsp;녹도록&nbsp;저어주시면&nbsp;끝!','아이들이&nbsp;다양한&nbsp;식감을&nbsp;느낄&nbsp;수&nbsp;있도록\r<br>여러&nbsp;음식을&nbsp;만들어&nbsp;주시는&nbsp;것이\r<br>또&nbsp;엄마의&nbsp;역할일&nbsp;아닐까&nbsp;해요\r<br>죽&nbsp;형태의&nbsp;이유식에서&nbsp;벗어나&nbsp;이런&nbsp;색다른&nbsp;이유식도&nbsp;도전해&nbsp;보세요&nbsp;^^','',''),(2,'[완료기이유식] 치즈볼주먹밥','finish','치즈는&nbsp;아이의&nbsp;키성장에&nbsp;좋은&nbsp;칼슘을&nbsp;다량&nbsp;함유하고&nbsp;있으며&nbsp;치즈에서&nbsp;부족한&nbsp;영양소들은&nbsp;감자,&nbsp;호박,&nbsp;당근,&nbsp;버섯&nbsp;등을&nbsp;통해&nbsp;골고루&nbsp;섭취하면서&nbsp;하나씩&nbsp;아이가&nbsp;스스로&nbsp;집어&nbsp;먹을&nbsp;수&nbsp;있는&nbsp;한&nbsp;끼&nbsp;식사.','밥 치즈 당근 버섯 호박 ',0,'upload/1.PNG','밥은&nbsp;갓지은&nbsp;밥으로&nbsp;준비하고&nbsp;감자는&nbsp;작은거&nbsp;하나로&nbsp;준비해서&nbsp;미리&nbsp;삶아줍니다.\r<br>버섯은&nbsp;윗부분만&nbsp;1/2개정도&nbsp;사용했구요..\r<br>나머지&nbsp;야채들은&nbsp;그때그때&nbsp;집에&nbsp;있는거&nbsp;활용하심&nbsp;좋을거같아요~','감자는&nbsp;삶아서&nbsp;뜨거울때&nbsp;포크를&nbsp;이용해서&nbsp;으깨줍니다.','유아용치즈는&nbsp;사진에서처럼&nbsp;적당한&nbsp;크기로&nbsp;비닐을&nbsp;씌운상태에서&nbsp;칼등을&nbsp;이용해서&nbsp;나눠줍니다.','버섯,&nbsp;호박,&nbsp;당근은&nbsp;잘게&nbsp;다져주고&nbsp;잘라놓은&nbsp;유아용치즈는&nbsp;1/3크기로&nbsp;접어서&nbsp;준비합니다.\r<br>이때&nbsp;호박은&nbsp;돌려깎기방식으로해서&nbsp;겉의&nbsp;단단한&nbsp;부분까지만&nbsp;다져주었어요.\r<br>볶아줄거라&nbsp;아무래도&nbsp;무른&nbsp;부분까지&nbsp;다지면&nbsp;물이&nbsp;생길거같아서&nbsp;단단한&nbsp;부분만&nbsp;사용했어요~','포도씨유를&nbsp;살짝&nbsp;두른팬에&nbsp;단단한&nbsp;야채인&nbsp;당근과&nbsp;호박을&nbsp;먼저&nbsp;달달&nbsp;볶아주다가&nbsp;당근과&nbsp;호박이&nbsp;어느정도&nbsp;익으면&nbsp;버섯을&nbsp;넣고&nbsp;재빠르게&nbsp;다시&nbsp;볶아줍니다.\r<br>이때&nbsp;간은&nbsp;소금대신&nbsp;멸치가루&nbsp;1/2작은술로&nbsp;살짝&nbsp;합니다.','','','','',''),(3,'중기이유식 아기 간식, 분유빵 만들기','mid','밀가루는&nbsp;아직&nbsp;못&nbsp;먹는&nbsp;우리&nbsp;아기!\r<br>그렇다면&nbsp;분유와&nbsp;계란을&nbsp;이용해서&nbsp;간단하게&nbsp;만들어봐요~','분유 달걀노른자 치즈 ',0,'upload/11.PNG','재료를&nbsp;준비합니다.&nbsp;분유빵에&nbsp;들어가는&nbsp;기본&nbsp;재료는&nbsp;분유와&nbsp;물,&nbsp;그리고&nbsp;달걀노른자에요.&nbsp;취향에&nbsp;맞게&nbsp;저처럼&nbsp;치즈나,&nbsp;바나나,&nbsp;단호박&nbsp;같은&nbsp;추가&nbsp;메뉴를&nbsp;넣어주면&nbsp;좋습니다.','분유&nbsp;5스푼을&nbsp;내열용기에&nbsp;담고','물&nbsp;30ml를&nbsp;넣어&nbsp;잘&nbsp;섞어줍니다.','달걀은&nbsp;노른자만&nbsp;쏙!','전자렌지에&nbsp;2분&nbsp;30초&nbsp;3분&nbsp;정도&nbsp;봐가면서&nbsp;돌려주면&nbsp;분유빵&nbsp;완성!','','','','',''),(4,'[초기이유식 1단계] 감자미음 만들기','initial','엄마가&nbsp;직접&nbsp;만들어서&nbsp;더욱&nbsp;맛있고&nbsp;건강한&nbsp;이유식으로\r<br>우리&nbsp;아기&nbsp;튼튼하게&nbsp;키워주세요:)\r<br>(초기는&nbsp;엄마가&nbsp;직접해주시면&nbsp;좋을것&nbsp;같아요)','쌀가루 감자 물',0,'upload/12.PNG','먼저&nbsp;쌀가루를&nbsp;계량할껀데요\r<br>이유식을&nbsp;할때엔&nbsp;전자저울이&nbsp;정말&nbsp;유용하게&nbsp;쓰이기&nbsp;때문에&nbsp;구입하시길&nbsp;추천해&nbsp;드리면서\r<br>사진처럼&nbsp;쌀가루를&nbsp;10g&nbsp;으로&nbsp;계량해서&nbsp;준비해&nbsp;주세요\r<br>(그릇&nbsp;먼저&nbsp;저울에&nbsp;올린후&nbsp;0점&nbsp;조절해서&nbsp;쌀가루&nbsp;무게를&nbsp;측정하면&nbsp;편해요)','감자는&nbsp;일단&nbsp;한개를&nbsp;필러로&nbsp;깨끗하게&nbsp;껍질을&nbsp;벗기고\r<br>흠이보이면&nbsp;흠도&nbsp;싹&nbsp;다&nbsp;깎아버리세요\r<br>(싹있는&nbsp;감자는&nbsp;싹을&nbsp;제거해도&nbsp;독이&nbsp;있으니&nbsp;절대&nbsp;사용하지&nbsp;마세요)','감자를&nbsp;다&nbsp;삶았으면&nbsp;꺼내어서&nbsp;작은&nbsp;종지에&nbsp;담아&nbsp;곱게&nbsp;으깨주세요\r<br>절구가&nbsp;있으시면&nbsp;그걸로&nbsp;하시면&nbsp;되구요\r<br>사실&nbsp;이유식&nbsp;전체&nbsp;기간중에&nbsp;절구를&nbsp;이용할일이&nbsp;생각보다&nbsp;많진&nbsp;않아서&nbsp;전&nbsp;그냥&nbsp;숟가락으로&nbsp;으깼어요\r<br>넓은&nbsp;숟가락으로&nbsp;누르면서&nbsp;으깨면&nbsp;워낙&nbsp;양이&nbsp;적으니&nbsp;쉽게&nbsp;으깰수&nbsp;있답니다!','짜잔&nbsp;!&nbsp;초기이유식&nbsp;1단계&nbsp;\'감자미음\'&nbsp;완성입니다&nbsp;:)\r<br>50g&nbsp;씩&nbsp;세&nbsp;개의&nbsp;용기에&nbsp;나누어&nbsp;담아서&nbsp;하나는&nbsp;바로&nbsp;먹이고\r<br>두개는&nbsp;냉장고에&nbsp;넣어서&nbsp;이틀동안&nbsp;나누어&nbsp;먹이시면&nbsp;되세요','','','','','',''),(5,'초기이유식1단계 청경채미음','initial','청경채는&nbsp;칼슘이&nbsp;풍부해서&nbsp;성장기&nbsp;아기에게&nbsp;좋은&nbsp;식재료라고&nbsp;하네요.&nbsp;치아와&nbsp;골격&nbsp;형성에&nbsp;도움을&nbsp;주고&nbsp;세포조직도&nbsp;튼튼하게&nbsp;한답니다.','쌀 물 청경채',0,'upload/13.PNG','쌀은&nbsp;3-4시간&nbsp;충분히&nbsp;불려줍니다.','청경채&nbsp;13g&nbsp;을&nbsp;준비합니다.&nbsp;청경채는&nbsp;줄기는&nbsp;제외하고&nbsp;입만&nbsp;사용해요.','깨끗히&nbsp;씻어줍니다.','청경채를&nbsp;끓는&nbsp;물에&nbsp;10초정도&nbsp;살짝&nbsp;데쳐줍니다.&nbsp;그&nbsp;후&nbsp;찬물에&nbsp;씻어주세요.','저어가며&nbsp;끓여주다가&nbsp;끓으면&nbsp;약불로&nbsp;줄이고&nbsp;찰기가&nbsp;생기고&nbsp;투명해질&nbsp;때&nbsp;까지&nbsp;끓여줍니다.','음....&nbsp;마녀할머니가&nbsp;큰&nbsp;손에&nbsp;끓인&nbsp;것&nbsp;같은&nbsp;비쥬얼인...&nbsp;청경채미음&nbsp;완성입니다.','','','','');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 17:26:07
