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
-- Table structure for table `member_shifts`
--

DROP TABLE IF EXISTS `member_shifts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member_shifts` (
  `member_shift_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `date` date NOT NULL,
  `endTime` time NOT NULL,
  `startTime` time NOT NULL,
  `status` int NOT NULL,
  `task_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `register_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`member_shift_id`),
  KEY `FKm29kxf1sw5mh1wu4kkcu7x3km` (`register_id`),
  CONSTRAINT `FKm29kxf1sw5mh1wu4kkcu7x3km` FOREIGN KEY (`register_id`) REFERENCES `register` (`register_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member_shifts`
--

LOCK TABLES `member_shifts` WRITE;
/*!40000 ALTER TABLE `member_shifts` DISABLE KEYS */;
INSERT INTO `member_shifts` VALUES ('s1665560005','2565-10-12','16:33:00','07:33:00',1,'ปลูกผักเจ้า','r1665559914'),('s1666771866','2565-10-26','16:11:00','15:10:00',1,'ปลูกผักเจ้า','r1664630709'),('s1666772029','2565-10-26','16:13:00','15:13:00',1,'เซลซี','r1664630709'),('s1666772831','2565-10-26','17:27:00','15:27:00',1,'ปลูกผักเจ้า','r1664630709'),('s1666772896','2565-10-26','16:28:00','15:28:00',1,'เซลซี','r1664630709'),('s1666773046','2565-10-26','17:30:00','15:30:00',1,'ปลูกผักเจ้า','r1665385729'),('s1666773665','2565-10-26','04:41:00','15:40:00',1,'พรวนดิน','r1665385729'),('s1666773668','2565-10-27','05:41:00','15:40:00',1,'เซลซี','r1665385729'),('s1666773669','2565-10-27','17:30:00','15:40:00',3,'เซลซี','r1665385729'),('s1666773670','2565-10-27','05:30:00','15:40:00',1,'เซลซี1','r1665385729'),('s1666803364','2565-10-26','15:56:00','23:55:00',1,'ปลูกผักเจ้า','r1666802351'),('s1666855286','2565-10-27','04:21:00','14:19:00',1,'ปลูกผักเจ้า','r1665385729'),('s1667286398','2565-11-01','17:10:00','14:06:00',1,'เซลซี','r1665385729'),('s1667286720','2565-11-01','17:11:00','14:11:00',1,'ปลูกผักเจ้า','r1666802351'),('s1667287774','2565-11-01','16:29:00','14:29:00',1,'ปลูกผักเจ้า','r1667287744'),('s1668493763','2565-11-15','16:30:00','13:27:00',1,'ปลูกผักเจ้า','r1665385729'),('s1669226734','2565-11-24','06:10:00','16:00:00',0,'ขายผัก','r1666855024');
/*!40000 ALTER TABLE `member_shifts` ENABLE KEYS */;
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
