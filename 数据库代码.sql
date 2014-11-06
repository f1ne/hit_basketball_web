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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allgametable`
--

LOCK TABLES `allgametable` WRITE;
/*!40000 ALTER TABLE `allgametable` DISABLE KEYS */;
INSERT INTO `allgametable` VALUES (4,201201,201204,'2014-10-28'),(5,201204,201201,'2014-10-28'),(6,201201,201204,'2014-10-29'),(7,201201,201204,'2014-10-29'),(8,201201,201204,'2014-10-30'),(9,201201,201204,'2014-10-30'),(10,201201,201204,'2014-11-05'),(11,201201,201204,'2014-11-06');
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
INSERT INTO `gametable20141105_201201_201204` VALUES (1,'score','2014-11-05 21:42:16'),(1,'score','2014-11-05 21:42:17'),(1,'score','2014-11-05 21:42:17'),(5,'score','2014-11-05 21:42:17'),(5,'score','2014-11-05 21:42:18'),(5,'foul','2014-11-05 21:42:18'),(7,'score','2014-11-05 21:42:20'),(7,'foul','2014-11-05 21:42:20'),(2,'score','2014-11-05 21:42:21'),(2,'foul','2014-11-05 21:42:22'),(6,'foul','2014-11-05 21:42:22'),(6,'score','2014-11-05 21:42:23');
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
INSERT INTO `gametable20141106_201201_201204` VALUES (1,'score','2014-11-06 12:30:16'),(1,'score','2014-11-06 12:30:17'),(5,'score','2014-11-06 12:30:18'),(5,'score','2014-11-06 12:30:18'),(7,'score','2014-11-06 12:30:19'),(7,'score','2014-11-06 12:30:19'),(2,'foul','2014-11-06 12:30:21'),(6,'foul','2014-11-06 12:30:21'),(2,'score','2014-11-06 12:30:23'),(2,'score','2014-11-06 12:30:23'),(6,'score','2014-11-06 12:34:34'),(6,'score','2014-11-06 12:34:34'),(6,'score','2014-11-06 12:34:34'),(6,'score','2014-11-06 12:34:35'),(6,'score','2014-11-06 12:34:35'),(1,'foul','2014-11-06 13:19:59'),(5,'foul','2014-11-06 13:19:59'),(7,'foul','2014-11-06 13:20:01');
/*!40000 ALTER TABLE `gametable20141106_201201_201204` ENABLE KEYS */;
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
INSERT INTO `manager` VALUES (123,'123','123','1总管理员'),(213,'213','213','3裁判'),(231,'231','231','4队伍管理员'),(321,'321','321','2副管理员'),(4321,'2号','4321','2副管理员'),(1120310701,'测试员1号','123','1总管理员');
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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'222'),(2,'2014-12-31 有比赛'),(3,'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！'),(4,'123213'),(5,'3123123'),(6,'2014年11月6日下午4：00    于   篮球场  10号场地  进行   201201（12级智能接口与人机交互研究中心）    迎战   201204（12级计算机网络与信息安全技术研究中心） 。'),(7,'2014年11月6日下午4：00 于 篮球场 10号场地  由 201201  迎战  201204。');
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,201201,'2','Lin','男','1123710501',17,'PG控球后卫',0,0,0),(2,201204,'猛','Kobe','男','1123710502',24,'SG得分后卫',0,0,0),(5,201201,'2','陈晨','男','1120310707',21,'SF小前锋',0,0,0),(6,201204,'猛','刘甜','女','1120311111',54,'SG得分后卫',0,0,0),(7,201201,'2','哈','男','1120111111',312,'SF小前锋',0,0,0),(12,201502,'F1ne','pe','男','1121231231',42,'PG控球后卫',0,0,0),(13,201502,'F1ne','pp','男','1321232142',53,'CC中锋',0,0,0),(15,201502,'F1ne','Linda2','男','1120310708',32,'PF大前锋',0,0,0);
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
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
INSERT INTO `team` VALUES ('201201','2','1201','智能接口与人机交互研究中心'),('201204','猛','1204','计算机网络与信息安全技术研究中心'),('201209','大','1209','模式识别研究中心'),('201212','工','1212','信息对抗技术研究所'),('201301','哈','1301','智能接口与人机交互研究中心'),('201401','蓝','1401','智能接口与人机交互研究中心'),('201502','F1ne','123','语言技术研究中心');
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

-- Dump completed on 2014-11-06 13:22:36
