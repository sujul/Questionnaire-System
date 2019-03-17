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
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `question` (
  `questionID` int(11) NOT NULL,
  `title` varchar(30) DEFAULT NULL,
  `type` varchar(1) DEFAULT NULL,
  `choi_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`questionID`),
  KEY `question_ibfk_1_idx` (`choi_id`),
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`choi_id`) REFERENCES `choice` (`choiceid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
INSERT INTO `question` VALUES (1,'你对本课程的满意程度 。','1',NULL),(2,'你对本课程的教学老师的满意程度 。','1',NULL),(3,'你是否满意本课程的总评成绩的评定方式？','1',NULL),(4,'你对课堂讲授的知识都能理解吗（ ）','2',1),(5,'你最想从这门课程的学习中获得哪方面的提高（ ）','2',2),(6,'你觉得下面哪种授课方式最好（ ）','2',3),(7,'如果让你选择，你希望以何种方式学习本课程（ ）','2',4),(8,'本课程的课堂管理如何（ ）','2',5),(9,'你在本课程学习的收获或心得。','3',NULL),(10,'你对本课程除了以上的问题还有什么意见或建议？','3',NULL);
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
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
