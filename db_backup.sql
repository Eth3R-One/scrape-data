-- MySQL dump 10.13  Distrib 8.0.41, for Linux (x86_64)
--
-- Host: localhost    Database: scrap
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add scraped item',7,'add_scrapeditem'),(26,'Can change scraped item',7,'change_scrapeditem'),(27,'Can delete scraped item',7,'delete_scrapeditem'),(28,'Can view scraped item',7,'view_scrapeditem'),(29,'Can add scrape log',8,'add_scrapelog'),(30,'Can change scrape log',8,'change_scrapelog'),(31,'Can delete scrape log',8,'delete_scrapelog'),(32,'Can view scrape log',8,'view_scrapelog');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$1000000$9iwHURvGLiQrFJPbq83jOZ$YZR5PjzNkvZafQXQAYrNg1anX1KdSITbH0gkvEX5t6g=','2025-07-05 10:18:33.422509',1,'root','','','',1,1,'2025-07-04 16:33:18.994572');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2025-07-05 16:48:30.749408','35','LUIS BENITEZ',3,'',7,1),(2,'2025-07-05 16:48:30.749460','34','JOSE BENITEZ',3,'',7,1),(3,'2025-07-05 16:48:30.749481','33','CARLOS BENITEZ',3,'',7,1),(4,'2025-07-05 16:48:30.749499','32','LEONID DOUBINSKI',3,'',7,1),(5,'2025-07-05 16:48:30.749516','31','VOLODYMYR DUBINSKY',3,'',7,1),(6,'2025-07-05 16:48:30.749531','30','FERNANDO GRIJALVA',3,'',7,1),(7,'2025-07-05 16:48:30.749546','29','NAKHLE NADER',3,'',7,1),(8,'2025-07-05 16:48:30.749560','28','AYITEY AYAYEE-AMIM',3,'',7,1),(9,'2025-07-05 16:48:30.749574','27','BOGDAN ADRIAN PURGARIU',3,'',7,1),(10,'2025-07-05 16:48:30.749588','26','ILIE-SEBASTIAN-LAUR VASILESCU',3,'',7,1),(11,'2025-07-05 16:48:30.749602','25','BIRDAL OSMAN',3,'',7,1),(12,'2025-07-05 16:48:30.749616','24','SILVIU-FLORIN SPIRIDON',3,'',7,1),(13,'2025-07-05 16:48:30.749630','23','GEOFFREY JOHN BUSCH',3,'',7,1),(14,'2025-07-05 16:48:30.749644','22','CHRISTOPHER W. BURNS',3,'',7,1),(15,'2025-07-05 16:48:30.749658','21','NIKOLAY ALMAZOV KRECHET',3,'',7,1),(16,'2025-07-05 16:48:30.749672','20','LUIS FERREIRA',3,'',7,1),(17,'2025-07-05 16:48:30.749686','19','DANIEL GUZMAN',3,'',7,1),(18,'2025-07-05 16:48:30.749701','18','ROMAN SEMENOV',3,'',7,1),(19,'2025-07-05 16:48:30.749714','17','NATALIA WOLF',3,'',7,1),(20,'2025-07-05 16:48:30.749728','16','VICTOR WOLF',3,'',7,1),(21,'2025-07-05 16:48:30.749748','15','HAMED AHMED ELBARKI',3,'',7,1),(22,'2025-07-05 16:48:30.749762','14','YOUSEF KURDY',3,'',7,1),(23,'2025-07-05 16:48:30.749775','13','ISMAIL SHALASH',3,'',7,1),(24,'2025-07-05 16:48:30.749870','12','ROSCOE MCMILLAN',3,'',7,1),(25,'2025-07-05 16:48:30.749886','11','HORST COSTA JICHA',3,'',7,1),(26,'2025-07-05 16:48:30.749896','10','JULIEANNE BALDUEZA DIMITRION',3,'',7,1),(27,'2025-07-05 16:48:30.749904','9','JOHN MICHAEL DIMITRION',3,'',7,1),(28,'2025-07-05 16:48:30.749911','8','RODA ABDULHASSAN TAHER',3,'',7,1),(29,'2025-07-05 16:48:30.749918','7','KHALID AHMED SATARY',3,'',7,1),(30,'2025-07-05 16:48:30.749925','6','FARHAD \"FRED\" MONEM',3,'',7,1),(31,'2025-07-05 16:48:30.749932','5','PHET LOI NAOVARATH',3,'',7,1),(32,'2025-07-05 16:48:30.749939','4','JAMES ALEXANDER WARD',3,'',7,1),(33,'2025-07-05 16:48:30.749945','3','VLADISLAV OSIPOV',3,'',7,1),(34,'2025-07-05 16:48:30.749952','2','DARREN ANTHONY ROBINSON',3,'',7,1),(35,'2025-07-05 16:48:30.749958','1','RODNEY DEAN ALLEN',3,'',7,1),(36,'2025-07-05 16:48:39.146602','3','Log at 2025-07-04 17:31:31.893966+00:00: +0 -0',3,'',8,1),(37,'2025-07-05 16:48:39.146650','2','Log at 2025-07-04 17:09:48.731663+00:00: +0 -0',3,'',8,1),(38,'2025-07-05 16:48:39.146678','1','Log at 2025-07-04 16:52:37.364985+00:00: +29 -0',3,'',8,1),(39,'2025-07-06 06:58:45.336535','32','Scrape on 2025-07-06 06:46:12: +0 -0 ~0',3,'',8,1),(40,'2025-07-06 06:58:45.336613','31','Scrape on 2025-07-06 06:04:22: +0 -0 ~0',3,'',8,1),(41,'2025-07-06 06:58:45.336868','30','Scrape on 2025-07-06 06:00:34: +0 -0 ~0',3,'',8,1),(42,'2025-07-06 06:58:45.336917','29','Scrape on 2025-07-06 05:56:00: +0 -0 ~0',3,'',8,1),(43,'2025-07-06 06:58:45.336941','28','Scrape on 2025-07-06 05:53:21: +0 -0 ~0',3,'',8,1),(44,'2025-07-06 06:58:45.336965','27','Scrape on 2025-07-06 05:48:29: +0 -0 ~0',3,'',8,1),(45,'2025-07-06 06:58:45.336982','26','Scrape on 2025-07-06 05:48:09: +0 -0 ~0',3,'',8,1),(46,'2025-07-06 06:58:45.336998','25','Scrape on 2025-07-06 05:46:38: +0 -0 ~0',3,'',8,1),(47,'2025-07-06 06:58:45.337013','24','Scrape on 2025-07-06 05:44:56: +0 -0 ~0',3,'',8,1),(48,'2025-07-06 06:58:45.337028','23','Scrape on 2025-07-06 05:43:29: +0 -0 ~0',3,'',8,1),(49,'2025-07-06 06:58:45.337042','22','Scrape on 2025-07-06 05:36:20: +0 -0 ~0',3,'',8,1),(50,'2025-07-06 06:58:45.337056','21','Scrape on 2025-07-06 05:35:40: +0 -0 ~0',3,'',8,1),(51,'2025-07-06 06:58:45.337070','20','Scrape on 2025-07-06 05:34:16: +0 -0 ~0',3,'',8,1),(52,'2025-07-06 06:58:45.337084','19','Scrape on 2025-07-06 05:33:29: +0 -0 ~0',3,'',8,1),(53,'2025-07-06 06:58:45.337097','18','Scrape on 2025-07-06 05:32:44: +0 -0 ~0',3,'',8,1),(54,'2025-07-06 06:58:45.337111','17','Scrape on 2025-07-06 05:32:15: +0 -0 ~0',3,'',8,1),(55,'2025-07-06 06:58:45.337124','16','Scrape on 2025-07-06 05:31:31: +0 -0 ~0',3,'',8,1),(56,'2025-07-06 06:58:45.337137','15','Scrape on 2025-07-06 05:30:35: +0 -0 ~0',3,'',8,1),(57,'2025-07-06 06:58:45.337151','14','Scrape on 2025-07-06 05:26:28: +0 -0 ~0',3,'',8,1),(58,'2025-07-06 06:58:45.337164','13','Scrape on 2025-07-06 05:23:09: +0 -0 ~0',3,'',8,1),(59,'2025-07-06 06:58:45.337177','12','Scrape on 2025-07-06 05:16:47: +0 -0 ~0',3,'',8,1),(60,'2025-07-06 06:58:45.337191','11','Scrape on 2025-07-06 05:11:05: +0 -0 ~0',3,'',8,1),(61,'2025-07-06 06:58:45.337205','10','Scrape on 2025-07-05 17:28:05: +0 -0 ~0',3,'',8,1),(62,'2025-07-06 06:58:45.337217','9','Scrape on 2025-07-05 17:26:50: +0 -0 ~0',3,'',8,1),(63,'2025-07-06 06:58:45.337232','8','Scrape on 2025-07-05 17:26:23: +0 -0 ~0',3,'',8,1),(64,'2025-07-06 06:58:45.337244','7','Scrape on 2025-07-05 17:16:04: +0 -0 ~0',3,'',8,1),(65,'2025-07-06 06:58:45.337257','6','Scrape on 2025-07-05 17:08:17: +0 -0 ~0',3,'',8,1),(66,'2025-07-06 06:58:45.337269','5','Scrape on 2025-07-05 17:05:06: +0 -0 ~0',3,'',8,1),(67,'2025-07-06 06:58:45.337290','4','Scrape on 2025-07-05 16:54:07: +11 -0 ~0',3,'',8,1),(68,'2025-07-06 06:58:54.579353','70','LUIS BENITEZ',3,'',7,1),(69,'2025-07-06 06:58:54.579392','69','JOSE BENITEZ',3,'',7,1),(70,'2025-07-06 06:58:54.579420','68','CARLOS BENITEZ',3,'',7,1),(71,'2025-07-06 06:58:54.579449','67','LEONID DOUBINSKI',3,'',7,1),(72,'2025-07-06 06:58:54.579465','66','VOLODYMYR DUBINSKY',3,'',7,1),(73,'2025-07-06 06:58:54.579482','65','FERNANDO GRIJALVA',3,'',7,1),(74,'2025-07-06 06:58:54.579510','64','NAKHLE NADER',3,'',7,1),(75,'2025-07-06 06:58:54.579527','63','AYITEY AYAYEE-AMIM',3,'',7,1),(76,'2025-07-06 06:58:54.579543','62','BOGDAN ADRIAN PURGARIU',3,'',7,1),(77,'2025-07-06 06:58:54.579559','61','ILIE-SEBASTIAN-LAUR VASILESCU',3,'',7,1),(78,'2025-07-06 06:58:54.579575','60','BIRDAL OSMAN',3,'',7,1),(79,'2025-07-06 06:58:54.579589','59','SILVIU-FLORIN SPIRIDON',3,'',7,1),(80,'2025-07-06 06:58:54.579603','58','GEOFFREY JOHN BUSCH',3,'',7,1),(81,'2025-07-06 06:58:54.579616','57','CHRISTOPHER W. BURNS',3,'',7,1),(82,'2025-07-06 06:58:54.579630','56','NIKOLAY ALMAZOV KRECHET',3,'',7,1),(83,'2025-07-06 06:58:54.579644','55','LUIS FERREIRA',3,'',7,1),(84,'2025-07-06 06:58:54.579658','54','DANIEL GUZMAN',3,'',7,1),(85,'2025-07-06 06:58:54.579672','53','ROMAN SEMENOV',3,'',7,1),(86,'2025-07-06 06:58:54.579686','52','NATALIA WOLF',3,'',7,1),(87,'2025-07-06 06:58:54.579700','51','VICTOR WOLF',3,'',7,1),(88,'2025-07-06 06:58:54.579713','50','HAMED AHMED ELBARKI',3,'',7,1),(89,'2025-07-06 06:58:54.579727','49','YOUSEF KURDY',3,'',7,1),(90,'2025-07-06 06:58:54.579740','48','ISMAIL SHALASH',3,'',7,1),(91,'2025-07-06 06:58:54.579754','47','ROSCOE MCMILLAN',3,'',7,1),(92,'2025-07-06 06:58:54.579767','46','HORST COSTA JICHA',3,'',7,1),(93,'2025-07-06 06:58:54.579781','45','JULIEANNE BALDUEZA DIMITRION',3,'',7,1),(94,'2025-07-06 06:58:54.579794','44','JOHN MICHAEL DIMITRION',3,'',7,1),(95,'2025-07-06 06:58:54.579808','43','RODA ABDULHASSAN TAHER',3,'',7,1),(96,'2025-07-06 06:58:54.579822','42','KHALID AHMED SATARY',3,'',7,1),(97,'2025-07-06 06:58:54.579835','41','FARHAD \"FRED\" MONEM',3,'',7,1),(98,'2025-07-06 06:58:54.579849','40','PHET LOI NAOVARATH',3,'',7,1),(99,'2025-07-06 06:58:54.579862','39','JAMES ALEXANDER WARD',3,'',7,1),(100,'2025-07-06 06:58:54.579876','38','VLADISLAV OSIPOV',3,'',7,1),(101,'2025-07-06 06:58:54.579889','37','DARREN ANTHONY ROBINSON',3,'',7,1),(102,'2025-07-06 06:58:54.579903','36','RODNEY DEAN ALLEN',3,'',7,1),(103,'2025-07-06 07:12:44.124541','71','RODNEY DEAN ALLEN',3,'',7,1),(104,'2025-07-06 07:26:10.178316','34','Scrape on 2025-07-06 07:17:02: +5 -5 ~0',3,'',8,1),(105,'2025-07-06 07:26:10.178389','33','Scrape on 2025-07-06 07:16:41: +5 -0 ~0',3,'',8,1),(106,'2025-07-06 07:26:16.782662','81','PHET LOI NAOVARATH',3,'',7,1),(107,'2025-07-06 07:26:16.782733','80','LUIS BENITEZ',3,'',7,1),(108,'2025-07-06 07:26:16.782774','79','ROMAN SEMENOV',3,'',7,1),(109,'2025-07-06 07:26:16.782810','78','ISMAIL SHALASH',3,'',7,1),(110,'2025-07-06 07:26:16.782837','77','BIRDAL OSMAN',3,'',7,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(5,'contenttypes','contenttype'),(7,'scraper_app','scrapeditem'),(8,'scraper_app','scrapelog'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2025-07-04 16:13:10.423712'),(2,'auth','0001_initial','2025-07-04 16:13:12.415107'),(3,'admin','0001_initial','2025-07-04 16:13:12.891814'),(4,'admin','0002_logentry_remove_auto_add','2025-07-04 16:13:12.907126'),(5,'admin','0003_logentry_add_action_flag_choices','2025-07-04 16:13:12.924532'),(6,'contenttypes','0002_remove_content_type_name','2025-07-04 16:13:13.189245'),(7,'auth','0002_alter_permission_name_max_length','2025-07-04 16:13:13.337341'),(8,'auth','0003_alter_user_email_max_length','2025-07-04 16:13:13.372291'),(9,'auth','0004_alter_user_username_opts','2025-07-04 16:13:13.384447'),(10,'auth','0005_alter_user_last_login_null','2025-07-04 16:13:13.500310'),(11,'auth','0006_require_contenttypes_0002','2025-07-04 16:13:13.507777'),(12,'auth','0007_alter_validators_add_error_messages','2025-07-04 16:13:13.519861'),(13,'auth','0008_alter_user_username_max_length','2025-07-04 16:13:13.717057'),(14,'auth','0009_alter_user_last_name_max_length','2025-07-04 16:13:13.945690'),(15,'auth','0010_alter_group_name_max_length','2025-07-04 16:13:13.981547'),(16,'auth','0011_update_proxy_permissions','2025-07-04 16:13:13.994639'),(17,'auth','0012_alter_user_first_name_max_length','2025-07-04 16:13:14.210446'),(18,'scraper_app','0001_initial','2025-07-04 16:13:14.364146'),(19,'sessions','0001_initial','2025-07-04 16:13:14.496167'),(20,'scraper_app','0002_rename_data_pulled_at_scrapeditem_timestamp_and_more','2025-07-04 16:34:18.980606'),(21,'scraper_app','0003_scrapelog_unchanged_count_scrapelog_unchanged_items_and_more','2025-07-06 06:43:05.170761');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('0fqcfaois9nfajp8ijdv62g5scli5fin','.eJxVjMsOgjAQAP9lz6ahj-1Wjt75BrJttxY1kFA4Gf_dkHDQ68xk3jDyvtVxb7KOU4YeNFx-WeT0lPkQ-cHzfVFpmbd1iupI1GmbGpYsr9vZ_g0qtwo9lIKsgyMk9EicggvZGjTaJjLJxSuRleC199YJ2iJY0JYs0hHrrovw-QK-WDci:1uXzyb:0Ug9o4ebcg9bbRbwjvAgdlM32XEtDC_SuQppMpulYEU','2025-07-19 10:18:33.431508');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scraper_app_scrapeditem`
--

