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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `date` date NOT NULL,
  `seat_row_name` char(2) NOT NULL,
  `seat_byte_12` tinyint NOT NULL,
  `seat_byte_17` tinyint NOT NULL,
  `seat_byte_19` tinyint NOT NULL,
  PRIMARY KEY (`seat_row_name`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES ('2022-11-29','A',4,0,0),('2022-11-29','B',17,0,0),('2022-11-29','C',26,0,0),('2022-11-29','D',30,0,0),('2022-11-29','E',31,0,0),('2022-11-29','F',1,0,0),('2022-11-29','G',-128,0,0),('2022-11-29','H',127,0,0),('2022-11-29','I',4,0,0),('2022-11-29','J',5,0,0),('2022-11-29','K',6,0,0);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `customers` VALUES ('A123123123','test12@uuu.com','林美莉','12345kjll','2005-03-31','F','臺中市西屯區漢口路2段50號','0956827481',0),('A123456789','test@uuu.com.tw','張三豐','123456l;o','2000-05-15','M','臺南市安南區大聖二街81號','0956827482',0),('A158841858','jacob6566@gmail.com','黃曉泓','1qaz2wsx','1997-06-22','M','臺南市仁德區仁中五街35號','0956827555',1),('A223456718','test718@uuu.com','蕭愛恩','1234kjl;k','2000-08-16','F','台北市復興北路99號12F','02-25149191',0),('A223456781','test781@uuu.com','李怡琳','1234kjl;k','2000-03-16','F','臺北市大安區金華街52號','0987467064',0),('E271401027','doohan417@gmail.com','姚全翊','85c6J4q8','2004-01-20','F','高雄市鳳山區五甲二路66號','0987467065',0),('E271401072','doohan627@gmail.com','程容茹','123rt4jfgd','2001-01-05','F','高雄市鳳山區五甲二路62號','0987467063',0),('F103749153','zaiden5106@gmail.com','龔淳祉','W86w7UW6','1992-09-01','M','臺南市北區中華北路２段8號','0934665382',0),('F153264687','trenton1025@gmail.com','吳傑巖','V4wL74a9','1979-02-06','M','臺北市大安區金華街58號11樓之14','0918743903',0),('F209612513','morgan2755@hotmail.com','程容菲','6F4d827b','1965-07-13','F','臺中市大里區德芳南一街88號之8','0961775610',0),('H216030809','coombs9072@hotmail.com','江家茹','29fZT2yL','1999-07-27','F','雲林縣斗南鎮德美82號','0919090877',0),('K250444223','stepanek8524@icloud.com','潘元升','zp98tpn4','2001-06-14','F','臺中市西屯區漢口路2段59號','0972952097',0),('L151448287','coombs7158@outlook.com','馬林濱','KFQ5w5VL','1995-09-08','M','苗栗縣竹南鎮竹篙厝83號11樓','0963806949',1),('U184925546','larry6368@outlook.com','董曉林','c4bVAnNu','2004-08-06','M','臺南市安南區大聖二街85號','0917073926',0),('X249642472','burton7613@outlook.com','楊嫣玟','K67YgFZE','2002-08-16','F','南投縣埔里鎮枇杷三巷74號','0937868009',0);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_items` (
  `order_id` int NOT NULL,
  `product_id` int NOT NULL,
  `size_name` varchar(10) NOT NULL,
  `price` double NOT NULL,
  `quantity` int unsigned NOT NULL,
  PRIMARY KEY (`order_id`,`size_name`,`product_id`),
  CONSTRAINT `FKEY_id_order_items_TO_order` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,3,'',150.1,4),(2,8,'',23.7,4),(3,12,'',39.5,3),(3,9,'大',160,4),(4,4,'中',80,5),(5,1,'加大',140,6),(5,7,'大',65,6),(6,3,'加大',225,7),(7,1,'加大',140,5),(8,1,'加大',140,7),(8,1,'大',110,2),(9,1,'加大',111,5),(10,1,'加大',111,3),(11,1,'大',87,3);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `order_view`
--

DROP TABLE IF EXISTS `order_view`;
/*!50001 DROP VIEW IF EXISTS `order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `order_view` AS SELECT 
 1 AS `id`,
 1 AS `customer_id`,
 1 AS `created_date`,
 1 AS `created_time`,
 1 AS `shipping_type`,
 1 AS `shipping_fee`,
 1 AS `shipping_note`,
 1 AS `payment_type`,
 1 AS `payment_fee`,
 1 AS `payment_note`,
 1 AS `status`,
 1 AS `recipient_name`,
 1 AS `recipient_email`,
 1 AS `recipient_phone`,
 1 AS `shipping_address`,
 1 AS `order_id`,
 1 AS `product_id`,
 1 AS `size_name`,
 1 AS `price`,
 1 AS `quantity`,
 1 AS `amount`,
 1 AS `product_name`,
 1 AS `photo_url`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id` int NOT NULL AUTO_INCREMENT,
  `customer_id` char(10) NOT NULL,
  `created_date` date NOT NULL,
  `created_time` time NOT NULL,
  `shipping_type` varchar(5) NOT NULL,
  `shipping_fee` double NOT NULL,
  `shipping_note` varchar(100) DEFAULT NULL,
  `payment_type` varchar(5) NOT NULL,
  `payment_fee` double NOT NULL,
  `payment_note` varchar(100) DEFAULT NULL,
  `status` int NOT NULL DEFAULT '0',
  `recipient_name` varchar(20) NOT NULL,
  `recipient_email` varchar(60) NOT NULL,
  `recipient_phone` varchar(20) NOT NULL,
  `shipping_address` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKEY_id_orders_TO_customer_idx` (`customer_id`),
  CONSTRAINT `FKEY_id_orders_TO_customer` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'A158841858','2022-11-23','10:57:51','HOME',100,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','臺南市仁德區仁中五街29號'),(2,'A158841858','2022-11-23','10:58:40','HOME',100,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','臺南市仁德區仁中五街29號'),(3,'A158841858','2022-11-23','14:03:36','STORE',65,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','臺南市仁德區仁中五街29號'),(4,'A158841858','2022-11-23','14:24:26','HOME',100,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','臺南市仁德區仁中五街29號'),(5,'A158841858','2022-11-23','22:02:15','SHOP',0,NULL,'SHOP',0,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','臺南市仁德區仁中五街29號'),(6,'A158841858','2022-11-24','09:34:49','STORE',65,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','高雄市'),(7,'A158841858','2022-11-24','12:23:31','SHOP',0,NULL,'CARD',0,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','高雄市'),(8,'A158841858','2022-11-24','15:28:02','HOME',100,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','高雄市'),(9,'A158841858','2022-11-25','10:15:42','SHOP',0,NULL,'HOME',50,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','高雄市'),(10,'A158841858','2022-12-01','12:14:51','SHOP',0,NULL,'SHOP',0,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','台北'),(11,'A158841858','2022-12-01','12:49:51','SHOP',0,NULL,'SHOP',0,NULL,0,'黃曉泓','jacob6566@gmail.com','0956827555','台北市復興北路99號14F');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id` int NOT NULL,
  `vendor` varchar(20) NOT NULL,
  `name` varchar(50) NOT NULL,
  `unit_price` double NOT NULL,
  `stock` int unsigned NOT NULL,
  `photo_url` varchar(250) DEFAULT NULL,
  `description` varchar(200) NOT NULL DEFAULT '',
  `launch_date` date NOT NULL DEFAULT (curdate()),
  `category` varchar(10) NOT NULL,
  `discount` int DEFAULT NULL,
  `photo_url_backup` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'臻蜜定食舖','招牌甘泉魚麵',110,1,'/wcs/images/productImg001.jpg','以印度咖哩粉與味噌調理而成的湯頭，搭配魚片，是獨特特色的招牌麵食','2022-09-30','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/40237680.jpg'),(2,'臻蜜定食舖','炸排骨',190,1,'/wcs/images/productImg002.jpg','好吃的炸排骨(沒有discount)','2022-10-25','餐點',0,'https://images.deliveryhero.io/image/fd-tw/LH/p6lj-hero.jpg'),(3,'臻蜜定食舖','蝦捲飯',190,1,'/wcs/images/productImg003.jpg','蝦捲飯好吃','2022-10-26','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/7587316.jpg'),(4,'COMEBUYTEA','厚奶烏龍小芋Q',60,1,'/wcs/images/productImg004.jpg','具獨特純厚韻味的炭焙烏龍與香醇濃郁厚奶融合，加入Q彈有勁小芋圓及薯圓，為全球門市熱銷排行第一。','2022-10-27','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/6088204.jpg'),(5,'COMEBUYTEA','經典洛神蜜香紅',60,1,'/wcs/images/productImg005.jpg','嚴選洛神花混搭錫蘭紅茶，微酸滋味與茶香呈現豐富多層次。','2022-10-28','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/7947593.jpg'),(6,'COMEBUYTEA','鮮萃大麥紅茶',20,1,'/wcs/images/productImg006.jpg','以阿薩姆紅茶與大麥煎焙炒香製成、口感溫潤、風味迷人。','2022-10-29','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/2366127.jpg'),(7,'COMEBUYTEA','烏龍拿鐵',45,1,'/wcs/images/productImg007.jpg','百年茶廠烘焙出的烏龍綠茶，加上濃郁的鮮乳調製而成，煙燻口感適合重口味的你。','2022-10-31','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/7947600.jpg'),(8,'COMEBUYTEA','珍珠奶茶',30,1,'/wcs/images/productImg008.jpg','擁有紅茶甜潤與牛奶香醇的招牌奶茶內，加入口感彈Q略帶焦糖香的珍珠，豐富的口味搭配。','2022-11-01','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/6088212.jpg'),(9,'駱姐正雞酒','何手烏雞',160,1,'/wcs/images/productImg009.jpg','好吃何手烏','2022-11-01','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/32338823.jpg'),(10,'駱姐正雞酒','麻油蛋麵線',145,1,'/wcs/images/productImg010.jpg','好吃麻油蛋','2022-11-01','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/32338822.jpg'),(11,'駱姐正雞酒','五彩時鮮雞',160,1,'/wcs/images/productImg011.jpg','好吃的時鮮雞套餐','2022-11-14','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/32338821.jpg'),(12,'COMEBUYTEA','綠豆冰沙',50,1,'/wcs/images/productImg012.jpg','綠豆冰沙超好喝','2022-11-14','飲料',21,'https://images.deliveryhero.io/image/fd-tw/Products/14979869.jpg'),(13,'卡頌披薩','10吋章魚燒披薩',350,1,'https://images.deliveryhero.io/image/fd-tw/Products/1131126.jpg','章魚燒披薩可以切8塊','2022-11-25','餐點',21,'https://images.deliveryhero.io/image/fd-tw/Products/1131126.jpg'),(14,'Parco義大利麵','蒜辣白酒蛤蜊麵',175,1,'https://images.deliveryhero.io/image/fd-tw/Products/10392979.jpg','食材產地均為台灣','2022-11-25','餐點',20,'https://images.deliveryhero.io/image/fd-tw/Products/10392979.jpg');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_ice`
