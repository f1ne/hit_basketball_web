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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allgametable`
--

LOCK TABLES `allgametable` WRITE;
/*!40000 ALTER TABLE `allgametable` DISABLE KEYS */;
/*!40000 ALTER TABLE `allgametable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141027_1_2`
--

DROP TABLE IF EXISTS `gametable20141027_1_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141027_1_2` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141027_1_2`
--

LOCK TABLES `gametable20141027_1_2` WRITE;
/*!40000 ALTER TABLE `gametable20141027_1_2` DISABLE KEYS */;
INSERT INTO `gametable20141027_1_2` VALUES (1,'score','2014-10-27 17:09:44'),(1,'foul','2014-10-27 17:09:46'),(2,'score','2014-10-27 17:09:47'),(6,'score','2014-10-27 17:09:48'),(6,'foul','2014-10-27 17:09:48'),(2,'foul','2014-10-27 17:09:49'),(1,'score','2014-10-27 18:15:13'),(1,'foul','2014-10-27 18:15:14'),(1,'score','2014-10-27 18:15:15'),(1,'score','2014-10-27 18:15:15'),(1,'foul','2014-10-27 18:15:16'),(2,'score','2014-10-27 18:15:20'),(2,'foul','2014-10-27 18:15:20'),(6,'score','2014-10-27 18:15:21'),(6,'foul','2014-10-27 18:15:22'),(6,'foul','2014-10-27 18:15:22'),(6,'score','2014-10-27 18:15:23'),(6,'score','2014-10-27 18:15:25'),(2,'score','2014-10-27 18:15:26'),(2,'score','2014-10-27 18:15:28'),(2,'score','2014-10-27 18:15:29');
/*!40000 ALTER TABLE `gametable20141027_1_2` ENABLE KEYS */;
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
INSERT INTO `manager` VALUES (21,'21','21','1总管理员'),(33,'33','33','3裁判'),(65,'45','65','1总管理员'),(123,'123123','123123','1总管理员'),(321,'321','312','1总管理员'),(323,'2323','2323','1总管理员'),(1123,'123','123','2副管理员'),(2131,'21312','12312','3裁判'),(5435,'45345','345345','1总管理员'),(12312,'31','2134124','5待定'),(123321,'123321','123321','4队伍管理员'),(12312312,'3123','31231','1总管理员');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,1,NULL,'Lin','男','1123710501',17,'PG控球后卫',0,0,0),(2,2,NULL,'Kobe','男','1123710502',24,'SG得分后卫',0,0,0),(5,7,'7','陈晨','男','1120310707',21,'SF小前锋',0,0,0),(6,2,'二队','刘甜','女','1120311111',54,'SG得分后卫',0,0,0);
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
INSERT INTO `team` VALUES ('','','','智能接口与人机交互研究中心'),('1','一队','111111','哈'),('1204','猛','123','计算机网络与信息安全技术研究中心'),('1212','1212','1212','智能接口与人机交互研究中心'),('1304','321','321','计算机网络与信息安全技术研究中心'),('2','二队','222222','工'),('2121','2121','2121','智能接口与人机交互研究中心'),('21312','123','12312','信息对抗技术研究所'),('3','三队','333333','大'),('33','3','3','模式识别研究中心'),('4','4','4','1'),('43','43','43','智能接口与人机交互研究中心'),('5','5','5','2'),('6','6','6','4'),('7','7','7','1');
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

-- Dump completed on 2014-10-27 18:31:26
