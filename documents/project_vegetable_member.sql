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
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `member` (
  `member_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `member_birthday` date NOT NULL,
  `member_name` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `member_phone` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `member_prefix` int NOT NULL,
  `member_type` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `officer_position` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_code` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_faculty` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `student_major` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES ('f1503556926','2538-11-25','บัญญัติ มนเทียรอาสน์','0966325895',0,'เจ้าหน้าที่โครงการ','ผู้ช่วยศาสตราจารย์','-','-','-'),('m1664630709','2565-10-01','ธัญลักษณ์ วงค์ใหม่','0895563016',1,'หัวหน้าโครงการ',NULL,'6204106314','1112','พืชสวน'),('m1664631095','2565-10-01','สุนิตา เดียวดาว','0995531583',1,'สมาชิก',NULL,'6204106341','1112','ไอที'),('m1665385729','2565-10-10','สุนิตา เดียวดาว','0995531583',1,'สมาชิก',NULL,'6204106341','1112','ประมง'),('m1665559914','2565-10-12','กรณ์พงค์ จำปาจิรัตน์','0895563016',1,'สมาชิก',NULL,'6525484522','1112','พืชไร่');
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-18 14:15:59
