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
-- Dumping routines for database 'babakari_showme'
--
/*!50003 DROP PROCEDURE IF EXISTS `newUserReg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xellarant`@`%` PROCEDURE `newUserReg`(
	IN `userName` varchar(255)
    ,IN `password` varchar(255)
    ,IN `firstName` varchar(255)
    ,IN `lastName` varchar(255)
    ,IN `email` varchar(255)
)
BEGIN

INSERT INTO users (username, password)
VALUES (userName, password);

INSERT INTO userprofiles(userID, FirstName, LastName, email)
VALUES (LAST_INSERT_ID(), firstName, lastName, email);

SELECT	userprofiles.userID AS userID
		,users.username
        ,FirstName
        ,LastName
        ,email
FROM	userprofiles
JOIN	users 
	ON	users.userid = userprofiles.userID
WHERE	userprofileID = LAST_INSERT_ID();
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `suggestedMovies` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xellarant`@`%` PROCEDURE `suggestedMovies`(
	IN `userID` int
)
BEGIN
	
	SELECT	*
	FROM	babakari_movies.movies
	JOIN	babakari_movies.movies_genres
	ON		babakari_movies.movies.id = babakari_movies.movies_genres.movies_id
	JOIN (	
			SELECT	count(movies_id) as hits
					,genres_id
			FROM	babakari_movies.movies_genres
			WHERE	babakari_movies.movies_genres.movies_id in (
				SELECT	movieID
				FROM	babakari_showme.userfavorites
				WHERE	babakari_showme.userfavorites.userID = userID
			)
			GROUP BY	genres_id
			ORDER BY	count(movies_id) DESC
			LIMIT 3
	) topPicks
	ON		babakari_movies.movies_genres.genres_id = topPicks.genres_id
	WHERE	movies_id NOT IN (SELECT movieID	FROM babakari_showme.userfavorites	WHERE userID = userID)
	LIMIT	25;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-12 14:44:10
