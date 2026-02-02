-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: myproject
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `course`
--

DROP TABLE IF EXISTS `course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `course` (
  `cid` int NOT NULL AUTO_INCREMENT,
  `coursename` varchar(225) DEFAULT NULL,
  `courseduration` varchar(225) DEFAULT NULL,
  `coursefee` int DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `cdesc` varchar(225) DEFAULT NULL,
  `courseimg` varchar(225) DEFAULT NULL,
  `pdfname` varchar(225) DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `userId_idx` (`userId`),
  CONSTRAINT `userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course`
--

LOCK TABLES `course` WRITE;
/*!40000 ALTER TABLE `course` DISABLE KEYS */;
INSERT INTO `course` VALUES (2,'mysql','12 Months',555,'Comming Soon','good','0224c280-2517-4451-a496-7ac221880157_1745857104438.png','f3ba2dd8-b8e0-47b3-bd4f-616ff2ea36fe_1745515260925.pdf',8),(4,'angular','3 Months',999,'Comming Soon','good','4d6a3a60-8019-430f-b01e-4173898ae3af_1745595755633.png','d0886fca-ef78-4bd8-bbdd-cba87fc1ff3b_1745595755646.pdf',8),(5,'react','3 Months',999,'started','good','f446ec12-20b4-4ddf-b663-dd6137ac1a9c_1745595819837.png','f3ef3010-a444-4f1b-9cee-baf963a0721d_1745595819837.pdf',8),(8,'python','3 Months',999,'Comming Soon','good','43336920-6eb9-460a-b152-20eefe158152_1745942226645.png','dde7e041-2d7d-4814-a87b-b8f71f206718_1745942226659.pdf',8),(9,'nodejs','3 Months',999,'Currently Not Available','vgood','92758614-b007-434d-a920-e4c1c3454a88_1745942262268.png','190aaeba-ce6e-4a51-a829-5cedcdd83b10_1745942262269.pdf',8);
/*!40000 ALTER TABLE `course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enrollment`
--

DROP TABLE IF EXISTS `enrollment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enrollment` (
  `enrollid` int NOT NULL AUTO_INCREMENT,
  `myuserid` int DEFAULT NULL,
  `mycourseid` int DEFAULT NULL,
  PRIMARY KEY (`enrollid`),
  KEY `myuserid_idx` (`myuserid`),
  KEY `mycourseid` (`mycourseid`),
  CONSTRAINT `mycourseid` FOREIGN KEY (`mycourseid`) REFERENCES `course` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `myuserid` FOREIGN KEY (`myuserid`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enrollment`
--

