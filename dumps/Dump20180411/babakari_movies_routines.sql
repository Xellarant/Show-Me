CREATE DATABASE  IF NOT EXISTS `babakari_movies` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `babakari_movies`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: db.sandbox.xellarant.com    Database: babakari_movies
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
-- Dumping routines for database 'babakari_movies'
--
/*!50003 DROP PROCEDURE IF EXISTS `mdGetFullStats` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`Xellarant`@`%` PROCEDURE `mdGetFullStats`(
	IN `yearStart` DATE, 
	IN `yearEnd` DATE, 
	IN `movieTitle` VARCHAR(255), 
	IN `movieDirector` VARCHAR(255), 
	IN `movieActor` VARCHAR(255),
    IN `genre` VARCHAR(255))
BEGIN

SELECT  movies.id
		,movies.title 
		,movies.year 
        ,movies.image_url 
        ,movies.certificate as `rating `
        ,movies.runtime 
        ,movies.imdb_rating 
        ,movies.description 
        ,genres.name as `genre`
        ,stars.name as `actors` 
        ,directors.name as `directors`
        FROM movies 
        inner JOIN movies_stars 
        ON movies.id = movies_stars.movies_id
        inner JOIN stars ON movies_stars.stars_id = stars.id
        inner JOIN movies_genres ON movies_genres.movies_id = movies.id
        inner JOIN genres ON movies_genres.genres_id = genres.id
        inner JOIN movies_directors ON movies_directors.movies_id = movies.id
        inner JOIN directors ON movies_directors.directors_id = directors.id
        WHERE	movies.year BETWEEN IFNULL(yearStart, '1800/01/01') and IFNULL(yearEnd, CURDATE())
        AND		movies.title LIKE CONCAT('%', IFNULL(movieTitle, ''), '%')
        AND		stars.name LIKE CONCAT('%', IFNULL(movieActor, ''), '%')
        AND		directors.name LIKE CONCAT('%', IFNULL(movieDirector, ''), '%')
        AND		genres.name LIKE CONCAT('%', IFNULL(genre, ''), '%')
		GROUP BY movies.id;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `mdGetFullStatsSingle` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
CREATE DEFINER=`Xellarant`@`%` PROCEDURE `mdGetFullStatsSingle`(
	IN `movieID` INT
)
BEGIN
	SELECT  
		DISTINCT (movies.id)
		,movies.title 
		,movies.year 
        ,movies.image_url 
        ,movies.certificate as `rating `
        ,movies.runtime 
        ,movies.imdb_rating 
        ,movies.description 
        ,genres.name as `genre`
        ,stars.name as `actors` 
        ,directors.name as `directors`
        FROM movies 
        inner JOIN movies_stars 
        ON movies.id = movies_stars.movies_id
        inner JOIN stars ON movies_stars.stars_id = stars.id
        inner JOIN movies_genres ON movies_genres.movies_id = movies.id
        inner JOIN genres ON movies_genres.genres_id = genres.id
        inner JOIN movies_directors ON movies_directors.movies_id = movies.id
        inner JOIN directors ON movies_directors.directors_id = directors.id
        WHERE	movies.id = movieID;
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

-- Dump completed on 2018-04-11 16:37:41
