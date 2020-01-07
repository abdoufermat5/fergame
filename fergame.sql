-- MySQL dump 10.13  Distrib 8.0.18, for Win64 (x86_64)
--
-- Host: localhost    Database: fergame
-- ------------------------------------------------------
-- Server version	8.0.18

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
-- Table structure for table `appartient_elite`
--

DROP TABLE IF EXISTS `appartient_elite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appartient_elite` (
  `id_perso` tinyint(3) unsigned NOT NULL,
  `nom_elite` varchar(75) NOT NULL,
  KEY `id_perso` (`id_perso`),
  KEY `nom_elite` (`nom_elite`),
  CONSTRAINT `appartient_elite_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id_perso`),
  CONSTRAINT `appartient_elite_ibfk_2` FOREIGN KEY (`nom_elite`) REFERENCES `elite` (`nom_elite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appartient_elite`
--

LOCK TABLES `appartient_elite` WRITE;
/*!40000 ALTER TABLE `appartient_elite` DISABLE KEYS */;
INSERT INTO `appartient_elite` VALUES (1,'THE WU ASSASSIN'),(10,'THE WU ASSASSIN'),(6,'Killers'),(2,'Killers'),(3,'Killers'),(4,'Killers'),(7,'La SECTE'),(9,'La SECTE'),(11,'La SECTE'),(8,'La SECTE');
/*!40000 ALTER TABLE `appartient_elite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arme`
--

DROP TABLE IF EXISTS `arme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `arme` (
  `code_arme` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `type` set('fusil','epee','mitrailleuse','pistolet','lance-roquette','fusil-precision','missile') NOT NULL,
  `xps_coup` int(10) unsigned NOT NULL,
  `prix_A` decimal(9,2) NOT NULL,
  `nom_A` varchar(50) NOT NULL,
  PRIMARY KEY (`code_arme`)
) ENGINE=InnoDB AUTO_INCREMENT=1026 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arme`
--

LOCK TABLES `arme` WRITE;
/*!40000 ALTER TABLE `arme` DISABLE KEYS */;
INSERT INTO `arme` VALUES (404,'epee',70,8000.00,'Excalibur'),(405,'epee',70,10000.00,'Blue Rose Sword'),(501,'mitrailleuse',100,9500.00,'PKM'),(502,'mitrailleuse',105,9700.00,'M240'),(604,'pistolet',100,7000.00,'Beretta 92'),(605,'pistolet',105,7400.00,'Colt_45'),(606,'pistolet',110,7800.00,'Colt M1911'),(607,'pistolet',1000,100000.00,'Desert EAGLE'),(701,'lance-roquette',1000,100000.00,'AT-4'),(805,'fusil',50,7500.00,'AK-47'),(806,'fusil',90,8500.00,'M 16'),(807,'fusil',100,10000.00,'KALACHNIKOV RPK'),(901,'fusil-precision',1000,100000.00,'SIG 550 SNIPER'),(902,'fusil-precision',1050,105000.00,'M24 SWS'),(903,'fusil-precision',1000,100000.00,'VKS'),(1024,'missile',2000,1000000.00,'SS-9 SCARP'),(1025,'missile',2500,1500000.00,'SS-18 SATAN');
/*!40000 ALTER TABLE `arme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dispose_equipement`
--

DROP TABLE IF EXISTS `dispose_equipement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dispose_equipement` (
  `id_equipement` int(10) unsigned NOT NULL,
  `id_perso` tinyint(3) unsigned NOT NULL,
  KEY `id_equipement` (`id_equipement`),
  KEY `id_perso` (`id_perso`),
  CONSTRAINT `dispose_equipement_ibfk_1` FOREIGN KEY (`id_equipement`) REFERENCES `equipement` (`id_equipement`),
  CONSTRAINT `dispose_equipement_ibfk_2` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id_perso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dispose_equipement`
--

LOCK TABLES `dispose_equipement` WRITE;
/*!40000 ALTER TABLE `dispose_equipement` DISABLE KEYS */;
INSERT INTO `dispose_equipement` VALUES (1005,1),(1005,2),(1001,2),(1002,2),(1001,3),(1005,3),(1003,3),(1004,3),(1001,4),(1002,4),(1003,4),(1005,4),(1005,5),(1002,6),(1003,6),(1004,6),(1005,6),(1005,7),(1005,8),(1005,9),(1001,10),(1004,10),(1005,10),(1001,11),(1002,11),(1004,11),(1005,11);
/*!40000 ALTER TABLE `dispose_equipement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elite`
--

DROP TABLE IF EXISTS `elite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elite` (
  `nom_elite` varchar(75) NOT NULL,
  `specialite` set('arme','epee','arme+epee','art martial','arme+art martial','art martial+epee','arme+epee+art martial') NOT NULL,
  `nbre_perso` tinyint(4) NOT NULL DEFAULT '4',
  PRIMARY KEY (`nom_elite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elite`
--

LOCK TABLES `elite` WRITE;
/*!40000 ALTER TABLE `elite` DISABLE KEYS */;
INSERT INTO `elite` VALUES ('Killers','arme+art martial',4),('La SECTE','arme',4),('THE WU ASSASSIN','art martial+epee',2);
/*!40000 ALTER TABLE `elite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `equipement`
--

DROP TABLE IF EXISTS `equipement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipement` (
  `id_equipement` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `outils` varchar(255) NOT NULL,
  `poids` set('leger','moyen','lourd','mega-lourd','titanesque') NOT NULL,
  `prix` decimal(9,2) unsigned NOT NULL,
  `resistance` smallint(5) unsigned NOT NULL,
  PRIMARY KEY (`id_equipement`)
) ENGINE=InnoDB AUTO_INCREMENT=1006 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipement`
--

LOCK TABLES `equipement` WRITE;
/*!40000 ALTER TABLE `equipement` DISABLE KEYS */;
INSERT INTO `equipement` VALUES (1001,'Combinaison US-AIR FORCE MaxQ','lourd',100000.00,50),(1002,'gilet pare balle','leger',20000.00,10),(1003,'Trousse Santé','moyen',50000.00,35),(1004,'Bunker','titanesque',1000000.00,1000),(1005,'simple combine','lourd',0.00,5);
/*!40000 ALTER TABLE `equipement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe`
--

DROP TABLE IF EXISTS `groupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupe` (
  `id_groupe` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(30) NOT NULL,
  `nbre_max` tinyint(4) NOT NULL DEFAULT '4',
  PRIMARY KEY (`id_groupe`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe`
--

LOCK TABLES `groupe` WRITE;
/*!40000 ALTER TABLE `groupe` DISABLE KEYS */;
INSERT INTO `groupe` VALUES (1,'SEAL TEAM',6),(2,'CONDOR',4),(3,'ZERO SOUL',3);
/*!40000 ALTER TABLE `groupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupe_cree`
--

DROP TABLE IF EXISTS `groupe_cree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groupe_cree` (
  `id_groupe` tinyint(3) unsigned DEFAULT NULL,
  `pseudo_joueur` varchar(30) NOT NULL,
  KEY `id_groupe` (`id_groupe`),
  KEY `pseudo_joueur` (`pseudo_joueur`),
  CONSTRAINT `groupe_cree_ibfk_1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`),
  CONSTRAINT `groupe_cree_ibfk_2` FOREIGN KEY (`pseudo_joueur`) REFERENCES `joueur` (`pseudo_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupe_cree`
--

LOCK TABLES `groupe_cree` WRITE;
/*!40000 ALTER TABLE `groupe_cree` DISABLE KEYS */;
INSERT INTO `groupe_cree` VALUES (3,'fermat'),(3,'fode'),(3,'alvin'),(1,'junior'),(1,'abdou'),(1,'baidy'),(1,'edgar'),(1,'adja'),(2,'allan'),(2,'cristiano'),(2,'messi');
/*!40000 ALTER TABLE `groupe_cree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `joueur`
--

DROP TABLE IF EXISTS `joueur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `joueur` (
  `pseudo_joueur` varchar(30) NOT NULL,
  `password` varchar(60) NOT NULL,
  `email` varchar(200) NOT NULL,
  `pays` varchar(45) NOT NULL,
  `points_j` int(11) DEFAULT '1000',
  `date_inscription` datetime NOT NULL,
  `niveau_j` set('Debutant','Moyen','Professionnel','Legende') DEFAULT 'Debutant',
  `fonds` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`pseudo_joueur`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `joueur`
--

LOCK TABLES `joueur` WRITE;
/*!40000 ALTER TABLE `joueur` DISABLE KEYS */;
INSERT INTO `joueur` VALUES ('abdou','Lebron1@','abdou@ept.sn','USA',33255,'2011-12-24 11:05:54','Professionnel',5000000.00),('adja','ada907','ada7@yahoo.com','Senegal',19988,'2017-01-04 06:02:34','Debutant',250000.00),('allan','alpo99$','allie5@hotmail.es','Espagne',57800,'2015-07-14 23:55:46','Professionnel',60000000.00),('alvin','alvi56_@','alvin155@yahoo.fr','France',2500,'2019-01-24 13:35:08','Moyen',14884500.00),('baidy','cr71885','bdsy7@gmail.com','Senegal',62340,'2017-04-04 18:25:48','Professionnel',15000000.00),('cristiano','cr700but','thegoat@gmail.com','Portugal',10090000,'2019-05-14 14:07:01','Legende',475000000.00),('edgar','eddie777','edgar77@hotmail.com','USA',2120000,'2019-10-30 07:56:22','Legende',198885000.00),('fermat','$45_@xyz','fermat@gmail.com','Senegal',975,'2011-11-24 15:35:56','Debutant',240000.00),('fode','21fode','fofo12@gmail.com','Senegal',85440,'2013-09-14 12:45:08','Professionnel',28880000.00),('junior','jun1298','Hisself@hotmail.com','Canada',24885,'2013-11-24 05:35:08','Moyen',6885000.00),('messi','leo101988','leomessi@hotmail.com','Argentine',10035000,'2019-02-13 09:35:45','Legende',525000000.00);
/*!40000 ALTER TABLE `joueur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnage`
--

DROP TABLE IF EXISTS `personnage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personnage` (
  `id_perso` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom_perso` varchar(50) NOT NULL,
  `pseudo_joueur` varchar(30) DEFAULT NULL,
  `niveau_p` set('1','2','3','4','5') NOT NULL,
  `point_vie_restant` int(10) unsigned NOT NULL DEFAULT '100',
  `prix_perso` set('10000','100000','10000000','50000000','75000000') DEFAULT NULL,
  PRIMARY KEY (`id_perso`),
  KEY `pseudo_joueur` (`pseudo_joueur`),
  CONSTRAINT `personnage_ibfk_1` FOREIGN KEY (`pseudo_joueur`) REFERENCES `joueur` (`pseudo_joueur`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnage`
--

LOCK TABLES `personnage` WRITE;
/*!40000 ALTER TABLE `personnage` DISABLE KEYS */;
INSERT INTO `personnage` VALUES (1,'Merlin','junior','2',1450,'100000'),(2,'Dracula','allan','4',5000,'50000000'),(3,'Chuck Norris','edgar','5',7500,'75000000'),(4,'Arnold Swarzi','cristiano','5',8500,'75000000'),(5,'Skywalker','alvin','2',505,'100000'),(6,'Travolta','messi','5',7800,'75000000'),(7,'JCVD','baidy','3',4500,'10000000'),(8,'JACK RYAN','fermat','1',0,'10000'),(9,'Armagedon','adja','2',2500,'100000'),(10,'Asbald','abdou','3',3405,'10000000'),(11,'DROGON','fode','4',4850,'50000000'),(12,'Thor',NULL,'5',100,'75000000'),(13,'Achille',NULL,'3',100,'10000000'),(14,'SKULL',NULL,'4',100,'50000000'),(15,'IronSide',NULL,'1',100,'10000'),(16,'GHOST SNIPER',NULL,'2',100,'100000'),(17,'DARK KILLER',NULL,'5',100,'75000000');
/*!40000 ALTER TABLE `personnage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `possede_arme`
--

DROP TABLE IF EXISTS `possede_arme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `possede_arme` (
  `code_arme` int(10) unsigned NOT NULL,
  `id_perso` tinyint(3) unsigned NOT NULL,
  KEY `id_perso` (`id_perso`),
  KEY `code_arme` (`code_arme`),
  CONSTRAINT `possede_arme_ibfk_1` FOREIGN KEY (`id_perso`) REFERENCES `personnage` (`id_perso`),
  CONSTRAINT `possede_arme_ibfk_2` FOREIGN KEY (`code_arme`) REFERENCES `arme` (`code_arme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `possede_arme`
--

LOCK TABLES `possede_arme` WRITE;
/*!40000 ALTER TABLE `possede_arme` DISABLE KEYS */;
INSERT INTO `possede_arme` VALUES (404,1),(604,1),(606,2),(405,2),(501,2),(605,2),(807,3),(1024,3),(902,3),(1024,4),(901,4),(805,4),(701,4),(805,5),(404,5),(1025,6),(903,6),(701,6),(605,7),(806,7),(604,8),(805,9),(501,9),(404,10),(607,10),(903,11),(701,11),(806,11);
/*!40000 ALTER TABLE `possede_arme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournoi`
--

DROP TABLE IF EXISTS `tournoi`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournoi` (
  `id_tournoi` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `nom_tournoi` varchar(30) NOT NULL,
  `niveau_requis` set('Debutant','Moyen','Professionnelle','Legende') NOT NULL,
  `nbre_max` tinyint(4) NOT NULL DEFAULT '4',
  `etat_t` set('en cours','termine') NOT NULL DEFAULT 'en cours',
  `date_creation` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `date_fin` datetime NOT NULL,
  `prix_vainqueur` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`id_tournoi`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournoi`
--

LOCK TABLES `tournoi` WRITE;
/*!40000 ALTER TABLE `tournoi` DISABLE KEYS */;
INSERT INTO `tournoi` VALUES (1,'DOA','Professionnelle',3,'termine','2019-10-21 15:00:00','2019-10-24 15:00:00',10000000.00),(2,'KILL_OR_DIE','Debutant',7,'en cours','2019-11-30 15:00:00','2019-12-30 15:00:00',1500000.00),(3,'THE_GOAT','Legende',3,'en cours','2019-12-05 15:00:00','2019-12-30 15:00:00',100000000.00);
/*!40000 ALTER TABLE `tournoi` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tournoi_cree`
--

DROP TABLE IF EXISTS `tournoi_cree`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tournoi_cree` (
  `id_tournoi` tinyint(3) unsigned DEFAULT NULL,
  `pseudo_joueur` varchar(30) NOT NULL,
  `points_t` int(10) unsigned NOT NULL DEFAULT '500',
  KEY `id_tournoi` (`id_tournoi`),
  KEY `pseudo_joueur` (`pseudo_joueur`),
  CONSTRAINT `tournoi_cree_ibfk_1` FOREIGN KEY (`id_tournoi`) REFERENCES `tournoi` (`id_tournoi`),
  CONSTRAINT `tournoi_cree_ibfk_2` FOREIGN KEY (`pseudo_joueur`) REFERENCES `joueur` (`pseudo_joueur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tournoi_cree`
--

LOCK TABLES `tournoi_cree` WRITE;
/*!40000 ALTER TABLE `tournoi_cree` DISABLE KEYS */;
INSERT INTO `tournoi_cree` VALUES (1,'abdou',6000),(1,'fode',5400),(1,'allan',7800),(2,'abdou',16805),(2,'junior',17845),(2,'edgar',45000),(2,'adja',19000),(2,'baidy',7500),(3,'cristiano',90000),(3,'messi',85000),(3,'edgar',75000);
/*!40000 ALTER TABLE `tournoi_cree` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zone`
--

DROP TABLE IF EXISTS `zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zone` (
  `id_zone` int(10) unsigned NOT NULL,
  `pays` varchar(30) NOT NULL,
  `continent` set('Afrique','Asie','Europe','Oceanie','Amerique') DEFAULT NULL,
  `nom_elite` varchar(75) NOT NULL,
  PRIMARY KEY (`id_zone`),
  KEY `nom_elite` (`nom_elite`),
  CONSTRAINT `zone_ibfk_1` FOREIGN KEY (`nom_elite`) REFERENCES `elite` (`nom_elite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zone`
--

LOCK TABLES `zone` WRITE;
/*!40000 ALTER TABLE `zone` DISABLE KEYS */;
INSERT INTO `zone` VALUES (47,'France','Europe','La SECTE'),(51,'USA','Amerique','Killers'),(60,'Chine','Asie','THE WU ASSASSIN');
/*!40000 ALTER TABLE `zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-12-13 22:50:50
