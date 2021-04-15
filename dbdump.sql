-- MySQL dump 10.13  Distrib 5.7.9, for Win64 (x86_64)
--
-- Host: localhost    Database: excursiondb
-- ------------------------------------------------------
-- Server version	5.5.57-MariaDB

DROP SCHEMA IF EXISTS `excursiondb`;
CREATE SCHEMA `excursiondb`;
USE `excursiondb`;

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
-- Table structure for table `hikingclub`
--

DROP TABLE IF EXISTS `hikingclub`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hikingclub` (
  `HCID` smallint(5) NOT NULL,
  `Telephone` varchar(13) DEFAULT NULL,
  `Name` varchar(100) NOT NULL,
  `Region` enum('Attica','Central Greece','Central Macedonia','Crete','Eastern Macedonia and Thrace','Epirus','Ionian Islands','North Aegean','Peloponnese','South Aegean','Thessaly','Western Greece','Western Macedonia') DEFAULT NULL,
  PRIMARY KEY (`HCID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hikingclub`
--

LOCK TABLES `hikingclub` WRITE;
/*!40000 ALTER TABLE `hikingclub` DISABLE KEYS */;
INSERT INTO `hikingclub` VALUES (162,'2410891900','Filoi Vounou Larisas - Oi exerevnites','Thessaly'),(242,'2681089129','Filorivatikos Syllogos Artas','Epirus'),(314,'2463019832','Filoi tou vounou','Western Macedonia'),(319,'2310673019','Mountain Friends of Sykies','Central Macedonia'),(473,'2810128900','Sillogos Orivaton - O Psiloritis','Crete'),(582,'2551027881','Orivatikos Syllogos Samothrakis','Eastern Macedonia and Thrace'),(635,'2610430010','Achaiki Pezoporia','Western Greece'),(671,'2103178100','Proskopikos Syllogos Athinon','Attica');
/*!40000 ALTER TABLE `hikingclub` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hikingclub_has_user`
--

