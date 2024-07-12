-- MySQL dump 10.13  Distrib 8.3.0, for Win64 (x86_64)
--
-- Host: localhost    Database: couchsurfer_db
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `_prisma_migrations`
--

DROP TABLE IF EXISTS `_prisma_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `_prisma_migrations` (
  `id` varchar(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `checksum` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `finished_at` datetime(3) DEFAULT NULL,
  `migration_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logs` text COLLATE utf8mb4_unicode_ci,
  `rolled_back_at` datetime(3) DEFAULT NULL,
  `started_at` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `applied_steps_count` int unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `_prisma_migrations`
--

LOCK TABLES `_prisma_migrations` WRITE;
/*!40000 ALTER TABLE `_prisma_migrations` DISABLE KEYS */;
INSERT INTO `_prisma_migrations` VALUES ('2d94e99e-70b8-4159-818c-41c5bdf01082','4c40da25c560bbd84ab685e5bcf336cb64b0a4af85bc1fbd5f218b28a8cf6b65','2024-07-12 02:18:42.534','20240712021842_init',NULL,NULL,'2024-07-12 02:18:42.347',1);
/*!40000 ALTER TABLE `_prisma_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `id_connection` int NOT NULL AUTO_INCREMENT,
  `fid_user` int DEFAULT NULL,
  `fid_recipient` int DEFAULT NULL,
  `fid_area` int DEFAULT NULL,
  `connection_status` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_area` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'USER',
  `connection_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `connection_timestamp` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `connection_completed` datetime(3) DEFAULT NULL,
  PRIMARY KEY (`id_connection`),
  KEY `fk_connections_user` (`fid_user`),
  KEY `fk_connections_recipient` (`fid_recipient`),
  CONSTRAINT `connections_fid_user_fkey` FOREIGN KEY (`fid_user`) REFERENCES `users` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `fk_connections_recipient` FOREIGN KEY (`fid_recipient`) REFERENCES `users` (`id_user`),
  CONSTRAINT `fk_connections_user` FOREIGN KEY (`fid_user`) REFERENCES `users` (`id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (1,1,2,1,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(2,2,3,2,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(3,3,4,3,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(4,4,5,4,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(5,5,6,5,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(6,6,7,6,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(7,7,8,7,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(8,8,9,8,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(9,9,10,9,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL),(10,10,1,10,'ACTV','USER','FRND','2024-07-12 02:21:11.000',NULL);
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media`
--

DROP TABLE IF EXISTS `media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media` (
  `id_media` int NOT NULL AUTO_INCREMENT,
  `fid_user` int DEFAULT NULL,
  `fid_area` int DEFAULT NULL,
  `fid_folder` int DEFAULT NULL,
  `media_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'QUE',
  `media_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_area` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_timestamp` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `media_meta` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `media_error` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'MEROK',
  PRIMARY KEY (`id_media`),
  KEY `media_fid_user_fkey` (`fid_user`),
  CONSTRAINT `media_fid_user_fkey` FOREIGN KEY (`fid_user`) REFERENCES `users` (`id_user`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media`
--

LOCK TABLES `media` WRITE;
/*!40000 ALTER TABLE `media` DISABLE KEYS */;
INSERT INTO `media` VALUES (1,1,1,1,'QUE','IMG','USER','2024-07-12 02:21:08.812','{\"resolution\": \"1024x768\", \"size\": \"500KB\"}','MEROK'),(2,2,2,2,'QUE','VID','USER','2024-07-12 02:21:08.812','{\"resolution\": \"1920x1080\", \"size\": \"20MB\"}','MEROK'),(3,3,3,3,'QUE','DOC','USER','2024-07-12 02:21:08.812','{\"pages\": \"10\", \"size\": \"2MB\"}','MEROK'),(4,4,4,4,'QUE','IMG','USER','2024-07-12 02:21:08.812','{\"resolution\": \"800x600\", \"size\": \"300KB\"}','MEROK'),(5,5,5,5,'QUE','VID','USER','2024-07-12 02:21:08.812','{\"resolution\": \"1280x720\", \"size\": \"10MB\"}','MEROK'),(6,6,6,6,'QUE','DOC','USER','2024-07-12 02:21:08.812','{\"pages\": \"5\", \"size\": \"1MB\"}','MEROK'),(7,7,7,7,'QUE','IMG','USER','2024-07-12 02:21:08.812','{\"resolution\": \"640x480\", \"size\": \"200KB\"}','MEROK'),(8,8,8,8,'QUE','VID','USER','2024-07-12 02:21:08.812','{\"resolution\": \"2560x1440\", \"size\": \"30MB\"}','MEROK'),(9,9,9,9,'QUE','DOC','USER','2024-07-12 02:21:08.812','{\"pages\": \"20\", \"size\": \"3MB\"}','MEROK'),(10,10,10,10,'QUE','IMG','USER','2024-07-12 02:21:08.812','{\"resolution\": \"320x240\", \"size\": \"100KB\"}','MEROK');
/*!40000 ALTER TABLE `media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `fid_media` int DEFAULT NULL,
  `user_status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'PC',
  `user_level` int NOT NULL DEFAULT '0',
  `user_username` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_gender` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'M',
  `user_dob` datetime(3) DEFAULT NULL,
  `user_city` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_state` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_postal` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_country` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_latitude` double NOT NULL DEFAULT '0',
  `user_longitude` double NOT NULL DEFAULT '0',
  `user_joined` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `user_login` datetime(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
  `user_bio` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  UNIQUE KEY `users_user_username_key` (`user_username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,8,'PC',0,'john_doe','Male','1985-06-15 00:00:00.000','New York','NY','10001','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for John Doe'),(2,7,'PC',1,'jane_doe','Female','1990-08-25 00:00:00.000','Los Angeles','CA','90001','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Jane Doe'),(3,6,'AC',0,'alice_smith','Female','1988-02-10 00:00:00.000','Chicago','IL','60601','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Alice Smith'),(4,7,'PC',2,'bob_jones','Non-binary','1992-12-05 00:00:00.000','Houston','TX','77001','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Bob Jones'),(5,3,'PC',1,'charlie_brown','Male','1985-04-20 00:00:00.000','Phoenix','AZ','85001','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Charlie Brown'),(6,10,'AC',3,'david_clark','Male','1995-11-30 00:00:00.000','Philadelphia','PA','19107','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for David Clark'),(7,8,'PC',0,'eve_adams','Trans','1987-07-19 00:00:00.000','San Antonio','TX','78201','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Eve Adams'),(8,2,'PC',2,'frank_thomas','Male','1991-05-27 00:00:00.000','San Diego','CA','92101','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Frank Thomas'),(9,3,'PC',1,'grace_lee','Female','1993-03-14 00:00:00.000','Dallas','TX','75201','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Grace Lee'),(10,7,'AC',0,'henry_miller','Male','1989-09-09 00:00:00.000','San Jose','CA','95101','USA',0,0,'2024-07-12 02:21:05.175','2024-07-12 02:21:05.175','Bio for Henry Miller');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-11 21:24:54
