CREATE DATABASE  IF NOT EXISTS `db` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: db
-- ------------------------------------------------------
-- Server version	5.7.3-m13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allgametable`
--

DROP TABLE IF EXISTS `allgametable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `allgametable` (
  `GameID` int(11) NOT NULL AUTO_INCREMENT,
  `HomeTeamID` int(11) DEFAULT NULL,
  `AwayTeamID` int(11) DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allgametable`
--

LOCK TABLES `allgametable` WRITE;
/*!40000 ALTER TABLE `allgametable` DISABLE KEYS */;
INSERT INTO `allgametable` VALUES (4,201201,201204,'2014-10-28'),(5,201204,201201,'2014-10-28'),(6,201201,201204,'2014-10-29'),(7,201201,201204,'2014-10-29'),(8,201201,201204,'2014-10-30'),(9,201201,201204,'2014-10-30'),(10,1,2,'2014-11-05'),(11,201201,201204,'2014-11-05'),(12,201201,201204,'2014-11-06'),(13,201201,201502,'2014-11-06'),(14,0,0,'2014-11-06'),(15,201601,201602,'2014-11-06'),(16,201201,201707,'2014-11-06'),(18,201601,201602,'2014-11-11'),(19,201201,201204,'2014-11-13');
/*!40000 ALTER TABLE `allgametable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141028_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141028_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141028_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141028_201201_201204`
--

LOCK TABLES `gametable20141028_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141028_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141028_201201_201204` VALUES (1,'score','2014-10-28 20:18:20'),(1,'score','2014-10-28 20:18:21'),(5,'score','2014-10-28 20:18:21'),(5,'score','2014-10-28 20:18:22'),(7,'score','2014-10-28 20:18:22'),(7,'score','2014-10-28 20:18:22'),(1,'foul','2014-10-28 20:18:23'),(5,'foul','2014-10-28 20:18:24'),(7,'foul','2014-10-28 20:18:24'),(2,'score','2014-10-28 20:18:25'),(2,'score','2014-10-28 20:18:25'),(6,'score','2014-10-28 20:18:26'),(6,'score','2014-10-28 20:18:26'),(2,'foul','2014-10-28 20:18:26'),(6,'foul','2014-10-28 20:18:27');
/*!40000 ALTER TABLE `gametable20141028_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141028_201204_201201`
--

DROP TABLE IF EXISTS `gametable20141028_201204_201201`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141028_201204_201201` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141028_201204_201201`
--

LOCK TABLES `gametable20141028_201204_201201` WRITE;
/*!40000 ALTER TABLE `gametable20141028_201204_201201` DISABLE KEYS */;
INSERT INTO `gametable20141028_201204_201201` VALUES (2,'score','2014-10-28 20:19:31'),(6,'score','2014-10-28 20:19:31'),(2,'foul','2014-10-28 20:19:32'),(6,'foul','2014-10-28 20:19:32'),(1,'score','2014-10-28 20:19:33'),(5,'score','2014-10-28 20:19:33'),(7,'score','2014-10-28 20:19:33'),(7,'foul','2014-10-28 20:19:34'),(5,'foul','2014-10-28 20:19:34'),(1,'foul','2014-10-28 20:19:34');
/*!40000 ALTER TABLE `gametable20141028_201204_201201` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141029_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141029_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141029_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141029_201201_201204`
--

LOCK TABLES `gametable20141029_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141029_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141029_201201_201204` VALUES (1,'score','2014-10-29 13:49:52'),(1,'score','2014-10-29 13:49:52'),(5,'score','2014-10-29 13:49:57'),(5,'score','2014-10-29 13:49:57'),(5,'foul','2014-10-29 13:49:57'),(5,'foul','2014-10-29 13:49:57'),(7,'score','2014-10-29 13:49:58'),(7,'foul','2014-10-29 13:49:58'),(7,'foul','2014-10-29 13:49:59'),(7,'score','2014-10-29 13:49:59'),(2,'score','2014-10-29 13:50:00'),(2,'score','2014-10-29 13:50:01'),(1,'score','2014-10-29 18:25:30'),(1,'score','2014-10-29 18:25:31'),(5,'score','2014-10-29 18:25:31'),(5,'score','2014-10-29 18:25:32'),(5,'score','2014-10-29 18:25:32'),(5,'score','2014-10-29 18:25:32'),(7,'score','2014-10-29 18:25:33'),(7,'score','2014-10-29 18:25:33'),(7,'score','2014-10-29 18:25:33'),(2,'score','2014-10-29 18:25:34'),(2,'score','2014-10-29 18:25:34'),(6,'score','2014-10-29 18:25:35'),(6,'score','2014-10-29 18:25:35'),(6,'score','2014-10-29 18:25:35');
/*!40000 ALTER TABLE `gametable20141029_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141030_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141030_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141030_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141030_201201_201204`
--

LOCK TABLES `gametable20141030_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141030_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141030_201201_201204` VALUES (1,'score','2014-10-30 16:16:57'),(1,'score','2014-10-30 17:05:36'),(1,'foul','2014-10-30 17:05:37'),(5,'foul','2014-10-30 17:05:37'),(7,'foul','2014-10-30 17:05:37'),(7,'foul','2014-10-30 17:05:38'),(2,'score','2014-10-30 17:05:38'),(2,'score','2014-10-30 17:05:39'),(2,'score','2014-10-30 17:05:39');
/*!40000 ALTER TABLE `gametable20141030_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141105_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141105_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141105_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141105_201201_201204`
--

LOCK TABLES `gametable20141105_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141105_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141105_201201_201204` VALUES (1,'score','2014-11-05 21:40:12'),(1,'score','2014-11-05 21:44:03'),(1,'foul','2014-11-05 21:44:25'),(5,'foul','2014-11-05 21:44:26'),(5,'score','2014-11-05 21:44:26'),(1,'score','2014-11-05 21:55:42'),(7,'score','2014-11-05 21:55:44'),(7,'foul','2014-11-05 21:55:45'),(6,'score','2014-11-05 21:55:46'),(6,'foul','2014-11-05 21:55:46'),(2,'foul','2014-11-05 21:55:47'),(2,'score','2014-11-05 21:55:47'),(2,'foul','2014-11-05 21:55:48'),(6,'foul','2014-11-05 21:55:48'),(6,'score','2014-11-05 21:55:49'),(5,'foul','2014-11-05 23:48:11'),(7,'foul','2014-11-05 23:48:12'),(7,'score','2014-11-05 23:48:13'),(2,'score','2014-11-05 23:49:32'),(2,'score','2014-11-05 23:49:32'),(2,'score','2014-11-05 23:49:32'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:33'),(2,'score','2014-11-05 23:49:34'),(2,'score','2014-11-05 23:49:34'),(2,'score','2014-11-05 23:49:34'),(2,'score','2014-11-05 23:49:34'),(2,'score','2014-11-05 23:49:34'),(1,'score','2014-11-05 23:53:11'),(5,'score','2014-11-05 23:53:11'),(7,'score','2014-11-05 23:53:12'),(7,'foul','2014-11-05 23:53:12'),(7,'foul','2014-11-05 23:53:13'),(7,'foul','2014-11-05 23:53:14');
/*!40000 ALTER TABLE `gametable20141105_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141106_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141106_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141106_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141106_201201_201204`
--

LOCK TABLES `gametable20141106_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141106_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141106_201201_201204` VALUES (1,'score','2014-11-06 00:13:29'),(5,'score','2014-11-06 00:13:30'),(7,'score','2014-11-06 00:13:30'),(7,'foul','2014-11-06 00:13:31'),(5,'foul','2014-11-06 00:13:31'),(1,'foul','2014-11-06 00:13:32'),(5,'foul','2014-11-06 00:13:32'),(7,'foul','2014-11-06 00:13:32'),(1,'score','2014-11-06 00:19:50'),(5,'score','2014-11-06 00:19:51'),(5,'foul','2014-11-06 00:19:51'),(7,'foul','2014-11-06 00:19:52'),(7,'score','2014-11-06 00:19:53'),(7,'score','2014-11-06 00:19:54'),(5,'score','2014-11-06 00:19:58'),(1,'score','2014-11-06 00:32:22'),(5,'score','2014-11-06 00:32:23'),(5,'foul','2014-11-06 00:32:24'),(2,'score','2014-11-06 00:36:31'),(6,'score','2014-11-06 00:36:32'),(6,'foul','2014-11-06 00:36:35'),(6,'score','2014-11-06 00:36:36'),(2,'score','2014-11-06 00:36:39'),(1,'score','2014-11-06 00:40:58'),(1,'score','2014-11-06 00:40:59'),(1,'score','2014-11-06 00:41:00'),(5,'score','2014-11-06 00:41:01'),(5,'score','2014-11-06 00:41:03'),(7,'score','2014-11-06 00:41:04'),(7,'score','2014-11-06 00:41:05'),(6,'score','2014-11-06 00:41:06'),(6,'score','2014-11-06 00:41:06'),(2,'score','2014-11-06 00:41:08'),(2,'score','2014-11-06 00:41:08'),(6,'score','2014-11-06 00:41:09'),(1,'score','2014-11-06 00:41:10'),(5,'score','2014-11-06 00:41:11'),(7,'score','2014-11-06 00:41:12'),(2,'score','2014-11-06 00:41:13'),(2,'score','2014-11-06 00:41:15'),(1,'score','2014-11-06 00:41:18'),(1,'score','2014-11-06 00:42:04'),(5,'score','2014-11-06 00:42:08'),(7,'score','2014-11-06 00:42:09'),(7,'score','2014-11-06 00:42:11'),(7,'score','2014-11-06 00:42:12'),(7,'score','2014-11-06 00:42:13'),(7,'score','2014-11-06 00:42:14'),(6,'score','2014-11-06 00:42:15'),(6,'score','2014-11-06 00:42:16'),(6,'score','2014-11-06 00:42:17'),(7,'score','2014-11-06 00:53:30'),(5,'score','2014-11-06 00:53:33'),(2,'score','2014-11-06 00:53:35'),(6,'score','2014-11-06 00:53:36'),(6,'score','2014-11-06 00:57:11'),(6,'foul','2014-11-06 00:57:13'),(6,'foul','2014-11-06 00:57:14'),(2,'score','2014-11-06 00:57:16'),(2,'score','2014-11-06 00:57:17'),(2,'foul','2014-11-06 00:57:18'),(2,'foul','2014-11-06 00:57:19'),(2,'foul','2014-11-06 00:57:20'),(2,'score','2014-11-06 00:57:22'),(2,'score','2014-11-06 00:57:22'),(2,'score','2014-11-06 00:57:22'),(2,'score','2014-11-06 00:57:23'),(2,'score','2014-11-06 00:57:23'),(2,'score','2014-11-06 00:57:23'),(2,'score','2014-11-06 00:57:23'),(2,'score','2014-11-06 00:57:24'),(1,'score','2014-11-06 00:59:50'),(5,'score','2014-11-06 00:59:52'),(1,'score','2014-11-06 01:02:45'),(1,'score','2014-11-06 01:08:53'),(1,'score','2014-11-06 01:08:54'),(1,'score','2014-11-06 01:08:54'),(1,'foul','2014-11-06 01:09:01'),(1,'foul','2014-11-06 01:09:01'),(1,'foul','2014-11-06 01:09:01'),(1,'foul','2014-11-06 01:09:01'),(1,'foul','2014-11-06 01:09:01'),(1,'score','2014-11-06 12:35:04'),(1,'score','2014-11-06 12:35:04'),(2,'score','2014-11-06 12:35:21'),(2,'score','2014-11-06 12:35:21'),(2,'score','2014-11-06 12:35:21'),(2,'score','2014-11-06 12:35:22');
/*!40000 ALTER TABLE `gametable20141106_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141106_201201_201502`
--

DROP TABLE IF EXISTS `gametable20141106_201201_201502`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141106_201201_201502` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141106_201201_201502`
--

LOCK TABLES `gametable20141106_201201_201502` WRITE;
/*!40000 ALTER TABLE `gametable20141106_201201_201502` DISABLE KEYS */;
INSERT INTO `gametable20141106_201201_201502` VALUES (8,'score','2014-11-06 16:19:05'),(8,'score','2014-11-06 16:19:05'),(8,'score','2014-11-06 16:19:06'),(8,'score','2014-11-06 16:19:06'),(8,'score','2014-11-06 16:19:06'),(8,'score','2014-11-06 16:19:07'),(8,'foul','2014-11-06 16:19:07'),(8,'foul','2014-11-06 16:19:07'),(8,'score','2014-11-06 16:19:46'),(8,'score','2014-11-06 16:19:46'),(8,'score','2014-11-06 16:19:46'),(8,'score','2014-11-06 16:19:46'),(8,'score','2014-11-06 16:19:47'),(8,'score','2014-11-06 16:19:47'),(8,'score','2014-11-06 16:19:48'),(8,'score','2014-11-06 16:19:48'),(8,'score','2014-11-06 16:19:49'),(8,'score','2014-11-06 16:19:49'),(8,'score','2014-11-06 16:19:49'),(8,'score','2014-11-06 16:19:49'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:50'),(8,'score','2014-11-06 16:19:51'),(8,'score','2014-11-06 16:19:51'),(8,'score','2014-11-06 16:19:51'),(8,'score','2014-11-06 16:19:51'),(8,'score','2014-11-06 16:19:52'),(8,'score','2014-11-06 16:19:52'),(8,'score','2014-11-06 16:19:52'),(8,'score','2014-11-06 16:19:52'),(8,'score','2014-11-06 16:19:52'),(8,'score','2014-11-06 16:19:53'),(8,'score','2014-11-06 16:19:53'),(8,'score','2014-11-06 16:19:53'),(8,'score','2014-11-06 16:19:53'),(8,'score','2014-11-06 16:19:53'),(8,'score','2014-11-06 16:19:54'),(8,'score','2014-11-06 16:19:54'),(8,'score','2014-11-06 16:19:54'),(8,'score','2014-11-06 16:19:54'),(8,'score','2014-11-06 16:19:55'),(8,'score','2014-11-06 16:19:55'),(8,'score','2014-11-06 16:19:55'),(8,'score','2014-11-06 16:19:55'),(8,'score','2014-11-06 16:19:55'),(8,'score','2014-11-06 16:19:56'),(8,'score','2014-11-06 16:19:56'),(8,'score','2014-11-06 16:19:56'),(8,'score','2014-11-06 16:19:56'),(8,'score','2014-11-06 16:19:57'),(8,'score','2014-11-06 16:19:57'),(8,'score','2014-11-06 16:19:57'),(8,'score','2014-11-06 16:19:57'),(8,'score','2014-11-06 16:19:57'),(8,'score','2014-11-06 16:19:58'),(8,'score','2014-11-06 16:19:58'),(8,'score','2014-11-06 16:19:58'),(8,'score','2014-11-06 16:19:58'),(8,'score','2014-11-06 16:19:59'),(8,'score','2014-11-06 16:19:59'),(8,'score','2014-11-06 16:19:59'),(8,'score','2014-11-06 16:19:59'),(8,'score','2014-11-06 16:19:59'),(8,'score','2014-11-06 16:20:00'),(8,'score','2014-11-06 16:20:57'),(8,'score','2014-11-06 16:20:57'),(8,'score','2014-11-06 16:20:57'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:58'),(8,'score','2014-11-06 16:20:59'),(8,'score','2014-11-06 16:20:59'),(8,'score','2014-11-06 16:20:59'),(8,'score','2014-11-06 16:20:59'),(8,'score','2014-11-06 16:21:04');
/*!40000 ALTER TABLE `gametable20141106_201201_201502` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141106_201201_201707`
--

DROP TABLE IF EXISTS `gametable20141106_201201_201707`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141106_201201_201707` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141106_201201_201707`
--

LOCK TABLES `gametable20141106_201201_201707` WRITE;
/*!40000 ALTER TABLE `gametable20141106_201201_201707` DISABLE KEYS */;
INSERT INTO `gametable20141106_201201_201707` VALUES (21,'score','2014-11-06 16:54:37'),(21,'score','2014-11-06 16:54:37'),(21,'score','2014-11-06 16:54:38'),(21,'score','2014-11-06 16:54:38'),(21,'score','2014-11-06 16:54:39'),(21,'score','2014-11-06 16:54:41'),(21,'score','2014-11-06 16:54:42'),(21,'score','2014-11-06 16:54:42'),(21,'score','2014-11-06 16:54:42'),(21,'score','2014-11-06 16:54:43'),(21,'score','2014-11-06 16:54:43'),(21,'score','2014-11-06 16:54:43'),(21,'foul','2014-11-06 16:54:44'),(21,'foul','2014-11-06 16:54:44'),(21,'foul','2014-11-06 16:54:44'),(1,'score','2014-11-06 16:54:45'),(1,'score','2014-11-06 16:54:45'),(5,'score','2014-11-06 16:54:45'),(7,'score','2014-11-06 16:54:46');
/*!40000 ALTER TABLE `gametable20141106_201201_201707` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141106_201601_201602`
--

DROP TABLE IF EXISTS `gametable20141106_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141106_201601_201602` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141106_201601_201602`
--

LOCK TABLES `gametable20141106_201601_201602` WRITE;
/*!40000 ALTER TABLE `gametable20141106_201601_201602` DISABLE KEYS */;
INSERT INTO `gametable20141106_201601_201602` VALUES (9,'score','2014-11-06 16:55:08'),(9,'score','2014-11-06 16:55:08'),(9,'score','2014-11-06 16:55:08'),(10,'score','2014-11-06 16:55:09'),(10,'score','2014-11-06 16:55:09'),(12,'score','2014-11-06 16:55:10'),(12,'score','2014-11-06 16:55:10'),(12,'score','2014-11-06 16:55:10'),(13,'score','2014-11-06 16:55:10'),(14,'score','2014-11-06 16:55:11'),(14,'score','2014-11-06 16:55:11'),(15,'score','2014-11-06 16:55:42'),(15,'score','2014-11-06 16:55:42'),(15,'score','2014-11-06 16:55:42'),(15,'score','2014-11-06 16:55:42'),(15,'score','2014-11-06 16:55:42'),(16,'score','2014-11-06 16:55:43'),(16,'score','2014-11-06 16:55:43'),(16,'score','2014-11-06 16:55:43'),(18,'score','2014-11-06 16:55:47'),(18,'score','2014-11-06 16:55:47'),(18,'score','2014-11-06 16:55:47'),(18,'score','2014-11-06 16:55:47');
/*!40000 ALTER TABLE `gametable20141106_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141107_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141107_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141107_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141107_201201_201204`
--

LOCK TABLES `gametable20141107_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141107_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141107_201201_201204` VALUES (1,'score','2014-11-07 17:26:04'),(1,'score','2014-11-07 17:26:04'),(5,'score','2014-11-07 17:26:05'),(5,'score','2014-11-07 17:26:06'),(7,'score','2014-11-07 17:26:06'),(2,'score','2014-11-07 17:26:07'),(1,'foul','2014-11-07 17:26:09');
/*!40000 ALTER TABLE `gametable20141107_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141111_201601_201602`
--

DROP TABLE IF EXISTS `gametable20141111_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141111_201601_201602` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141111_201601_201602`
--

LOCK TABLES `gametable20141111_201601_201602` WRITE;
/*!40000 ALTER TABLE `gametable20141111_201601_201602` DISABLE KEYS */;
INSERT INTO `gametable20141111_201601_201602` VALUES (9,'Score','2014-11-11 22:57:48'),(9,'Fouls','2014-11-11 22:57:52'),(10,'Fouls','2014-11-11 22:57:56'),(10,'Score','2014-11-11 22:57:58'),(10,'Score','2014-11-11 22:58:00'),(10,'Score','2014-11-11 22:58:01'),(10,'Score','2014-11-11 22:58:02'),(10,'Score','2014-11-11 22:58:04'),(9,'Score','2014-11-11 22:58:05'),(9,'Score','2014-11-11 22:58:07'),(12,'Score','2014-11-11 22:58:10'),(12,'Score','2014-11-11 22:58:11'),(14,'Score','2014-11-11 22:58:24'),(14,'Score','2014-11-11 22:59:16'),(14,'Score','2014-11-11 22:59:17'),(14,'Score','2014-11-11 22:59:17'),(13,'Score','2014-11-11 23:00:19'),(13,'Score','2014-11-11 23:00:21'),(15,'Score','2014-11-11 23:00:23'),(15,'Score','2014-11-11 23:00:23'),(15,'Score','2014-11-11 23:00:24'),(15,'Score','2014-11-11 23:00:24'),(15,'Score','2014-11-11 23:00:24'),(15,'Score','2014-11-11 23:00:24'),(15,'Score','2014-11-11 23:00:24'),(15,'Score','2014-11-11 23:00:25'),(15,'Score','2014-11-11 23:00:25');
/*!40000 ALTER TABLE `gametable20141111_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141113_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141113_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141113_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141113_201201_201204`
--

LOCK TABLES `gametable20141113_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141113_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141113_201201_201204` VALUES (1,'Score','2014-11-13 14:32:23'),(1,'Score','2014-11-13 14:32:23'),(5,'Score','2014-11-13 14:32:24'),(5,'Score','2014-11-13 14:32:26'),(7,'Score','2014-11-13 14:32:26'),(7,'Score','2014-11-13 14:32:27'),(7,'Score','2014-11-13 14:32:29'),(7,'Score','2014-11-13 14:32:30'),(7,'Score','2014-11-13 14:32:30'),(2,'Score','2014-11-13 14:32:32'),(2,'Score','2014-11-13 14:32:32'),(2,'Score','2014-11-13 14:32:32'),(6,'Score','2014-11-13 14:32:33'),(6,'Score','2014-11-13 14:32:34'),(6,'Score','2014-11-13 14:32:34'),(6,'Score','2014-11-13 14:32:36');
/*!40000 ALTER TABLE `gametable20141113_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manager` (
  `ID` int(11) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `PSW` varchar(45) NOT NULL,
  `NPL` varchar(45) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES (66,'66','123','3裁判'),(123,'123','123','1总管理员'),(213,'213','213','3裁判'),(231,'231','231','4队伍管理员'),(321,'321','321','2副管理员'),(1120310701,'测试员1号','123','1总管理员');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `message` (
  `index` int(11) NOT NULL AUTO_INCREMENT,
  `IndexMessage` varchar(500) NOT NULL,
  PRIMARY KEY (`index`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'222'),(2,'2014-12-31 有比赛'),(3,'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！'),(4,'123213'),(5,'3123123'),(6,'ref24fr'),(7,'2013 '),(8,'的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇'),(9,''),(10,'213123123'),(11,'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\''),(12,'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\''),(13,'44'),(14,'2014-11-13 将由201401队伍迎战201304队伍！请大家多多支持！');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `players`
--

DROP TABLE IF EXISTS `players`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `players` (
  `PlayerID` int(11) NOT NULL AUTO_INCREMENT,
  `TeamID` int(6) DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Name` varchar(45) NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `Number` int(11) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Score` int(11) NOT NULL DEFAULT '0',
  `NumberOfMatches` int(11) NOT NULL DEFAULT '0',
  `Fouls` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `PlayerID_UNIQUE` (`PlayerID`),
  UNIQUE KEY `StudentID_UNIQUE` (`StudentID`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,201201,'2','Lin','男','1123710501',17,'PG控球后卫',0,0,0),(2,201204,'猛','Kobe','男','1123710502',24,'SG得分后卫',0,0,0),(5,201201,'2','陈晨','男','1120310707',21,'SF小前锋',0,0,0),(6,201204,'猛','刘甜','女','1120311111',54,'SG得分后卫',0,0,0),(7,201201,'2','哈','男','1120111111',312,'SF小前锋',0,0,0),(8,201502,'TT','李言路','男','1120310303',7,'CC中锋',0,0,0),(9,201601,'哈哈哈','赵','保密','1120310301',1,'SF小前锋',0,0,0),(10,201601,'哈哈哈','钱','保密','1120310302',2,'SF小前锋',0,0,0),(12,201601,'哈哈哈','孙','保密','1120310304',3,'PG控球后卫',0,0,0),(13,201601,'哈哈哈','李','保密','1120310305',4,'PG控球后卫',0,0,0),(14,201601,'哈哈哈','周','保密','1120310306',5,'CC中锋',0,0,0),(15,201602,'呵呵呵','吴','保密','1120310311',1,'PG控球后卫',0,0,0),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'CC中锋',0,0,0),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'SG得分后卫',0,0,0),(18,201602,'呵呵呵','张皓','男','1120310314',4,'PF大前锋',0,0,0),(19,201602,'呵呵呵','杜常辉','保密','1120310315',5,'CC中锋',0,0,0),(21,201707,'gdaf','1232','保密','1120310376',123,'SF小前锋',0,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141111_201601_201602`
--

DROP TABLE IF EXISTS `playerstable20141111_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141111_201601_201602` (
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `TeamID` int(6) DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Name` varchar(45) NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `Number` int(11) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Score` int(11) NOT NULL DEFAULT '0',
  `NumberOfMatches` int(11) NOT NULL DEFAULT '0',
  `Fouls` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141111_201601_201602`
--

LOCK TABLES `playerstable20141111_201601_201602` WRITE;
/*!40000 ALTER TABLE `playerstable20141111_201601_201602` DISABLE KEYS */;
INSERT INTO `playerstable20141111_201601_201602` VALUES (9,201601,'哈哈哈','赵','保密','1120310301',1,'SF小前锋',3,0,1),(10,201601,'哈哈哈','钱','保密','1120310302',2,'SF小前锋',5,0,1),(12,201601,'哈哈哈','孙','保密','1120310304',3,'PG控球后卫',2,0,0),(13,201601,'哈哈哈','李','保密','1120310305',4,'PG控球后卫',2,0,0),(14,201601,'哈哈哈','周','保密','1120310306',5,'CC中锋',4,0,0),(15,201602,'呵呵呵','吴','保密','1120310311',1,'PG控球后卫',9,0,0),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'CC中锋',0,0,0),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'SG得分后卫',0,0,0),(18,201602,'呵呵呵','张皓','男','1120310314',4,'PF大前锋',0,0,0),(19,201602,'呵呵呵','杜常辉','保密','1120310315',5,'CC中锋',0,0,0);
/*!40000 ALTER TABLE `playerstable20141111_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141113_201201_201204`
--

DROP TABLE IF EXISTS `playerstable20141113_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141113_201201_201204` (
  `PlayerID` int(11) NOT NULL DEFAULT '0',
  `TeamID` int(6) DEFAULT NULL,
  `Team` varchar(45) DEFAULT NULL,
  `Name` varchar(45) NOT NULL,
  `Sex` varchar(45) NOT NULL,
  `StudentID` varchar(45) NOT NULL,
  `Number` int(11) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Score` int(11) NOT NULL DEFAULT '0',
  `NumberOfMatches` int(11) NOT NULL DEFAULT '0',
  `Fouls` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141113_201201_201204`
--

LOCK TABLES `playerstable20141113_201201_201204` WRITE;
/*!40000 ALTER TABLE `playerstable20141113_201201_201204` DISABLE KEYS */;
INSERT INTO `playerstable20141113_201201_201204` VALUES (1,201201,'2','Lin','男','1123710501',17,'PG控球后卫',2,0,0),(2,201204,'猛','Kobe','男','1123710502',24,'SG得分后卫',3,0,0),(5,201201,'2','陈晨','男','1120310707',21,'SF小前锋',2,0,0),(6,201204,'猛','刘甜','女','1120311111',54,'SG得分后卫',4,0,0),(7,201201,'2','哈','男','1120111111',312,'SF小前锋',5,0,0);
/*!40000 ALTER TABLE `playerstable20141113_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `ID` varchar(6) NOT NULL,
  `Name` varchar(45) NOT NULL,
  `PSW` varchar(45) NOT NULL,
  `Lab` varchar(90) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TeamID_UNIQUE` (`ID`),
  UNIQUE KEY `Name_UNIQUE` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('201201','2','1201','智能接口与人机交互研究中心'),('201204','猛','1204','计算机网络与信息安全技术研究中心'),('201209','大','1209','模式识别研究中心'),('201212','工','1212','信息对抗技术研究所'),('201301','哈','1301','智能接口与人机交互研究中心'),('201401','蓝','1401','智能接口与人机交互研究中心'),('201502','TT','123','语言技术研究中心'),('201601','哈哈哈','123','智能接口与人机交互研究中心'),('201602','呵呵呵','123','语言技术研究中心'),('201707','gdaf','123','生物信息学研究中心');
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-11-13 15:10:46