--

DROP TABLE IF EXISTS `products_ice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_ice` (
  `icePK` char(5) NOT NULL,
  `ice` char(10) NOT NULL,
  PRIMARY KEY (`icePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_ice`
--

LOCK TABLES `products_ice` WRITE;
/*!40000 ALTER TABLE `products_ice` DISABLE KEYS */;
INSERT INTO `products_ice` VALUES ('ice01','正常冰'),('ice02','少冰(70%)'),('ice03','微冰(50%)'),('ice04','去冰(30%)'),('ice05','完全去冰');
/*!40000 ALTER TABLE `products_ice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products_join_size_view`
--

DROP TABLE IF EXISTS `products_join_size_view`;
/*!50001 DROP VIEW IF EXISTS `products_join_size_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_join_size_view` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `min_price`,
 1 AS `discount`,
 1 AS `photo_url`,
 1 AS `description`,
 1 AS `launch_date`,
 1 AS `category`,
 1 AS `size`,
 1 AS `list_price`,
 1 AS `unit_price`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `products_price`
--

DROP TABLE IF EXISTS `products_price`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_price` (
  `sizefk` char(6) NOT NULL,
  `productIdfk` int NOT NULL,
  `price` int NOT NULL,
  `stock_temp` int NOT NULL,
  PRIMARY KEY (`sizefk`,`productIdfk`),
  KEY `products_size_fk_idx` (`sizefk`),
  KEY `efgeg_idx` (`productIdfk`),
  CONSTRAINT `FKEY_id_products_price_TO_products` FOREIGN KEY (`productIdfk`) REFERENCES `products` (`id`),
  CONSTRAINT `FKEY_size_products_price_TO_products_size` FOREIGN KEY (`sizefk`) REFERENCES `products_size` (`sizePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_price`
--

LOCK TABLES `products_price` WRITE;
/*!40000 ALTER TABLE `products_price` DISABLE KEYS */;
INSERT INTO `products_price` VALUES ('size01',1,140,1),('size01',2,225,2),('size01',3,225,3),('size01',9,190,3),('size01',10,160,1),('size01',14,200,1),('size02',1,110,4),('size02',2,190,4),('size02',3,190,3),('size02',4,100,2),('size02',5,90,1),('size02',6,40,1),('size02',7,65,2),('size02',8,50,3),('size02',9,160,2),('size02',10,145,1),('size02',14,175,2),('size03',4,80,4),('size03',5,75,4),('size03',6,30,3),('size03',7,55,2),('size03',8,40,1),('size04',4,60,1),('size04',5,60,2),('size04',6,20,3),('size04',7,45,4),('size04',8,30,4);
/*!40000 ALTER TABLE `products_price` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_size`
--

DROP TABLE IF EXISTS `products_size`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_size` (
  `sizePK` char(6) NOT NULL,
  `size` char(5) NOT NULL,
  PRIMARY KEY (`sizePK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_size`
--

LOCK TABLES `products_size` WRITE;
/*!40000 ALTER TABLE `products_size` DISABLE KEYS */;
INSERT INTO `products_size` VALUES ('size01','加大'),('size02','大'),('size03','中'),('size04','小');
/*!40000 ALTER TABLE `products_size` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products_sugar`
--

DROP TABLE IF EXISTS `products_sugar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products_sugar` (
  `sugarPK` char(7) NOT NULL,
  `sugar` char(7) NOT NULL,
  PRIMARY KEY (`sugarPK`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products_sugar`
--

LOCK TABLES `products_sugar` WRITE;
/*!40000 ALTER TABLE `products_sugar` DISABLE KEYS */;
INSERT INTO `products_sugar` VALUES ('sugar01','全糖'),('sugar02','7分'),('sugar03','5分'),('sugar04','3分'),('sugar05','無糖');
/*!40000 ALTER TABLE `products_sugar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `products_view`
--

DROP TABLE IF EXISTS `products_view`;
/*!50001 DROP VIEW IF EXISTS `products_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `products_view` AS SELECT 
 1 AS `id`,
 1 AS `name`,
 1 AS `unit_price`,
 1 AS `discount`,
 1 AS `stock`,
 1 AS `photo_url`,
 1 AS `description`,
 1 AS `launch_date`,
 1 AS `category`,
 1 AS `productIdfk`,
 1 AS `sizefk`,
 1 AS `price`,
 1 AS `product_list`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tt`
--

DROP TABLE IF EXISTS `tt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tt` (
  `c1` int NOT NULL,
  `c2` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `c3` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`c1`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tt`
--

LOCK TABLES `tt` WRITE;
/*!40000 ALTER TABLE `tt` DISABLE KEYS */;
INSERT INTO `tt` VALUES (1,'2022-11-08 19:02:51','2022-11-08 19:00:56'),(2,NULL,'2022-11-08 19:01:35');
/*!40000 ALTER TABLE `tt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `order_view`
--

/*!50001 DROP VIEW IF EXISTS `order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `order_view` AS select `orders`.`id` AS `id`,`orders`.`customer_id` AS `customer_id`,`orders`.`created_date` AS `created_date`,`orders`.`created_time` AS `created_time`,`orders`.`shipping_type` AS `shipping_type`,`orders`.`shipping_fee` AS `shipping_fee`,`orders`.`shipping_note` AS `shipping_note`,`orders`.`payment_type` AS `payment_type`,`orders`.`payment_fee` AS `payment_fee`,`orders`.`payment_note` AS `payment_note`,`orders`.`status` AS `status`,`orders`.`recipient_name` AS `recipient_name`,`orders`.`recipient_email` AS `recipient_email`,`orders`.`recipient_phone` AS `recipient_phone`,`orders`.`shipping_address` AS `shipping_address`,`order_items`.`order_id` AS `order_id`,`order_items`.`product_id` AS `product_id`,`order_items`.`size_name` AS `size_name`,`order_items`.`price` AS `price`,`order_items`.`quantity` AS `quantity`,(`order_items`.`price` * `order_items`.`quantity`) AS `amount`,`products`.`name` AS `product_name`,`products`.`photo_url` AS `photo_url` from ((`orders` join `order_items` on((`orders`.`id` = `order_items`.`order_id`))) join `products` on((`order_items`.`product_id` = `products`.`id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products_join_size_view`
--

/*!50001 DROP VIEW IF EXISTS `products_join_size_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_join_size_view` AS select `products`.`id` AS `id`,`products`.`name` AS `name`,`products`.`unit_price` AS `min_price`,`products`.`discount` AS `discount`,`products`.`photo_url` AS `photo_url`,`products`.`description` AS `description`,`products`.`launch_date` AS `launch_date`,`products`.`category` AS `category`,`products_size`.`size` AS `size`,`products_price`.`price` AS `list_price`,round((`products_price`.`price` * ((100 - `products`.`discount`) / 100)),0) AS `unit_price` from ((`products` left join `products_price` on((`products`.`id` = `products_price`.`productIdfk`))) left join `products_size` on((`products_price`.`sizefk` = `products_size`.`sizePK`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `products_view`
--

/*!50001 DROP VIEW IF EXISTS `products_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `products_view` AS select `products`.`id` AS `id`,`products`.`name` AS `name`,`products`.`unit_price` AS `unit_price`,`products`.`discount` AS `discount`,ifnull(sum(`products_price`.`stock_temp`),`products`.`stock`) AS `stock`,`products`.`photo_url` AS `photo_url`,`products`.`description` AS `description`,`products`.`launch_date` AS `launch_date`,`products`.`category` AS `category`,`products_price`.`productIdfk` AS `productIdfk`,`products_price`.`sizefk` AS `sizefk`,`products_price`.`price` AS `price`,group_concat(`products_price`.`productIdfk` separator ',') AS `product_list` from (`products` left join `products_price` on((`products`.`id` = `products_price`.`productIdfk`))) group by `products`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-01 19:17:03
