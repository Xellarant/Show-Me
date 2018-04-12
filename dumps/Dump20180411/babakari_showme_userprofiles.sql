CREATE DATABASE  IF NOT EXISTS `babakari_showme` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `babakari_showme`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: db.sandbox.xellarant.com    Database: babakari_showme
-- ------------------------------------------------------
-- Server version	5.6.37-log

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
-- Table structure for table `userprofiles`
--

DROP TABLE IF EXISTS `userprofiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userprofiles` (
  `userProfileID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `email` varchar(75) NOT NULL,
  `userRoleTypeID` int(11) NOT NULL DEFAULT '0',
  `ZipCode` int(11) DEFAULT NULL,
  PRIMARY KEY (`userProfileID`),
  UNIQUE KEY `userProfileID` (`userProfileID`),
  KEY `PK` (`userProfileID`)
) ENGINE=MyISAM AUTO_INCREMENT=55 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userprofiles`
--

LOCK TABLES `userprofiles` WRITE;
/*!40000 ALTER TABLE `userprofiles` DISABLE KEYS */;
INSERT INTO `userprofiles` VALUES (1,11,'Elnaz','ra','elnazra@fake.com',0,NULL),(12,23,'First','Last','fake@name.com',0,NULL),(13,24,'Danielgof','DanielgofIT','danielsib@mail.ru',0,NULL),(14,26,'name','lastname','email@email.com',0,NULL),(15,27,'name','lastname','email@email.com',0,NULL),(16,28,'name','lasNamne','email@email.com',0,NULL),(17,29,'DanielTog','DanielTogIT','danielsib@mail.ru',0,NULL),(18,30,'BA','AR','ba@yahoo.com',0,NULL),(19,31,'Afshin','Amini','aamini@rocketmail.com',0,NULL),(20,32,'Michaelfal','MichaelfalQI','michaelimalt@mail.ru',0,NULL),(21,33,'elanz','ramezani','erh_1985@yahoo.com',0,NULL),(22,34,'ben','Ar','ben1@yahoo.com',0,NULL),(23,38,'test','undefined','test.user@email.com',0,NULL),(24,39,'test','undefined','test.user@email.com',0,NULL),(25,40,'test','undefined','test.user@email.com',0,NULL),(26,41,'test','undefined','test.user@email.com',0,NULL),(27,42,'test','undefined','test.user@email.com',0,NULL),(28,45,'test','undefined','test.user@email.com',0,NULL),(29,51,'test','undefined','test.user@email.com',0,NULL),(30,52,'test','undefined','test.user@email.com',0,NULL),(31,53,'test','undefined','test.user@email.com',0,NULL),(32,67,'teset','undefined','test.user@email.com',0,NULL),(33,68,'test','undefined','test.user@email.com',0,NULL),(34,71,'test','undefined','test.user@email.com',0,NULL),(35,73,'test','undefined','test.user@email.com',0,NULL),(36,74,'test','undefined','test.user@email.com',0,NULL),(37,76,'test','undefined','test.user@email.com',0,NULL),(38,77,'test','undefined','test.user@email.com',0,NULL),(39,78,'test','undefined','test.user@email.com',0,NULL),(40,82,'test','undefined','test.user@email.com',0,NULL),(41,83,'test','User','test.user@email.com',0,NULL),(42,85,'test','user','test.user@email.com',0,NULL),(43,87,'test','user','test.user@email.com',0,NULL),(44,89,'Rallante','Hunt','xellarant@email.com',0,91367),(45,91,'Jo','Mama','jo.mama@email.com',0,NULL),(46,92,'Test','User','testUser#43',0,NULL),(47,93,'b','c','ba@ya.com',0,NULL),(48,94,'rallante','hunt','xellarant@gmail.com',0,NULL),(49,95,'user22','last','user22@ya.com',0,NULL),(50,96,'Test','User','duchemail@email.com',0,NULL),(51,98,'bbb','aaa','bbbb@yahooo.com',0,NULL),(52,100,'new12','user12','new12@yaho.com',0,91335),(53,102,'mm','jj','m1@y.com',0,NULL),(54,104,'Jo','Mama','testUser42@email.com',0,91367);
/*!40000 ALTER TABLE `userprofiles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11 16:37:30