DROP TABLE IF EXISTS `hikingclub_has_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hikingclub_has_user` (
  `HikingClub` smallint(5) NOT NULL,
  `User` smallint(5) NOT NULL,
  `DateTime` datetime DEFAULT NULL,
  PRIMARY KEY (`HikingClub`,`User`),
  KEY `UserID_idx` (`User`),
  CONSTRAINT `1FKHikingClubID` FOREIGN KEY (`HikingClub`) REFERENCES `hikingclub` (`HCID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `1FKUserID` FOREIGN KEY (`User`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hikingclub_has_user`
--

LOCK TABLES `hikingclub_has_user` WRITE;
/*!40000 ALTER TABLE `hikingclub_has_user` DISABLE KEYS */;
INSERT INTO `hikingclub_has_user` VALUES (162,15,'2019-10-07 19:01:00'),(162,19,'2019-11-06 10:45:00'),(314,12,'2019-10-28 22:11:00'),(314,14,'2019-11-04 18:45:00'),(314,23,'2019-10-24 17:49:00'),(319,21,'2019-09-25 12:48:00');
/*!40000 ALTER TABLE `hikingclub_has_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hikingclub_organize_trail`
--

DROP TABLE IF EXISTS `hikingclub_organize_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hikingclub_organize_trail` (
  `TripID` smallint(5) NOT NULL,
  `HikingClub` smallint(5) NOT NULL,
  `Trail` smallint(5) NOT NULL,
  `Date` date DEFAULT NULL,
  `Day` enum('Mo','Tu','We','Th','Fr','Sa','Su') DEFAULT NULL,
  `StartPoint` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TripID`),
  KEY `HikingClubID_idx` (`HikingClub`),
  KEY `2FKTrailID` (`Trail`),
  CONSTRAINT `2FKHikingClubID` FOREIGN KEY (`HikingClub`) REFERENCES `hikingclub` (`HCID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `2FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hikingclub_organize_trail`
--

LOCK TABLES `hikingclub_organize_trail` WRITE;
/*!40000 ALTER TABLE `hikingclub_organize_trail` DISABLE KEYS */;
INSERT INTO `hikingclub_organize_trail` VALUES (5025,314,111,'2020-04-16','Mo','Litochoro'),(5026,162,108,'2019-12-29','Tu','Papingo');
/*!40000 ALTER TABLE `hikingclub_organize_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `image` (
  `ImageID` smallint(5) NOT NULL,
  `Trail` smallint(5) NOT NULL,
  `Directory` varchar(200) NOT NULL,
  PRIMARY KEY (`ImageID`,`Trail`),
  KEY `TrailID_idx` (`Trail`),
  CONSTRAINT `3FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (2489,102,'./images/img028102489'),(2490,104,'./images/img028102490'),(2491,108,'./images/img028102491'),(2492,111,'./images/img028102492'),(2493,115,'./images/img028102493');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mountain`
--

DROP TABLE IF EXISTS `mountain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mountain` (
  `MountainID` smallint(5) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Region` enum('Attica','Central Greece','Central Macedonia','Crete','Eastern Macedonia and Thrace','Epirus','Ionian Islands','North Aegean','Peloponnese','South Aegean','Thessaly','Western Greece','Western Macedonia') DEFAULT NULL,
  `Altitude` float DEFAULT NULL,
  PRIMARY KEY (`MountainID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mountain`
--

LOCK TABLES `mountain` WRITE;
/*!40000 ALTER TABLE `mountain` DISABLE KEYS */;
INSERT INTO `mountain` VALUES (1,'Olymbos','Mountain of the Gods','Central Macedonia',2918),(2,'Grammos','Borders between Greece and Albania','Epirus',2520),(3,'Tymphi','Famous for the Drakolimni','Epirus',2429),(4,'Athamanika','','Epirus',2921),(5,'Pelion','Its highest summit is Pourianos Stavros','Thessaly',1610),(6,'Pangaion','','Eastern Macedonia and Thrace',1956),(7,'Mainalon','','Peloponnese',2407);
/*!40000 ALTER TABLE `mountain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pointofinterest`
--

DROP TABLE IF EXISTS `pointofinterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pointofinterest` (
  `PointID` smallint(5) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Type` enum('Shelter','Camping','Rest Area','Kiosk','Observation Area','Water Spring') DEFAULT NULL,
  `Longidute` varchar(10) DEFAULT NULL,
  `Latitude` varchar(10) DEFAULT NULL,
  `Mountain` smallint(5) DEFAULT NULL,
  `River` smallint(5) DEFAULT NULL,
  PRIMARY KEY (`PointID`),
  KEY `MountainID_idx` (`Mountain`),
  KEY `RiverID_idx` (`River`),
  CONSTRAINT `4FKMountainID` FOREIGN KEY (`Mountain`) REFERENCES `mountain` (`MountainID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `4FKRiverID` FOREIGN KEY (`River`) REFERENCES `river` (`RiverID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pointofinterest`
--

LOCK TABLES `pointofinterest` WRITE;
/*!40000 ALTER TABLE `pointofinterest` DISABLE KEYS */;
INSERT INTO `pointofinterest` VALUES (102,'2010',NULL,NULL,NULL,NULL,NULL,NULL),(104,'3017',NULL,NULL,NULL,NULL,NULL,NULL),(108,'3101',NULL,NULL,NULL,NULL,NULL,NULL),(111,'3018',NULL,NULL,NULL,NULL,NULL,NULL),(115,'3101',NULL,NULL,NULL,NULL,NULL,NULL),(2010,'Piges Voidomati','','Water Spring','39.900.294','20.835.390',3,7829),(3011,'Mpafi','Very good and organized shelter offers also food and beds','Shelter','38.169.288','23.725.899',6,NULL),(3012,'Camping Eleftheris Diaviosis','Very cheap and friendly','Camping','40.500.295','25.605.405',2,NULL),(3014,'Papigiotis','It has a small taverna and a cafe','Rest Area','39.902.676','20.821.047',3,NULL),(3017,'Vikos Viewpoint','Offers a great view and it is close to the village',NULL,'39.950.437','20.707.127',3,7829),(3018,'Kolymbithres','Beautiful point you can swim at the waterfalls',NULL,'39.972.627','20.726.075',3,NULL),(3100,'Katafygio SEO','Small rest area that offers food and beds',NULL,'40.094.799','22.361.691',1,NULL),(3101,'Skala','One of the peaks of the mountain',NULL,'40.082.841','22.357.070',1,NULL);
/*!40000 ALTER TABLE `pointofinterest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `river`
--

DROP TABLE IF EXISTS `river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `river` (
  `RiverID` smallint(5) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Region` enum('Attica','Central Greece','Central Macedonia','Crete','Eastern Macedonia and Thrace','Epirus','Ionian Islands','North Aegean','Peloponnese','South Aegean','Thessaly','Western Greece','Western Macedonia') DEFAULT NULL,
  `Length` float DEFAULT NULL,
  PRIMARY KEY (`RiverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `river`
--

LOCK TABLES `river` WRITE;
/*!40000 ALTER TABLE `river` DISABLE KEYS */;
INSERT INTO `river` VALUES (7019,'Pinios','','Thessaly',205),(7129,'Acheloos','','Western Greece',220),(7230,'Arachtos','','Epirus',110),(7294,'Evros','Greek-Turkish Border','Eastern Macedonia and Thrace',480),(7577,'Alfios','','Peloponnese',110),(7819,'Aliakmon','','Central Macedonia',297),(7829,'Voidomatis','','Epirus',15),(7944,'Strymon','','Eastern Macedonia and Thrace',415),(7962,'Axios','Or Vardaris','Central Macedonia',388);
/*!40000 ALTER TABLE `river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trail`
--

DROP TABLE IF EXISTS `trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trail` (
  `TrailID` smallint(5) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Description` varchar(500) DEFAULT NULL,
  `Level` enum('Easy','Medium','Hard') DEFAULT NULL,
  `Length` float DEFAULT NULL,
  `Duration` float DEFAULT NULL,
  PRIMARY KEY (`TrailID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trail`
--

LOCK TABLES `trail` WRITE;
/*!40000 ALTER TABLE `trail` DISABLE KEYS */;
INSERT INTO `trail` VALUES (102,'Kathisma Apollou(M22)','Very good and easy trail to go with your family and children','Easy',2.35,60),(104,'Gria Vathra','You can visit the beautiful lakes that are at this trail','Medium',1.08,50),(108,'Mytikas Climb','Visit the highest peak of Greece','Medium',5,240),(111,'Profitis Ilias','Very hard trail but with good view','Hard',3.4,180),(115,'E5','Very good and signaled trail','Easy',8,300);
/*!40000 ALTER TABLE `trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trail_has_mountain`
--

DROP TABLE IF EXISTS `trail_has_mountain`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trail_has_mountain` (
  `Trail` smallint(5) NOT NULL,
  `Mountain` smallint(5) NOT NULL,
  PRIMARY KEY (`Trail`,`Mountain`),
  KEY `MountainID_idx` (`Mountain`),
  CONSTRAINT `5FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `5FKMountainID` FOREIGN KEY (`Mountain`) REFERENCES `mountain` (`MountainID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trail_has_mountain`
--

LOCK TABLES `trail_has_mountain` WRITE;
/*!40000 ALTER TABLE `trail_has_mountain` DISABLE KEYS */;
INSERT INTO `trail_has_mountain` VALUES (104,3),(108,1),(111,1),(115,1);
/*!40000 ALTER TABLE `trail_has_mountain` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trail_has_pointofinterest`
--

DROP TABLE IF EXISTS `trail_has_pointofinterest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trail_has_pointofinterest` (
  `Trail` smallint(5) NOT NULL,
  `Point` smallint(5) NOT NULL,
  PRIMARY KEY (`Trail`,`Point`),
  KEY `PointID_idx` (`Point`),
  CONSTRAINT `6FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `6FKPointID` FOREIGN KEY (`Point`) REFERENCES `pointofinterest` (`PointID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trail_has_pointofinterest`
--

LOCK TABLES `trail_has_pointofinterest` WRITE;
/*!40000 ALTER TABLE `trail_has_pointofinterest` DISABLE KEYS */;
INSERT INTO `trail_has_pointofinterest` VALUES (102,2010),(104,3017),(108,3100),(108,3101),(111,3014),(111,3018),(115,3101);
/*!40000 ALTER TABLE `trail_has_pointofinterest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trail_has_river`
--

DROP TABLE IF EXISTS `trail_has_river`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trail_has_river` (
  `Trail` smallint(5) NOT NULL,
  `River` smallint(5) NOT NULL,
  PRIMARY KEY (`River`,`Trail`),
  KEY `RiverID_idx` (`River`),
  KEY `7FKTrailID` (`Trail`),
  CONSTRAINT `7FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `7FKRiverID` FOREIGN KEY (`River`) REFERENCES `river` (`RiverID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trail_has_river`
--

LOCK TABLES `trail_has_river` WRITE;
/*!40000 ALTER TABLE `trail_has_river` DISABLE KEYS */;
INSERT INTO `trail_has_river` VALUES (111,7829);
/*!40000 ALTER TABLE `trail_has_river` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `trail_m`
--

DROP TABLE IF EXISTS `trail_m`;
/*!50001 DROP VIEW IF EXISTS `trail_m`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trail_m` AS SELECT 
 1 AS `TrailName`,
 1 AS `MountainName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trail_r`
--

DROP TABLE IF EXISTS `trail_r`;
/*!50001 DROP VIEW IF EXISTS `trail_r`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trail_r` AS SELECT 
 1 AS `TrailName`,
 1 AS `RiverName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `trip_poi`
--

DROP TABLE IF EXISTS `trip_poi`;
/*!50001 DROP VIEW IF EXISTS `trip_poi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `trip_poi` AS SELECT 
 1 AS `PointName`,
 1 AS `TrailID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserID` smallint(5) NOT NULL,
  `Username` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `IsAdmin` enum('1','2','3') NOT NULL,
  PRIMARY KEY (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (11,'Mitsakos65','123456789','1'),(12,'Chris_tsaf','123456789','1'),(14,'Eleonorahatzi','eleonora1234','2'),(15,'Pavlos64','12345','3'),(19,'Vasiliaskonstantinos92','kingkostas','3'),(21,'Nik_thequick','panathinaikos','3'),(23,'agiosgeorgiospripri','1234olympiakos','3');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_review_trail`
--

DROP TABLE IF EXISTS `user_review_trail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_review_trail` (
  `RatingID` smallint(5) NOT NULL,
  `User` smallint(5) NOT NULL,
  `Trail` smallint(5) NOT NULL,
  `Rating` enum('1','2','3','4','5') DEFAULT NULL,
  `Description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`RatingID`),
  KEY `UserID_idx` (`User`),
  KEY `TrailID_idx` (`Trail`),
  CONSTRAINT `8FKUserID` FOREIGN KEY (`User`) REFERENCES `user` (`UserID`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `8FKTrailID` FOREIGN KEY (`Trail`) REFERENCES `trail` (`TrailID`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_review_trail`
--

LOCK TABLES `user_review_trail` WRITE;
/*!40000 ALTER TABLE `user_review_trail` DISABLE KEYS */;
INSERT INTO `user_review_trail` VALUES (1110,11,108,'5','Very good trail amazing view. Suitable for experienced trailers.'),(1111,11,111,'4','An amazing trail with good view at the Vikos gorge'),(1112,21,115,'3',NULL);
/*!40000 ALTER TABLE `user_review_trail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'excursiondb'
--

--
-- Dumping routines for database 'excursiondb'
--

--
-- Final view structure for view `trail_m`
--

/*!50001 DROP VIEW IF EXISTS `trail_m`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trail_m` AS select `trail`.`Name` AS `TrailName`,`mountain`.`Name` AS `MountainName` from ((`trail` join `trail_has_mountain` on((`trail`.`TrailID` = `trail_has_mountain`.`Trail`))) join `mountain` on((`mountain`.`MountainID` = `trail_has_mountain`.`Mountain`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trail_r`
--

/*!50001 DROP VIEW IF EXISTS `trail_r`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trail_r` AS select `trail`.`Name` AS `TrailName`,`river`.`Name` AS `RiverName` from ((`trail` join `trail_has_river` on((`trail`.`TrailID` = `trail_has_river`.`Trail`))) join `river` on((`river`.`RiverID` = `trail_has_river`.`River`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `trip_poi`
--

/*!50001 DROP VIEW IF EXISTS `trip_poi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `trip_poi` AS select `pointofinterest`.`Name` AS `PointName`,`hikingclub_organize_trail`.`Trail` AS `TrailID` from ((`pointofinterest` join `trail_has_pointofinterest` on((`pointofinterest`.`PointID` = `trail_has_pointofinterest`.`Point`))) join `hikingclub_organize_trail` on((`hikingclub_organize_trail`.`Trail` = `trail_has_pointofinterest`.`Trail`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 12:07:23
