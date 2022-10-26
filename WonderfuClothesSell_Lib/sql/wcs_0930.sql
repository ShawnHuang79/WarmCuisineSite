-- MySQL dump 10.13  Distrib 8.0.30, for Win64 (x86_64)
--
-- Host: localhost    Database: wcs
-- ------------------------------------------------------
-- Server version	8.0.30

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
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `id` char(10) NOT NULL,
  `email` varchar(60) NOT NULL,
  `name` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `birthday` date NOT NULL,
  `gender` char(1) NOT NULL,
  `address` varchar(100) NOT NULL DEFAULT '',
  `phone` varchar(20) NOT NULL DEFAULT '',
  `subscribed` tinyint NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES ('A123123123','test12@uuu.com','林美莉','12345kjll','2005-03-31','F','','',0),('A123456789','test@uuu.com.tw','張三豐','123456l;o','2000-05-15','M','','',0),('A158841858','jacob6566@gmail.com','黃曉泓','8eeUgtYN','1997-06-19','M','臺南市仁德區仁中五街30號','0956827483',0),('A223456718','test718@uuu.com','蕭愛恩','1234kjl;k','2000-08-16','F','台北市復興北路99號12F','02-25149191',0),('A223456781','test781@uuu.com','李怡琳','1234kjl;k','2000-03-16','F','','',0),('E271401027','doohan417@gmail.com','姚全翊','85c6J4q8','2004-01-20','F','高雄市鳳山區五甲二路66號','0987467065',0),('E271401072','doohan627@gmail.com','程容茹','123rt4jfgd','2001-01-05','F','','',0),('F103749153','zaiden5106@gmail.com','龔淳祉','W86w7UW6','1992-09-01','M','臺南市北區中華北路２段8號','0934665382',0),('F153264687','trenton1025@gmail.com','吳傑巖','V4wL74a9','1979-02-06','M','臺北市大安區金華街58號11樓之14','0918743903',0),('F209612513','morgan2755@hotmail.com','程容菲','6F4d827b','1965-07-13','F','臺中市大里區德芳南一街88號之8','0961775610',0),('H216030809','coombs9072@hotmail.com','江家茹','29fZT2yL','1999-07-27','F','雲林縣斗南鎮德美82號','0919090877',0),('K250444223','stepanek8524@icloud.com','潘元升','zp98tpn4','2001-06-14','F','臺中市西屯區漢口路2段59號','0972952097',0),('L151448287','coombs7158@outlook.com','馬林濱','KFQ5w5VL','1995-09-08','M','苗栗縣竹南鎮竹篙厝83號11樓','0963806949',0),('U184925546','larry6368@outlook.com','董曉林','c4bVAnNu','2004-08-06','M','臺南市安南區大聖二街85號','0917073926',0),('X249642472','burton7613@outlook.com','楊嫣玟','K67YgFZE','2002-08-16','F','南投縣埔里鎮枇杷三巷74號','0937868009',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int unsigned NOT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `launch_date` date NOT NULL DEFAULT (curdate()),
  `category` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'招牌甘泉魚麵',140,1,NULL,'以印度咖哩粉與味噌調理而成的湯頭，搭配魚片，是獨特特色的招牌麵食','2022-09-30','書籍');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-09-30 17:49:29
