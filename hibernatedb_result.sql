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
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `result` (
  `resultID` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cour_id` int(11) DEFAULT NULL,
  `ques_id` int(11) DEFAULT NULL,
  `answer` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`resultID`),
  KEY `result_ibfk_2_idx` (`cour_id`),
  KEY `result_ibfk_3_idx` (`ques_id`),
  KEY `result_ibfk_1` (`user_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`userid`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`cour_id`) REFERENCES `course` (`courseid`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`ques_id`) REFERENCES `question` (`questionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
INSERT INTO `result` VALUES (0,0,0,1,'良好'),(1,0,0,2,'满意'),(2,0,0,3,'良好'),(3,0,0,4,'大部分理解'),(4,0,0,5,'学习兴趣的激发'),(5,0,0,6,'单纯PPT'),(6,0,0,7,'小组协作学习'),(7,0,0,8,'不够严格'),(8,0,0,9,'学会了Java'),(9,0,0,10,'更易懂些'),(10,0,1,1,'良好'),(11,0,1,3,'中等'),(12,0,1,4,'大部分理解'),(13,0,1,7,'完全课堂讲授'),(14,0,1,9,'了解了C语言'),(15,2,0,1,'良好'),(16,2,0,2,'良好'),(17,2,0,3,'良好'),(18,2,0,4,'部分理解'),(19,2,0,5,'创新能力'),(20,2,0,6,'图片展示'),(21,2,0,7,'以上方式混合'),(22,2,0,8,'不够严格'),(23,2,0,9,'了解Java'),(24,2,0,10,'不够严格'),(25,1,1,1,'中等'),(26,1,1,3,'良好'),(27,1,1,4,'部分理解'),(28,1,1,7,'小组协作学习'),(29,1,1,9,'C语言简单实用');
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-01-08  1:55:08
