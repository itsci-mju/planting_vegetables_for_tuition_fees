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
-- Table structure for table `assets`
--

DROP TABLE IF EXISTS `assets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `assets` (
  `asset_id` int NOT NULL,
  `asset_price` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `equipment_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `equipment_unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `product_unit` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `project_id` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`asset_id`),
  KEY `FK6aqk337s80ypynfi4xfsld7x7` (`project_id`),
  CONSTRAINT `FK6aqk337s80ypynfi4xfsld7x7` FOREIGN KEY (`project_id`) REFERENCES `projects` (`project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assets`
--

LOCK TABLES `assets` WRITE;
/*!40000 ALTER TABLE `assets` DISABLE KEYS */;
INSERT INTO `assets` VALUES (1,'10','-','-','ผักกาด','หัว','1112'),(2,'20','-','-','ผักบุ้ง','ถุง','1112'),(3,'15','-','-','กะหล่ำ','หัว','1112'),(4,'20','-','-','มะเขือยาว','ถุง','1112'),(5,'10','-','-','ผักชี','มัด','1112'),(6,'0','จอบ','เล่ม','-','-','1112'),(7,'0','ปุ๋ย','ถุง','-','-','1112'),(8,'0','เมล็ดผักชี','ซอง','-','-','1112'),(9,'0','เมล็ดถัวฝักยาวพันธเนื้อ','ซอง','-','-','1112'),(10,'0','เมล็ดคึ่นฉ่าย','ซอง','-','-','1112'),(11,'10','-','-','โหระพา','ถุง','1112'),(12,'10','-','-','มะเขือเปราะ','ถุง','1112'),(13,'50','-','-','ถั่วงอกหัวโต(500กรัม)','ถุง','1112'),(14,'15','-','-','ผักคะน้า','ถุง','1112'),(15,'20','-','-','สลัดกรีนโอ๊ค','ถุง','1112'),(16,'20','-','-','สลัดเรดโอ๊ค','ถุง','1112');
/*!40000 ALTER TABLE `assets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-11-24 20:06:17