DROP TABLE IF EXISTS `scraper_app_scrapeditem`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scraper_app_scrapeditem` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `photo_url` varchar(200) DEFAULT NULL,
  `description` longtext,
  `publication` varchar(255) DEFAULT NULL,
  `timestamp` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scraper_app_scrapeditem`
--

LOCK TABLES `scraper_app_scrapeditem` WRITE;
/*!40000 ALTER TABLE `scraper_app_scrapeditem` DISABLE KEYS */;
INSERT INTO `scraper_app_scrapeditem` VALUES (120,'CHRISTOPHER W. BURNS','https://www.fbi.gov/wanted/wcc/christopher-w-burns/@@images/image/preview','','','2025-07-06 07:35:54.244691'),(121,'BIRDAL OSMAN','https://www.fbi.gov/wanted/wcc/birdal-osman/@@images/image/preview','','','2025-07-06 07:36:23.835191'),(122,'AYITEY AYAYEE-AMIM','https://www.fbi.gov/wanted/wcc/ayitey-ayayee-amim/@@images/image/preview','','','2025-07-06 07:36:24.776532'),(123,'DANIEL GUZMAN','https://www.fbi.gov/wanted/wcc/daniel-guzman/@@images/image/preview','','','2025-07-06 07:36:25.790586'),(124,'VOLODYMYR DUBINSKY','https://www.fbi.gov/wanted/wcc/volodymyr-dubinsky/@@images/image/preview','','','2025-07-06 07:36:27.547572');
/*!40000 ALTER TABLE `scraper_app_scrapeditem` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scraper_app_scrapelog`
--

DROP TABLE IF EXISTS `scraper_app_scrapelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `scraper_app_scrapelog` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_at` datetime(6) NOT NULL,
  `new_count` int NOT NULL,
  `removed_count` int NOT NULL,
  `new_items` json NOT NULL,
  `removed_items` json NOT NULL,
  `unchanged_count` int NOT NULL,
  `unchanged_items` json NOT NULL DEFAULT (_utf8mb4'[]'),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scraper_app_scrapelog`
--

LOCK TABLES `scraper_app_scrapelog` WRITE;
/*!40000 ALTER TABLE `scraper_app_scrapelog` DISABLE KEYS */;
INSERT INTO `scraper_app_scrapelog` VALUES (35,'2025-07-06 07:26:38.380791',5,0,'\"[{\\\"title\\\": \\\"JOSE BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/jose-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:32.182168\\\"}, {\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:35.050536\\\"}, {\\\"title\\\": \\\"DARREN ANTHONY ROBINSON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/darren-anthony-robinson/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:36.050283\\\"}, {\\\"title\\\": \\\"PHET LOI NAOVARATH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/loy-naovarath/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:36.901923\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:37.880312\\\"}]\"','\"[]\"',0,'\"[]\"'),(36,'2025-07-06 07:28:14.213487',4,4,'\"[{\\\"title\\\": \\\"JOHN MICHAEL DIMITRION\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/john-michael-dimitrion/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:04.654935\\\"}, {\\\"title\\\": \\\"ROMAN SEMENOV\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roman-semenov/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:11.819762\\\"}, {\\\"title\\\": \\\"BOGDAN ADRIAN PURGARIU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/bogdan-adrian-purgariu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:12.753671\\\"}, {\\\"title\\\": \\\"AYITEY AYAYEE-AMIM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ayitey-ayayee-amim/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:13.673286\\\"}]\"','\"[{\\\"title\\\": \\\"DARREN ANTHONY ROBINSON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/darren-anthony-robinson/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:36.041223+00:00\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:37.869953+00:00\\\"}, {\\\"title\\\": \\\"JOSE BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/jose-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:32.173362+00:00\\\"}, {\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:35.041974+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"PHET LOI NAOVARATH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/loy-naovarath/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:05.565983\\\"}]\"'),(37,'2025-07-06 07:29:54.568703',5,5,'\"[{\\\"title\\\": \\\"ROSCOE MCMILLAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roscoe-mcmillan/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:43.513790\\\"}, {\\\"title\\\": \\\"RODNEY DEAN ALLEN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/rodney-allen/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:44.387785\\\"}, {\\\"title\\\": \\\"GEOFFREY JOHN BUSCH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/geoffrey-john-busch/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:47.259451\\\"}, {\\\"title\\\": \\\"LEONID DOUBINSKI\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/leonid-doubinski/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:49.920658\\\"}, {\\\"title\\\": \\\"VICTOR WOLF\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/victor-wolf/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:54.023363\\\"}]\"','\"[{\\\"title\\\": \\\"JOHN MICHAEL DIMITRION\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/john-michael-dimitrion/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:04.647652+00:00\\\"}, {\\\"title\\\": \\\"BOGDAN ADRIAN PURGARIU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/bogdan-adrian-purgariu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:12.745163+00:00\\\"}, {\\\"title\\\": \\\"PHET LOI NAOVARATH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/loy-naovarath/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:26:36.893766+00:00\\\"}, {\\\"title\\\": \\\"AYITEY AYAYEE-AMIM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ayitey-ayayee-amim/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:13.662779+00:00\\\"}, {\\\"title\\\": \\\"ROMAN SEMENOV\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roman-semenov/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:28:11.808633+00:00\\\"}]\"',0,'\"[]\"'),(38,'2025-07-06 07:30:15.441697',4,4,'\"[{\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:08.710121\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:09.785147\\\"}, {\\\"title\\\": \\\"LUIS FERREIRA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/luis-ferreira/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:11.320439\\\"}, {\\\"title\\\": \\\"FERNANDO GRIJALVA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/fernando-grijalva/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:13.984619\\\"}]\"','\"[{\\\"title\\\": \\\"VICTOR WOLF\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/victor-wolf/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:54.015569+00:00\\\"}, {\\\"title\\\": \\\"GEOFFREY JOHN BUSCH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/geoffrey-john-busch/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:47.245739+00:00\\\"}, {\\\"title\\\": \\\"LEONID DOUBINSKI\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/leonid-doubinski/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:49.910798+00:00\\\"}, {\\\"title\\\": \\\"ROSCOE MCMILLAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roscoe-mcmillan/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:43.503849+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"RODNEY DEAN ALLEN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/rodney-allen/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:14.898783\\\"}]\"'),(39,'2025-07-06 07:31:44.483710',3,3,'\"[{\\\"title\\\": \\\"BOGDAN ADRIAN PURGARIU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/bogdan-adrian-purgariu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:39.440151\\\"}, {\\\"title\\\": \\\"HAMED AHMED ELBARKI\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/hamed-ahmed-elbarki/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:40.751963\\\"}, {\\\"title\\\": \\\"JULIEANNE BALDUEZA DIMITRION\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/julieanne-baldueza-dimitrion/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:41.952851\\\"}]\"','\"[{\\\"title\\\": \\\"LUIS FERREIRA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/luis-ferreira/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:11.312507+00:00\\\"}, {\\\"title\\\": \\\"FERNANDO GRIJALVA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/fernando-grijalva/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:13.976660+00:00\\\"}, {\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:08.697150+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:43.040313\\\"}, {\\\"title\\\": \\\"RODNEY DEAN ALLEN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/rodney-allen/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:43.957791\\\"}]\"'),(40,'2025-07-06 07:32:09.117832',4,4,'\"[{\\\"title\\\": \\\"DANIEL GUZMAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/daniel-guzman/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:05.769049\\\"}, {\\\"title\\\": \\\"DARREN ANTHONY ROBINSON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/darren-anthony-robinson/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:06.721330\\\"}, {\\\"title\\\": \\\"GEOFFREY JOHN BUSCH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/geoffrey-john-busch/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:07.646101\\\"}, {\\\"title\\\": \\\"VICTOR WOLF\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/victor-wolf/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:08.576778\\\"}]\"','\"[{\\\"title\\\": \\\"RODNEY DEAN ALLEN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/rodney-allen/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:29:44.373774+00:00\\\"}, {\\\"title\\\": \\\"HAMED AHMED ELBARKI\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/hamed-ahmed-elbarki/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:40.741394+00:00\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:30:09.774263+00:00\\\"}, {\\\"title\\\": \\\"JULIEANNE BALDUEZA DIMITRION\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/julieanne-baldueza-dimitrion/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:41.945568+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"BOGDAN ADRIAN PURGARIU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/bogdan-adrian-purgariu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:02.974448\\\"}]\"'),(41,'2025-07-06 07:33:11.880624',3,3,'\"[{\\\"title\\\": \\\"ROMAN SEMENOV\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roman-semenov/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:08.741890\\\"}, {\\\"title\\\": \\\"JOSE BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/jose-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:10.406372\\\"}, {\\\"title\\\": \\\"KHALID AHMED SATARY\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/khalid-ahmed-satary/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:11.350652\\\"}]\"','\"[{\\\"title\\\": \\\"BOGDAN ADRIAN PURGARIU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/bogdan-adrian-purgariu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:31:39.432641+00:00\\\"}, {\\\"title\\\": \\\"GEOFFREY JOHN BUSCH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/geoffrey-john-busch/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:07.638493+00:00\\\"}, {\\\"title\\\": \\\"DARREN ANTHONY ROBINSON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/darren-anthony-robinson/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:06.711369+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"VICTOR WOLF\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/victor-wolf/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:06.007512\\\"}, {\\\"title\\\": \\\"DANIEL GUZMAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/daniel-guzman/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:07.036859\\\"}]\"'),(42,'2025-07-06 07:34:21.650549',5,5,'\"[{\\\"title\\\": \\\"NIKOLAY ALMAZOV KRECHET\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/nikolay-almazov-krechet/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:15.959596\\\"}, {\\\"title\\\": \\\"ISMAIL SHALASH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ismail-shalash/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:17.403556\\\"}, {\\\"title\\\": \\\"NAKHLE NADER\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/nakhle-nader/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:18.828667\\\"}, {\\\"title\\\": \\\"ROSCOE MCMILLAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roscoe-mcmillan/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:19.850570\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:21.091709\\\"}]\"','\"[{\\\"title\\\": \\\"JOSE BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/jose-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:10.395138+00:00\\\"}, {\\\"title\\\": \\\"ROMAN SEMENOV\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roman-semenov/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:08.733129+00:00\\\"}, {\\\"title\\\": \\\"VICTOR WOLF\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/victor-wolf/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:08.568828+00:00\\\"}, {\\\"title\\\": \\\"KHALID AHMED SATARY\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/khalid-ahmed-satary/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:33:11.341777+00:00\\\"}, {\\\"title\\\": \\\"DANIEL GUZMAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/daniel-guzman/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:32:05.690585+00:00\\\"}]\"',0,'\"[]\"'),(43,'2025-07-06 07:35:15.632833',5,5,'\"[{\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:09.234894\\\"}, {\\\"title\\\": \\\"PHET LOI NAOVARATH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/loy-naovarath/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:10.171199\\\"}, {\\\"title\\\": \\\"SILVIU-FLORIN SPIRIDON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/silviu-florin-spiridon/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:11.052302\\\"}, {\\\"title\\\": \\\"CARLOS BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/carlos-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:14.129406\\\"}, {\\\"title\\\": \\\"HORST COSTA JICHA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/horst-costa-jicha/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:15.069100\\\"}]\"','\"[{\\\"title\\\": \\\"ROSCOE MCMILLAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/roscoe-mcmillan/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:19.841757+00:00\\\"}, {\\\"title\\\": \\\"FARHAD \\\\\\\"FRED\\\\\\\" MONEM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/farhad-fred-monem/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:21.082864+00:00\\\"}, {\\\"title\\\": \\\"NAKHLE NADER\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/nakhle-nader/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:18.819858+00:00\\\"}, {\\\"title\\\": \\\"ISMAIL SHALASH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ismail-shalash/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:17.387731+00:00\\\"}, {\\\"title\\\": \\\"NIKOLAY ALMAZOV KRECHET\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/nikolay-almazov-krechet/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:34:15.950711+00:00\\\"}]\"',0,'\"[]\"'),(44,'2025-07-06 07:36:28.111378',4,5,'\"[{\\\"title\\\": \\\"BIRDAL OSMAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/birdal-osman/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:36:23.846495\\\"}, {\\\"title\\\": \\\"AYITEY AYAYEE-AMIM\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ayitey-ayayee-amim/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:36:24.785601\\\"}, {\\\"title\\\": \\\"DANIEL GUZMAN\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/daniel-guzman/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:36:25.798949\\\"}, {\\\"title\\\": \\\"VOLODYMYR DUBINSKY\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/volodymyr-dubinsky/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:36:27.556098\\\"}]\"','\"[{\\\"title\\\": \\\"HORST COSTA JICHA\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/horst-costa-jicha/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:15.057858+00:00\\\"}, {\\\"title\\\": \\\"CARLOS BENITEZ\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/carlos-benitez/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:14.117705+00:00\\\"}, {\\\"title\\\": \\\"PHET LOI NAOVARATH\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/loy-naovarath/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:10.156942+00:00\\\"}, {\\\"title\\\": \\\"SILVIU-FLORIN SPIRIDON\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/silviu-florin-spiridon/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:11.042240+00:00\\\"}, {\\\"title\\\": \\\"ILIE-SEBASTIAN-LAUR VASILESCU\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/ilie-sebastian-laur-vasilescu/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:35:09.216271+00:00\\\"}]\"',0,'\"[{\\\"title\\\": \\\"CHRISTOPHER W. BURNS\\\", \\\"photo_url\\\": \\\"https://www.fbi.gov/wanted/wcc/christopher-w-burns/@@images/image/preview\\\", \\\"description\\\": \\\"\\\", \\\"publication\\\": \\\"\\\", \\\"timestamp\\\": \\\"2025-07-06 07:36:26.725161\\\"}]\"');
/*!40000 ALTER TABLE `scraper_app_scrapelog` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-07-06 15:59:28
