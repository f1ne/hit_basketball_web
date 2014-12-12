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
  `HomeScore` int(11) DEFAULT '0',
  `AwayScore` int(11) DEFAULT '0',
  `State` varchar(45) DEFAULT '未进行',
  PRIMARY KEY (`GameID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allgametable`
--

LOCK TABLES `allgametable` WRITE;
/*!40000 ALTER TABLE `allgametable` DISABLE KEYS */;
INSERT INTO `allgametable` VALUES (1,201201,201204,'2014-12-09',0,0,'0'),(4,201201,201204,'2014-12-10',0,0,'0'),(6,201201,201204,'2014-12-11',0,0,'1');
/*!40000 ALTER TABLE `allgametable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141123_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141123_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141123_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141123_201201_201204`
--

LOCK TABLES `gametable20141123_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141123_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141123_201201_201204` VALUES (1,'Score','2014-11-23 13:43:25'),(1,'Score','2014-11-23 13:43:26'),(1,'Score','2014-11-23 13:43:27'),(1,'Score','2014-11-23 13:43:27'),(1,'Score','2014-11-23 13:43:27'),(1,'Fouls','2014-11-23 13:43:28'),(1,'Fouls','2014-11-23 13:43:28'),(1,'Fouls','2014-11-23 13:43:29'),(6,'Score','2014-11-23 13:43:30'),(6,'Score','2014-11-23 13:43:30'),(6,'Score','2014-11-23 13:43:30'),(2,'Score','2014-11-23 13:43:31'),(2,'Score','2014-11-23 13:43:31'),(2,'Score','2014-11-23 13:43:31'),(2,'Score','2014-11-23 13:43:32'),(2,'Fouls','2014-11-23 13:43:32'),(5,'Score','2014-11-23 13:43:34'),(5,'Score','2014-11-23 13:43:34'),(7,'Score','2014-11-23 13:43:35'),(7,'Fouls','2014-11-23 13:43:36'),(1,'CancelFouls','2014-11-23 13:43:44'),(1,'Fouls','2014-11-23 13:43:45'),(1,'CancelScore','2014-11-23 13:43:46'),(1,'Score','2014-11-23 13:43:47'),(2,'Score','2014-11-23 13:44:25'),(2,'Score','2014-11-23 13:44:25'),(2,'Score','2014-11-23 13:44:26'),(2,'Score','2014-11-23 13:44:26'),(2,'Score','2014-11-23 13:44:26'),(2,'Score','2014-11-23 13:44:26'),(2,'Score','2014-11-23 13:44:26'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:27'),(2,'Score','2014-11-23 13:44:28'),(2,'Score','2014-11-23 13:44:28');
/*!40000 ALTER TABLE `gametable20141123_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141123_201601_201602`
--

DROP TABLE IF EXISTS `gametable20141123_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141123_201601_201602` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141123_201601_201602`
--

LOCK TABLES `gametable20141123_201601_201602` WRITE;
/*!40000 ALTER TABLE `gametable20141123_201601_201602` DISABLE KEYS */;
INSERT INTO `gametable20141123_201601_201602` VALUES (15,'Score','2014-11-23 11:52:30'),(15,'Score','2014-11-23 11:52:30'),(15,'Score','2014-11-23 11:52:32');
/*!40000 ALTER TABLE `gametable20141123_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141209_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141209_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141209_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141209_201201_201204`
--

LOCK TABLES `gametable20141209_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141209_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141209_201201_201204` VALUES (1,'Score','2014-12-09 15:11:52'),(1,'Score','2014-12-09 15:11:53'),(1,'Score','2014-12-09 15:11:54'),(1,'Fouls','2014-12-09 22:31:13'),(1,'Fouls','2014-12-09 22:31:15'),(1,'CancelScore','2014-12-09 22:31:15'),(1,'Fouls','2014-12-09 22:31:17'),(1,'CancelFouls','2014-12-09 22:31:20'),(1,'Fouls','2014-12-09 22:31:21'),(1,'CancelScore','2014-12-09 22:31:21'),(1,'Score','2014-12-09 22:31:22'),(1,'CancelScore','2014-12-09 22:31:22'),(1,'Score','2014-12-09 22:31:23'),(1,'CancelScore','2014-12-09 22:31:23'),(1,'Score','2014-12-09 22:31:24'),(1,'Score','2014-12-09 22:31:24'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:25'),(1,'Score','2014-12-09 22:31:26'),(1,'CancelScore','2014-12-09 22:31:26'),(1,'CancelScore','2014-12-09 22:31:27'),(1,'CancelScore','2014-12-09 22:31:27'),(1,'CancelScore','2014-12-09 22:31:27'),(1,'CancelScore','2014-12-09 22:31:27'),(1,'CancelScore','2014-12-09 22:31:27'),(1,'CancelFouls','2014-12-09 22:31:29'),(1,'Score','2014-12-09 22:31:30'),(1,'Score','2014-12-09 22:31:30'),(1,'Score','2014-12-09 22:31:31'),(1,'CancelFouls','2014-12-09 22:36:16'),(1,'CancelFouls','2014-12-09 22:36:17'),(1,'Fouls','2014-12-09 22:36:17');
/*!40000 ALTER TABLE `gametable20141209_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141210_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141210_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141210_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141210_201201_201204`
--

LOCK TABLES `gametable20141210_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141210_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141210_201201_201204` VALUES (1,'Fouls','2014-12-10 22:01:26'),(1,'Score','2014-12-10 22:01:28'),(1,'Score','2014-12-10 22:01:31'),(1,'Score','2014-12-10 22:01:32'),(1,'Score','2014-12-10 22:01:32'),(1,'Score','2014-12-10 22:01:33'),(1,'Score','2014-12-10 22:12:55'),(1,'Score','2014-12-10 22:12:56'),(1,'Score','2014-12-10 22:12:58');
/*!40000 ALTER TABLE `gametable20141210_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141210_201601_201602`
--

DROP TABLE IF EXISTS `gametable20141210_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141210_201601_201602` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141210_201601_201602`
--

LOCK TABLES `gametable20141210_201601_201602` WRITE;
/*!40000 ALTER TABLE `gametable20141210_201601_201602` DISABLE KEYS */;
/*!40000 ALTER TABLE `gametable20141210_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141211_201201_201204`
--

DROP TABLE IF EXISTS `gametable20141211_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141211_201201_201204` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141211_201201_201204`
--

LOCK TABLES `gametable20141211_201201_201204` WRITE;
/*!40000 ALTER TABLE `gametable20141211_201201_201204` DISABLE KEYS */;
INSERT INTO `gametable20141211_201201_201204` VALUES (1,'Score','2014-12-11 14:05:11'),(1,'Score','2014-12-11 14:05:13'),(1,'Score','2014-12-11 14:05:18'),(1,'Fouls','2014-12-11 14:05:20'),(1,'Fouls','2014-12-11 14:05:20'),(1,'Fouls','2014-12-11 14:05:20'),(5,'Score','2014-12-11 14:05:24'),(5,'Score','2014-12-11 14:05:24'),(1,'CancelFouls','2014-12-11 14:06:02');
/*!40000 ALTER TABLE `gametable20141211_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gametable20141211_201601_201602`
--

DROP TABLE IF EXISTS `gametable20141211_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gametable20141211_201601_201602` (
  `PlayerID` int(11) DEFAULT NULL,
  `Event` varchar(45) DEFAULT NULL,
  `Time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gametable20141211_201601_201602`
--

LOCK TABLES `gametable20141211_201601_201602` WRITE;
/*!40000 ALTER TABLE `gametable20141211_201601_201602` DISABLE KEYS */;
/*!40000 ALTER TABLE `gametable20141211_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupgame`
--

DROP TABLE IF EXISTS `groupgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupgame` (
  `TeamID` varchar(6) NOT NULL,
  `TeamName` varchar(45) NOT NULL,
  `TeamLab` varchar(45) NOT NULL,
  `GroupID` varchar(1) NOT NULL,
  `Win` int(11) NOT NULL DEFAULT '0',
  `Lose` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`TeamID`),
  UNIQUE KEY `TeamID_UNIQUE` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupgame`
--

LOCK TABLES `groupgame` WRITE;
/*!40000 ALTER TABLE `groupgame` DISABLE KEYS */;
INSERT INTO `groupgame` VALUES ('201201','2','智能接口与人机交互研究中心','A',1,1),('201204','猛','计算机网络与信息安全技术研究中心','A',1,1),('201502','TT','语言技术研究中心','B',0,0),('201601','哈哈哈','智能接口与人机交互研究中心','C',0,0),('201602','呵呵呵','语言技术研究中心','D',0,0),('201707','gdaf','生物信息学研究中心','G',0,0);
/*!40000 ALTER TABLE `groupgame` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (1,'222'),(2,'2014-12-31 有比赛'),(3,'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！'),(4,'123213'),(5,'3123123'),(6,'ref24fr'),(7,'2013 '),(8,'的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇的电风扇'),(9,''),(10,'213123123'),(11,'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\''),(12,'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\'\'2014-12-22 将由201401队伍迎战201304队伍！请大家多多支持！\''),(13,'44'),(14,'2014-11-13 将由201401队伍迎战201304队伍！请大家多多支持！'),(15,'2014-11-13 将由201401队伍迎战201304队伍！请大家多多支持！！'),(16,'2014-11-13 将由201401队伍迎战201304队伍！请大家多多支持！！！');
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
  `StudentID` varchar(45) DEFAULT NULL,
  `Number` int(11) NOT NULL,
  `Position` varchar(45) NOT NULL,
  `Score` int(11) NOT NULL DEFAULT '0',
  `NumberOfMatches` int(11) NOT NULL DEFAULT '0',
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否',
  PRIMARY KEY (`PlayerID`),
  UNIQUE KEY `PlayerID_UNIQUE` (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `players`
--

LOCK TABLES `players` WRITE;
/*!40000 ALTER TABLE `players` DISABLE KEYS */;
INSERT INTO `players` VALUES (1,201201,'2','Lin','男','1123710501',17,'在读硕士生',18,3,5,20,'否'),(2,201204,'猛','Kobe','男','1123710502',24,'在读硕士生',0,3,0,20,'否'),(5,201201,'2','陈晨','男','1120310707',21,'在读硕士生',2,3,0,20,'否'),(6,201204,'猛','刘甜','女','1120311111',54,'在读硕士生',0,3,0,20,'否'),(7,201201,'2','哈','男','1120111111',312,'在读硕士生',0,3,0,20,'否'),(8,201502,'TT','李言路','男','1120310303',7,'在读硕士生',0,0,0,20,'否'),(9,201601,'哈哈哈','赵','保密','1120310301',1,'在读硕士生',0,0,0,20,'否'),(10,201601,'哈哈哈','钱','保密','1120310302',2,'在读硕士生',0,0,0,20,'否'),(12,201601,'哈哈哈','孙','保密','1120310304',3,'在读硕士生',0,0,0,20,'否'),(13,201601,'哈哈哈','李','保密','1120310305',4,'在读硕士生',0,0,0,20,'否'),(14,201601,'哈哈哈','周','保密','1120310306',5,'在读硕士生',0,0,0,20,'否'),(15,201602,'呵呵呵','吴','保密','1120310311',1,'在读硕士生',0,0,0,20,'否'),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'在读硕士生',0,0,0,20,'否'),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'在读硕士生',0,0,0,20,'否'),(18,201602,'呵呵呵','张皓','男','1120310314',4,'在读硕士生',0,0,0,20,'否'),(19,201602,'呵呵呵','杜常辉','保密','1120310315',5,'在读硕士生',0,0,0,20,'否'),(26,201707,'gdaf','孙一','男','1120310308',44,'教练',0,0,0,55,'是'),(27,201707,'gdaf','王一凡','男','1120320417',21,'领队',0,0,0,20,'否'),(28,201601,'哈哈哈','嗯','女','1120310321',53,'领队',0,0,0,20,'否'),(29,201601,'哈哈哈','临时','男','1234567890',12,'在读本科生',0,0,0,20,'否');
/*!40000 ALTER TABLE `players` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141123_201201_201204`
--

DROP TABLE IF EXISTS `playerstable20141123_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141123_201201_201204` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141123_201201_201204`
--

LOCK TABLES `playerstable20141123_201201_201204` WRITE;
/*!40000 ALTER TABLE `playerstable20141123_201201_201204` DISABLE KEYS */;
INSERT INTO `playerstable20141123_201201_201204` VALUES (1,201201,'2','Lin','男','1123710501',17,'在读硕士生',5,1,3,20,'否'),(2,201204,'猛','Kobe','男','1123710502',24,'在读硕士生',19,1,1,20,'否'),(5,201201,'2','陈晨','男','1120310707',21,'在读硕士生',2,1,0,20,'否'),(6,201204,'猛','刘甜','女','1120311111',54,'在读硕士生',3,1,0,20,'否'),(7,201201,'2','哈','男','1120111111',312,'在读硕士生',1,1,1,20,'否');
/*!40000 ALTER TABLE `playerstable20141123_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141123_201601_201602`
--

DROP TABLE IF EXISTS `playerstable20141123_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141123_201601_201602` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141123_201601_201602`
--

LOCK TABLES `playerstable20141123_201601_201602` WRITE;
/*!40000 ALTER TABLE `playerstable20141123_201601_201602` DISABLE KEYS */;
INSERT INTO `playerstable20141123_201601_201602` VALUES (9,201601,'哈哈哈','赵','保密','1120310301',1,'在读硕士生',0,0,0,20,'否'),(10,201601,'哈哈哈','钱','保密','1120310302',2,'在读硕士生',0,0,0,20,'否'),(12,201601,'哈哈哈','孙','保密','1120310304',3,'在读硕士生',0,0,0,20,'否'),(13,201601,'哈哈哈','李','保密','1120310305',4,'在读硕士生',0,0,0,20,'否'),(14,201601,'哈哈哈','周','保密','1120310306',5,'在读硕士生',0,0,0,20,'否'),(15,201602,'呵呵呵','吴','保密','1120310311',1,'在读硕士生',3,0,0,20,'否'),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'在读硕士生',0,0,0,20,'否'),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'在读硕士生',0,0,0,20,'否'),(18,201602,'呵呵呵','张皓','男','1120310314',4,'在读硕士生',0,0,0,20,'否'),(19,201602,'呵呵呵','杜常辉','保密','1120310315',5,'在读硕士生',0,0,0,20,'否');
/*!40000 ALTER TABLE `playerstable20141123_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141209_201201_201204`
--

DROP TABLE IF EXISTS `playerstable20141209_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141209_201201_201204` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否',
  `State` varchar(45) DEFAULT 'bench'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141209_201201_201204`
--

LOCK TABLES `playerstable20141209_201201_201204` WRITE;
/*!40000 ALTER TABLE `playerstable20141209_201201_201204` DISABLE KEYS */;
INSERT INTO `playerstable20141209_201201_201204` VALUES (1,201201,'2','Lin','男','1123710501',17,'在读硕士生',7,0,1,20,'否','bench'),(2,201204,'猛','Kobe','男','1123710502',24,'在读硕士生',0,0,0,20,'否','bench'),(5,201201,'2','陈晨','男','1120310707',21,'在读硕士生',0,0,0,20,'否','bench'),(6,201204,'猛','刘甜','女','1120311111',54,'在读硕士生',0,0,0,20,'否','bench'),(7,201201,'2','哈','男','1120111111',312,'在读硕士生',0,0,0,20,'否','bench');
/*!40000 ALTER TABLE `playerstable20141209_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141210_201201_201204`
--

DROP TABLE IF EXISTS `playerstable20141210_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141210_201201_201204` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否',
  `State` varchar(45) DEFAULT 'bench'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141210_201201_201204`
--

LOCK TABLES `playerstable20141210_201201_201204` WRITE;
/*!40000 ALTER TABLE `playerstable20141210_201201_201204` DISABLE KEYS */;
INSERT INTO `playerstable20141210_201201_201204` VALUES (1,201201,'2','Lin','男','1123710501',17,'在读硕士生',8,1,1,20,'否','bench'),(2,201204,'猛','Kobe','男','1123710502',24,'在读硕士生',0,1,0,20,'否','bench'),(5,201201,'2','陈晨','男','1120310707',21,'在读硕士生',0,1,0,20,'否','bench'),(6,201204,'猛','刘甜','女','1120311111',54,'在读硕士生',0,1,0,20,'否','bench'),(7,201201,'2','哈','男','1120111111',312,'在读硕士生',0,1,0,20,'否','bench');
/*!40000 ALTER TABLE `playerstable20141210_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141210_201601_201602`
--

DROP TABLE IF EXISTS `playerstable20141210_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141210_201601_201602` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141210_201601_201602`
--

LOCK TABLES `playerstable20141210_201601_201602` WRITE;
/*!40000 ALTER TABLE `playerstable20141210_201601_201602` DISABLE KEYS */;
INSERT INTO `playerstable20141210_201601_201602` VALUES (9,201601,'哈哈哈','赵','男','1120310301',1,'在读硕士生',0,1,0,20,'是'),(10,201601,'哈哈哈','钱','男','1120310302',2,'在读硕士生',0,1,0,20,'否'),(12,201601,'哈哈哈','孙','男','1120310304',3,'在读硕士生',0,1,0,20,'是'),(13,201601,'哈哈哈','李','男','1120310305',4,'在读硕士生',0,1,0,20,'否'),(14,201601,'哈哈哈','周','男','1120310306',5,'在读硕士生',0,1,0,20,'是'),(15,201602,'呵呵呵','吴','男','1120310311',1,'在读硕士生',0,1,0,20,'是'),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'在读硕士生',0,1,0,20,'否'),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'在读硕士生',0,1,0,20,'是'),(18,201602,'呵呵呵','张皓','男','1120310314',4,'在读硕士生',0,1,0,20,'否'),(19,201602,'呵呵呵','杜常辉','男','1120310315',5,'在读硕士生',0,1,0,20,'是');
/*!40000 ALTER TABLE `playerstable20141210_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141211_201201_201204`
--

DROP TABLE IF EXISTS `playerstable20141211_201201_201204`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141211_201201_201204` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否',
  `State` varchar(45) DEFAULT 'bench'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141211_201201_201204`
--

LOCK TABLES `playerstable20141211_201201_201204` WRITE;
/*!40000 ALTER TABLE `playerstable20141211_201201_201204` DISABLE KEYS */;
INSERT INTO `playerstable20141211_201201_201204` VALUES (1,201201,'2','Lin','男','1123710501',17,'在读硕士生',3,3,2,20,'否','oncourt'),(2,201204,'猛','Kobe','男','1123710502',24,'在读硕士生',0,3,0,20,'否','bench'),(5,201201,'2','陈晨','男','1120310707',21,'在读硕士生',2,3,0,20,'否','bench'),(6,201204,'猛','刘甜','女','1120311111',54,'在读硕士生',0,3,0,20,'否','bench'),(7,201201,'2','哈','男','1120111111',312,'在读硕士生',0,3,0,20,'否','bench');
/*!40000 ALTER TABLE `playerstable20141211_201201_201204` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `playerstable20141211_201601_201602`
--

DROP TABLE IF EXISTS `playerstable20141211_201601_201602`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `playerstable20141211_201601_201602` (
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
  `Fouls` int(11) NOT NULL DEFAULT '0',
  `Age` int(3) NOT NULL DEFAULT '20',
  `IsSHB` varchar(4) NOT NULL DEFAULT '否',
  `State` varchar(45) DEFAULT 'bench'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `playerstable20141211_201601_201602`
--

LOCK TABLES `playerstable20141211_201601_201602` WRITE;
/*!40000 ALTER TABLE `playerstable20141211_201601_201602` DISABLE KEYS */;
INSERT INTO `playerstable20141211_201601_201602` VALUES (9,201601,'哈哈哈','赵','保密','1120310301',1,'在读硕士生',0,0,0,20,'否','oncourt'),(10,201601,'哈哈哈','钱','保密','1120310302',2,'在读硕士生',0,0,0,20,'否','oncourt'),(12,201601,'哈哈哈','孙','保密','1120310304',3,'在读硕士生',0,0,0,20,'否','oncourt'),(13,201601,'哈哈哈','李','保密','1120310305',4,'在读硕士生',0,0,0,20,'否','oncourt'),(14,201601,'哈哈哈','周','保密','1120310306',5,'在读硕士生',0,0,0,20,'否','bench'),(15,201602,'呵呵呵','吴','保密','1120310311',1,'在读硕士生',0,0,0,20,'否','bench'),(16,201602,'呵呵呵','孙瑞','男','1120310312',2,'在读硕士生',0,0,0,20,'否','bench'),(17,201602,'呵呵呵','李泽宇','女','1120310313',3,'在读硕士生',0,0,0,20,'否','bench'),(18,201602,'呵呵呵','张皓','男','1120310314',4,'在读硕士生',0,0,0,20,'否','bench'),(19,201602,'呵呵呵','杜常辉','保密','1120310315',5,'在读硕士生',0,0,0,20,'否','bench'),(28,201601,'哈哈哈','嗯','女','1120310321',53,'领队',0,0,0,20,'否','bench'),(29,201601,'哈哈哈','临时','男','1234567890',12,'在读本科生',0,0,0,20,'否','bench');
/*!40000 ALTER TABLE `playerstable20141211_201601_201602` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule` (
  `Index` int(11) NOT NULL AUTO_INCREMENT,
  `Time` varchar(45) NOT NULL,
  `Place` varchar(45) NOT NULL,
  `HomeTeamID` varchar(45) NOT NULL,
  `AwayTeamID` varchar(45) NOT NULL,
  PRIMARY KEY (`Index`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
INSERT INTO `schedule` VALUES (7,'2014-2-12 10:10','篮球馆2号场','201201','201204'),(8,'2014-2-21 10:11','篮球馆3号场','201601','201602'),(12,'2014-9-21 10:11','篮球馆5号场','201201','201204');
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
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
  `PlayerNum` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `TeamID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES ('201201','2','1201','智能接口与人机交互研究中心',3),('201204','猛','1204','计算机网络与信息安全技术研究中心',2),('201502','TT','123','语言技术研究中心',1),('201601','哈哈哈','123','智能接口与人机交互研究中心',7),('201602','呵呵呵','123','语言技术研究中心',5),('201707','gdaf','123','生物信息学研究中心',2);
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

-- Dump completed on 2014-12-12 10:21:15
