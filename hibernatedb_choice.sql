-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: hibernatedb
-- ------------------------------------------------------
-- Server version	8.0.12

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
-- Table structure for table `choice`
--

DROP TABLE IF EXISTS `choice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `choice` (
  `choiceID` int(11) NOT NULL,
  `option1` varchar(10) DEFAULT NULL,
  `option2` varchar(10) DEFAULT NULL,
  `option3` varchar(10) DEFAULT NULL,
  `option4` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`choiceID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `choice`
--

LOCK TABLES `choice` WRITE;
/*!40000 ALTER TABLE `choice` DISABLE KEYS */;
INSERT INTO `choice` VALUES (1,'全部理解','大部分理解','部分理解','不理解'),(2,'多种学习方法','学习兴趣的激发','创新能力','实践动手能力'),(3,'粉笔写板书','单纯PPT','图片展示','视频讲解'),(4,'完全课堂讲授','完全通过网络自学','小组协作学习','以上方式混合'),(5,'严格','较严格','不够严格','不严格');
/*!40000 ALTER TABLE `choice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08  1:55:07
