-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: project_vegetable
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `register`
--

DROP TABLE IF EXISTS `register`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `register` (
  `register_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `register_date` datetime NOT NULL,
  `register_reson` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `register_status` int NOT NULL,
  `register_term` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `member_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`register_id`),
  KEY `FKkod9yiwloler8nrigvylojgdn` (`member_id`),
  KEY `FKi17du3o2jb886hyfs17nk092m` (`project_id`),
  CONSTRAINT `FKi17du3o2jb886hyfs17nk092m` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`),
  CONSTRAINT `FKkod9yiwloler8nrigvylojgdn` FOREIGN KEY (`member_id`) REFERENCES `member` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `register`
--

LOCK TABLES `register` WRITE;
/*!40000 ALTER TABLE `register` DISABLE KEYS */;
INSERT INTO `register` VALUES ('r1664630709','2565-10-01 20:25:09','',1,'1-2565','m1664630709','1112'),('r1664631095','2565-10-01 20:31:35','ดดดดดดดดดดดดดดดดดดดดดดดดดดด',2,'1-2565','m1664631095','1112'),('r1665385729','2565-10-10 14:08:49','ทททททททททททททท',1,'1-2565','m1665385729','1112'),('r1665559914','2565-10-12 14:31:54','ดดดดดดดดดดดดดดด',1,'1-2565','m1665559914','1112'),('r1666079444','2565-10-18 14:50:44','สกกสสกสกกสกสกส',1,'2-2565','m1666079444','1112'),('r1666800141','2565-10-26 23:02:21','55555555555555555555',0,'1-2565','m1666800141','1112'),('r1666800622','2565-10-26 23:10:22','8888\r\n',1,'1-2565','m1666800622','1112'),('r1666802168','2565-10-26 23:36:08','วววววววววววววววววววววววววววววววววววววววววววววววว',0,'2-2565','m1666802168','1112'),('r1666802351','2565-10-26 23:39:11','บบบบบบบบบบบบบบบบบบบบบบบบบบบบบ',0,'1-2565','m1666802351','1112'),('r1666855024','2565-10-27 14:17:04','สสสสสสสสสสสสสสส',1,'1-2565','m1666855024','1112'),('r1667287744','2565-11-01 14:29:04','ดเเเเเเกกกกกกกกกกกกกกกกกก',1,'1','m1667287744','1112'),('r1668493514','2565-11-15 13:25:14','อยากเข้าโครงการ',1,'2','m1668493514','1112'),('r1669283291','2565-11-24 16:48:11','มาารนีรนีรนส่น',0,'2','m1669283291','1112');
/*!40000 ALTER TABLE `register` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-24 20:06:18
