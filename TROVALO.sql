-- MySQL dump 10.13  Distrib 8.0.25, for Win64 (x86_64)
--
-- Host: localhost    Database: trovalo
-- ------------------------------------------------------
-- Server version	8.0.25

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
-- Table structure for table `cerca`
--

DROP TABLE IF EXISTS `cerca`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cerca` (
  `CF_U` char(13) NOT NULL,
  `CF_mis` char(13) NOT NULL,
  `n_operazione` int NOT NULL,
  PRIMARY KEY (`CF_mis`,`CF_U`),
  KEY `CF_U_idx` (`CF_U`),
  CONSTRAINT `CF_mis` FOREIGN KEY (`CF_mis`) REFERENCES `mis_item` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CF_U` FOREIGN KEY (`CF_U`) REFERENCES `utente` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cerca`
--

LOCK TABLES `cerca` WRITE;
/*!40000 ALTER TABLE `cerca` DISABLE KEYS */;
/*!40000 ALTER TABLE `cerca` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `info_regione`
--

DROP TABLE IF EXISTS `info_regione`;
/*!50001 DROP VIEW IF EXISTS `info_regione`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `info_regione` AS SELECT 
 1 AS `Region_name`,
 1 AS `Regione_num`,
 1 AS `num_responsabile`,
 1 AS `somma_stipendio`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `mis_item`
--

DROP TABLE IF EXISTS `mis_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mis_item` (
  `CF` char(13) NOT NULL,
  `nome` varchar(20) DEFAULT NULL,
  `cognome` varchar(20) DEFAULT NULL,
  `descrizione` varchar(100) DEFAULT NULL,
  `other_id` varchar(30) DEFAULT NULL,
  `regione` int DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mis_item`
--

LOCK TABLES `mis_item` WRITE;
/*!40000 ALTER TABLE `mis_item` DISABLE KEYS */;
INSERT INTO `mis_item` VALUES ('123456789','John','Smith','portafoglio bianca con 500 euro ',NULL,1),('342435321','ziad','salah ','borsa con 300 euro ',NULL,3),('453453453','Joyce','English','passaporto trovato presso l\'universita',NULL,3),('765443254','mohamed','abdelsamei','zaino rosso',NULL,3),('851921232','ahmed','salah','portafoglio con documenti','er32432',1),('888665555','James','Borg','zaino piena dei quaderni ','1234512',2);
/*!40000 ALTER TABLE `mis_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `responsabile`
--

DROP TABLE IF EXISTS `responsabile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `responsabile` (
  `id` varchar(15) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `stipendio` decimal(10,2) DEFAULT NULL,
  `d_nascita` date DEFAULT NULL,
  `Numero_R` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Numero_R_idx` (`Numero_R`),
  CONSTRAINT `Numero_R` FOREIGN KEY (`Numero_R`) REFERENCES `sede_regione` (`numero`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `responsabile`
--

LOCK TABLES `responsabile` WRITE;
/*!40000 ALTER TABLE `responsabile` DISABLE KEYS */;
INSERT INTO `responsabile` VALUES ('1abc','Alice','Bianco',1233.00,'1988-12-30',1),('1dfg','Elizabeth','Rosso ',1000.00,'1967-05-05',1),('1erw','francesco','totti ',1111.00,'1985-05-14',1),('2ggd','Abdelsamei','Neri',2143.00,'1942-02-28',2),('2qwe','Michael','Nero',1200.00,'1988-01-04',2),('2tre','Alice','Grigio',1320.00,'1986-04-05',2),('3hgf','Joy','Giallo ',2210.00,'1968-05-03',3),('3vcb','Abner','Bianschi ',3215.00,'1983-10-25',3);
/*!40000 ALTER TABLE `responsabile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sede_regione`
--

DROP TABLE IF EXISTS `sede_regione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sede_regione` (
  `numero` int NOT NULL,
  `indrizzio` varchar(50) DEFAULT NULL,
  `nome` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`numero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sede_regione`
--

LOCK TABLES `sede_regione` WRITE;
/*!40000 ALTER TABLE `sede_regione` DISABLE KEYS */;
INSERT INTO `sede_regione` VALUES (1,'12 via calabria','Calabria'),(2,'43 via ferrara','Toscana'),(3,'34 via francia','Lombardia'),(4,'95 via cairo','Piomonte');
/*!40000 ALTER TABLE `sede_regione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `supervisione`
--

DROP TABLE IF EXISTS `supervisione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supervisione` (
  `CF_user` char(13) NOT NULL,
  `CF_misitem` char(13) NOT NULL,
  `ID_R` varchar(15) NOT NULL,
  PRIMARY KEY (`CF_user`,`CF_misitem`,`ID_R`),
  KEY `CF_misitem_idx` (`CF_misitem`),
  KEY `ID_R_idx` (`ID_R`),
  CONSTRAINT `CF_misitem` FOREIGN KEY (`CF_misitem`) REFERENCES `mis_item` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `CF_user` FOREIGN KEY (`CF_user`) REFERENCES `utente` (`CF`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `ID_R` FOREIGN KEY (`ID_R`) REFERENCES `responsabile` (`id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supervisione`
--

LOCK TABLES `supervisione` WRITE;
/*!40000 ALTER TABLE `supervisione` DISABLE KEYS */;
/*!40000 ALTER TABLE `supervisione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utente`
--

DROP TABLE IF EXISTS `utente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `utente` (
  `CF` char(13) NOT NULL,
  `UN` varchar(15) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `cognome` varchar(20) NOT NULL,
  `pass_hash` varchar(20) NOT NULL,
  `cell.` int NOT NULL,
  `email` varchar(45) DEFAULT NULL,
  `target` int DEFAULT NULL,
  `regione` int DEFAULT NULL,
  PRIMARY KEY (`CF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utente`
--

LOCK TABLES `utente` WRITE;
/*!40000 ALTER TABLE `utente` DISABLE KEYS */;
INSERT INTO `utente` VALUES ('123456789','john123','John','Smith','rEK1ec',396783333,'john@smith.com',2,1),('333445555','frnkln12','Franklin','Wong','0AyUur',392214444,'wong@wong.com',3,2),('453453453','joyce12','Joyce','English','qiyh4XP',392445555,'engli@eng.com',5,3),('666884444','ramesh13','Ramesh','Narayan','R7OM4',395642222,'naryan@dre.com',1,3),('888665555','james123','James','Borg','AdLnLjQ',397651111,'borg@james.com',6,2),('987987987','ahmed123','Ahmad','Jabbar','MnfsQ4iZ',392136666,'ahmed@jaber.com',3,2);
/*!40000 ALTER TABLE `utente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `info_regione`
--

/*!50001 DROP VIEW IF EXISTS `info_regione`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `info_regione` (`Region_name`,`Regione_num`,`num_responsabile`,`somma_stipendio`) AS select `sede_regione`.`nome` AS `nome`,`sede_regione`.`numero` AS `numero`,count(0) AS `count(*)`,sum(`responsabile`.`stipendio`) AS `sum(stipendio)` from (`sede_regione` join `responsabile` on((`responsabile`.`Numero_R` = `sede_regione`.`numero`))) group by `sede_regione`.`nome`,`sede_regione`.`numero` */;
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

-- Dump completed on 2021-07-10 18:07:44
