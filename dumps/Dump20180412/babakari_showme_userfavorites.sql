CREATE DATABASE  IF NOT EXISTS `babakari_showme` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `babakari_showme`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: babakari_showme
-- ------------------------------------------------------
-- Server version	5.7.19

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
-- Table structure for table `userfavorites`
--

DROP TABLE IF EXISTS `userfavorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userfavorites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `movieID` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `imageURL` varchar(255) DEFAULT NULL,
  `actor` varchar(255) DEFAULT NULL,
  `genre` varchar(255) DEFAULT NULL,
  `director` varchar(255) DEFAULT NULL,
  `titleYear` year(4) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `userID` (`userID`)
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userfavorites`
--

LOCK TABLES `userfavorites` WRITE;
/*!40000 ALTER TABLE `userfavorites` DISABLE KEYS */;
INSERT INTO `userfavorites` VALUES (14,89,901,'O Brother, Where Art Thou?','https://images-na.ssl-images-amazon.com/images/M/MV5BYmFhNjMwM2EtNGViMy00MTZmLWIzNTYtYzg1NWYwNTE2MGJhXkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_UX67_CR0,0,67,98_AL_.jpg','George Clooney','Adventure','Ethan Coen',2000,NULL),(15,89,956,'The Matrix','https://images-na.ssl-images-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX67_CR0,0,67,98_AL_.jpg','Keanu Reeves','Action','Lana Wachowski',1999,NULL),(16,89,1895,'Sherlock Holmes: A Game of Shadows','https://images-na.ssl-images-amazon.com/images/M/MV5BMTQwMzQ5Njk1MF5BMl5BanBnXkFtZTcwNjIxNzIxNw@@._V1_UX67_CR0,0,67,98_AL_.jpg','Robert Downey Jr.','Adventure','Guy Ritchie',2011,NULL),(17,0,5,'Bad Moms','https://images-na.ssl-images-amazon.com/images/M/MV5BMjIwNzE5MTgwNl5BMl5BanBnXkFtZTgwNjM4OTA0OTE@._V1_UX67_CR0,0,67,98_AL_.jpg','Mila Kunis','Comedy','Jon Lucas',2016,NULL),(18,0,5,'Bad Moms','https://images-na.ssl-images-amazon.com/images/M/MV5BMjIwNzE5MTgwNl5BMl5BanBnXkFtZTgwNjM4OTA0OTE@._V1_UX67_CR0,0,67,98_AL_.jpg','Mila Kunis','Comedy','Jon Lucas',2016,NULL),(19,95,59,'A Bad Moms Christmas','https://images-na.ssl-images-amazon.com/images/M/MV5BMTUwNTA4MDMxNl5BMl5BanBnXkFtZTgwMjE4NjQ0MzI@._V1_UX67_CR0,0,67,98_AL_.jpg','Mila Kunis','Adventure','Jon Lucas',2017,NULL),(20,95,36,'The Meyerowitz Stories (New and Selected)','https://images-na.ssl-images-amazon.com/images/M/MV5BMTY1MTA1MjU4NV5BMl5BanBnXkFtZTgwMTAwMzE2MzI@._V1_UX67_CR0,0,67,98_AL_.jpg','Adam Sandler','Drama','Noah Baumbach',2017,NULL),(21,96,956,'The Matrix','https://images-na.ssl-images-amazon.com/images/M/MV5BNzQzOTk3OTAtNDQ0Zi00ZTVkLWI0MTEtMDllZjNkYzNjNTc4L2ltYWdlXkEyXkFqcGdeQXVyNjU0OTQ0OTY@._V1_UX67_CR0,0,67,98_AL_.jpg','Keanu Reeves','Action','Lana Wachowski',1999,NULL),(22,95,67,'Get Out','https://images-na.ssl-images-amazon.com/images/M/MV5BMTBhMjVkNGYtYTZhOS00YjYwLWJhOGItOWZiMjAwYzQ0ZTQzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX67_CR0,0,67,98_AL_.jpg','Daniel Kaluuya','Horror','Jordan Peele',2017,NULL),(23,95,67,'Get Out','https://images-na.ssl-images-amazon.com/images/M/MV5BMTBhMjVkNGYtYTZhOS00YjYwLWJhOGItOWZiMjAwYzQ0ZTQzXkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_UX67_CR0,0,67,98_AL_.jpg','Daniel Kaluuya','Horror','Jordan Peele',2017,NULL),(24,96,626,'La La Land','https://images-na.ssl-images-amazon.com/images/M/MV5BMzUzNDM2NzM2MV5BMl5BanBnXkFtZTgwNTM3NTg4OTE@._V1_UX67_CR0,0,67,98_AL_.jpg','Ryan Gosling','Drama','Damien Chazelle',2016,NULL),(25,89,42,'John Wick: Chapter 2','https://images-na.ssl-images-amazon.com/images/M/MV5BMjE2NDkxNTY2M15BMl5BanBnXkFtZTgwMDc2NzE0MTI@._V1_UX67_CR0,0,67,98_AL_.jpg','Keanu Reeves','Action','Chad Stahelski',2017,NULL),(26,100,65,'Happy Death Day','https://images-na.ssl-images-amazon.com/images/M/MV5BMTk0ODMyNjk1NF5BMl5BanBnXkFtZTgwNDkxOTk4MzI@._V1_UX67_CR0,0,67,98_AL_.jpg','Jessica Rothe','Horror','Christopher Landon',2017,NULL),(27,100,58,'Star Wars: The Last Jedi','https://images-na.ssl-images-amazon.com/images/M/MV5BMjQ1MzcxNjg4N15BMl5BanBnXkFtZTgwNzgwMjY4MzI@._V1_UX67_CR0,0,67,98_AL_.jpg','Mark Hamill','Adventure','Rian Johnson',2017,NULL),(28,102,634,'Ready Player One','https://images-na.ssl-images-amazon.com/images/M/MV5BMjM0MzkxMzU2M15BMl5BanBnXkFtZTgwODg2NTg5MjI@._V1_UX67_CR0,0,67,98_AL_.jpg','Olivia Cooke','Adventure','Steven Spielberg',2018,NULL),(29,100,540,'Harry Potter and the Deathly Hallows: Part 2','https://images-na.ssl-images-amazon.com/images/M/MV5BMjIyZGU4YzUtNDkzYi00ZDRhLTljYzctYTMxMDQ4M2E0Y2YxXkEyXkFqcGdeQXVyNTIzOTk5ODM@._V1_UX67_CR0,0,67,98_AL_.jpg','Emma Watson','Adventure','David Yates',2011,NULL),(30,100,0,'Sajjan Singh Rangroot','https://ia.media-imdb.com/images/M/MV5BMzdkYzJjMTktZDI1NS00OWJmLWJlZDYtNGQ1MjUzODBjNWJmXkEyXkFqcGdeQXVyNjkxNDE3MTQ@._V1_UX67_CR0,0,67,98_AL_.jpg','Diljit Dosanjh, Yograj Singh, Sunanda Sharma','War','Pankaj Batra',2018,NULL),(32,0,0,'Ready Player One','https://ia.media-imdb.com/images/M/MV5BY2JiYTNmZTctYTQ1OC00YjU4LWEwMjYtZjkwY2Y5MDI0OTU3XkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_UX67_CR0,0,67,98_AL_.jpg','Tye Sheridan, Olivia Cooke, Ben Mendelsohn','Action, Adventure, Sci-Fi','Steven Spielberg',2018,NULL),(33,100,1677720,'Ready Player One','https://ia.media-imdb.com/images/M/MV5BY2JiYTNmZTctYTQ1OC00YjU4LWEwMjYtZjkwY2Y5MDI0OTU3XkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_UX67_CR0,0,67,98_AL_.jpg','Tye Sheridan, Olivia Cooke, Ben Mendelsohn','Action, Adventure, Sci-Fi','Steven Spielberg',2018,NULL),(35,100,520,'The Hunger Games','https://images-na.ssl-images-amazon.com/images/M/MV5BMjA4NDg3NzYxMF5BMl5BanBnXkFtZTcwNTgyNzkyNw@@._V1_UX67_CR0,0,67,98_AL_.jpg','Jennifer Lawrence','Adventure','Gary Ross',2012,NULL),(38,0,1677720,'Ready Player One','https://ia.media-imdb.com/images/M/MV5BY2JiYTNmZTctYTQ1OC00YjU4LWEwMjYtZjkwY2Y5MDI0OTU3XkEyXkFqcGdeQXVyNTI4MzE4MDU@._V1_UX67_CR0,0,67,98_AL_.jpg','Tye Sheridan, Olivia Cooke, Ben Mendelsohn','Action, Adventure, Sci-Fi','Steven Spielberg',2018,NULL),(37,100,2283362,'Jumanji: Welcome to the Jungle','https://ia.media-imdb.com/images/M/MV5BODQ0NDhjYWItYTMxZi00NTk2LWIzNDEtOWZiYWYxZjc2MTgxXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_UX67_CR0,0,67,98_AL_.jpg','Dwayne Johnson, Karen Gillan, Kevin Hart','Action, Adventure, Comedy','Jake Kasdan',2017,NULL);
/*!40000 ALTER TABLE `userfavorites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-12 14:44:09
