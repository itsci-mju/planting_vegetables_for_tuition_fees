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
-- Table structure for table `transaction_details`
--

DROP TABLE IF EXISTS `transaction_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transaction_details` (
  `transaction_detail_id` int NOT NULL,
  `amount` int NOT NULL,
  `sum` double NOT NULL,
  `type` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `asset_id` int NOT NULL,
  `transaction_id` int NOT NULL,
  PRIMARY KEY (`transaction_detail_id`,`transaction_id`),
  KEY `FKfpech0q8ir022u5e1s0d58riw` (`asset_id`),
  KEY `FKidsi1swwsh13bpbqep9wvf0lt` (`transaction_id`),
  CONSTRAINT `FKfpech0q8ir022u5e1s0d58riw` FOREIGN KEY (`asset_id`) REFERENCES `assets` (`asset_id`),
  CONSTRAINT `FKidsi1swwsh13bpbqep9wvf0lt` FOREIGN KEY (`transaction_id`) REFERENCES `transaction` (`transaction_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transaction_details`
--

LOCK TABLES `transaction_details` WRITE;
/*!40000 ALTER TABLE `transaction_details` DISABLE KEYS */;
INSERT INTO `transaction_details` VALUES (1,2,20,'สินค้า',1,1666633678),(1,2,20,'สินค้า',1,1666633679),(1,2,40,'อุปกรณ์',6,1666634644),(1,6,120,'สินค้า',2,1666853759),(1,5,1110,'อุปกรณ์',6,1666856322),(1,2,40,'อุปกรณ์',7,1666884844),(1,2,40,'อุปกรณ์',7,1666885148),(1,10,150,'อุปกรณ์',8,1667463627),(1,20,200,'อุปกรณ์',10,1667463680),(1,5,50,'สินค้า',5,1667463696),(1,80,800,'สินค้า',1,1667825599),(1,10,100,'สินค้า',5,1668077319),(1,50,750,'สินค้า',3,1668077329),(1,5,100,'อุปกรณ์',6,1668086753),(1,2,40,'อุปกรณ์',7,1668086766),(1,10,100,'สินค้า',1,1668087134),(1,10,200,'สินค้า',2,1668090204),(1,10,100,'สินค้า',1,1668090208),(1,10,200,'สินค้า',4,1668090223),(1,20,1000,'สินค้า',13,1668439460),(1,50,1000,'สินค้า',2,1668439480),(1,10,150,'อุปกรณ์',7,1668441277),(1,10,100,'อุปกรณ์',9,1668446866),(1,2,500,'อุปกรณ์',6,1668450027),(1,50,750,'อุปกรณ์',6,1668454013),(1,10,100,'สินค้า',11,1668488136),(1,10,150,'สินค้า',14,1668494003),(1,50,750,'อุปกรณ์',6,1668494162),(1,10,500,'สินค้า',13,1669118707),(1,10,100,'สินค้า',1,1669118714),(1,10,200,'สินค้า',15,1669118730),(1,50,1000,'สินค้า',15,1669118754);
/*!40000 ALTER TABLE `transaction_details` ENABLE KEYS */;
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