LOCK TABLES `enrollment` WRITE;
/*!40000 ALTER TABLE `enrollment` DISABLE KEYS */;
INSERT INTO `enrollment` VALUES (2,9,4),(3,9,4),(4,9,9),(5,9,5),(8,10,5),(11,11,4),(12,11,2),(14,1,4),(15,1,8);
/*!40000 ALTER TABLE `enrollment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `job`
--

DROP TABLE IF EXISTS `job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `job` (
  `jobid` int NOT NULL AUTO_INCREMENT,
  `title` varchar(225) DEFAULT NULL,
  `jobdesc` varchar(225) DEFAULT NULL,
  `cat` varchar(225) DEFAULT NULL,
  `status` varchar(225) DEFAULT NULL,
  `location` varchar(225) DEFAULT NULL,
  `postdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`jobid`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `job`
--

LOCK TABLES `job` WRITE;
/*!40000 ALTER TABLE `job` DISABLE KEYS */;
INSERT INTO `job` VALUES (4,'java developer','must need core java,adv java jsp servlet','IT','active','pune','2025-05-06 16:03:28'),(5,'python developer','cdhd.;oshsdnsdsnjsgsgsdg','IT','active','bengaluru','2025-05-06 16:33:44'),(6,'BA','fsdhfkjdbnfbsljg bjgsgsggfdgfdg','NON-IT','active','pune','2025-05-06 16:33:58'),(7,'tester','sdslfhkjnkjsdflsjdfsdfdsfssga','IT','active','bengaluru','2025-05-06 16:34:12'),(8,'ui/ux','fddgfdgdfgdfg','IT','inactive','hyderabad','2025-05-06 16:34:22');
/*!40000 ALTER TABLE `job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobapplication`
--

DROP TABLE IF EXISTS `jobapplication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobapplication` (
  `appid` int NOT NULL AUTO_INCREMENT,
  `userId` int DEFAULT NULL,
  `jobId` int DEFAULT NULL,
  `appdate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`appid`),
  KEY `jobid_fk_idx` (`jobId`),
  KEY `userid_fk_idx` (`userId`),
  CONSTRAINT `jobid_fk` FOREIGN KEY (`jobId`) REFERENCES `job` (`jobid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `userid_fk` FOREIGN KEY (`userId`) REFERENCES `user` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobapplication`
--

LOCK TABLES `jobapplication` WRITE;
/*!40000 ALTER TABLE `jobapplication` DISABLE KEYS */;
INSERT INTO `jobapplication` VALUES (1,10,4,'2025-05-06 16:32:45'),(2,10,4,'2025-05-06 16:35:19'),(3,10,8,'2025-05-06 16:42:30'),(4,9,8,'2025-05-06 16:43:12'),(5,9,5,'2025-05-06 16:43:28'),(6,8,8,'2025-05-07 15:31:47'),(7,9,6,'2025-05-07 16:31:27'),(8,9,4,'2025-05-07 16:31:35'),(9,10,6,'2025-05-07 16:31:45'),(10,10,7,'2025-05-07 16:31:47'),(11,10,5,'2025-05-07 16:31:49'),(12,11,7,'2025-05-07 16:32:12'),(13,11,6,'2025-05-07 16:32:13'),(14,11,4,'2025-05-07 16:32:16'),(15,12,7,'2025-05-09 16:01:09'),(16,12,5,'2025-05-09 16:01:15'),(17,12,4,'2025-05-09 16:01:18');
/*!40000 ALTER TABLE `jobapplication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `userid` int NOT NULL AUTO_INCREMENT,
  `fname` varchar(225) DEFAULT NULL,
  `lname` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `role` varchar(45) DEFAULT NULL,
  `pass` varchar(45) DEFAULT NULL,
  `imagename` varchar(225) DEFAULT NULL,
  `mobno` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'aaaaaa','bbbbb','aaaa@g.com','normal','123','2.png','111'),(3,'karan mp','kumar','kk@g.com','normal','123','karan.png','9194565'),(4,'karanup','singh','kkk@g.com','normal','3333','karan.png','9194565'),(5,'karannnnnn','kkkk','kkkkk@g.com','normal','121','karan.pngd5fb0bc7-7d58-4671-9d0f-b3d2229c6562_1745078613854.png','111'),(6,'karannnnnnkkkkkk','kkkkkkkkk','kkssssskkk@g.com','normal','123','karan.png0763e8fa-e88d-41e4-9fd9-9356fc5d6c5a_1745078652505.png','111'),(7,'karannnnnnkkkkkk','kkkkkkkkk','kkssaaaassskkk@g.com','normal','','08367f71-9e0f-4687-b51e-a68c36bb7457_1745078851295.png','111'),(8,'admin','singh','admin@g.com','admin','123456','6a7ec8f2-4afd-4e99-a626-91ec911a8807_1745250603515.png','111'),(9,'ajit','kumar','ajit@g.com','normal','123','0dffd663-3f83-43dd-a3f8-ef392037e4b1_1745338946280.png','9194565'),(10,'romee','kumar','romee@g.com','normal','123','1bd6a0a7-5c8f-4541-882e-8164e86b4805_1745339484202.png','9194565'),(11,'pratik','singh','p@g.com','normal','123','6ee70865-139f-4ab3-9d7e-51296b2fdd7a_1746204552062.png','444444'),(12,'arun','singh','a@g.com','normal','123','743f1e8c-5f0f-42a7-b931-8ad652832306_1746806442724.png','5656565655');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-10  8:11:22
