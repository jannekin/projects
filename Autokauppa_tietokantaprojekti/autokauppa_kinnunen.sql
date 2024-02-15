CREATE DATABASE  IF NOT EXISTS `autokauppa` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `autokauppa`;
-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: autokauppa
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `asiakas`
--

DROP TABLE IF EXISTS `asiakas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asiakas` (
  `asiakas_id` int NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) NOT NULL,
  `puhelinnumero` varchar(20) NOT NULL,
  `sahkoposti` varchar(45) NOT NULL,
  PRIMARY KEY (`asiakas_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asiakas`
--

LOCK TABLES `asiakas` WRITE;
/*!40000 ALTER TABLE `asiakas` DISABLE KEYS */;
INSERT INTO `asiakas` VALUES (1,'Ismo Laitela','045 444 5555','ismo.laitela@mail.com'),(2,'Anna Mustonen','050 123 4567','anna.mustonen@mail.com'),(3,'Mikko Mäkinen','040 555 2222','mikko.makinen@mail.com'),(4,'Jenni Jokinen','045 222 3333','jenni.jokinen@mail.com'),(5,'Pekka Peltola','050 111 2222','pekka.peltola@mail.com'),(6,'Tiina Talvitie','045 555 4444','tiina.talvitie@mail.com'),(7,'Markus Mäkelä','040 444 7777','markus.makela@mail.com'),(8,'Sari Saari','050 678 1234','sari.saari@mail.com'),(9,'Janne Järvinen','045 777 8888','janne.jarvinen@mail.com'),(10,'Heli Hakala','050 321 6549','heli.hakala@mail.com');
/*!40000 ALTER TABLE `asiakas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auto`
--

DROP TABLE IF EXISTS `auto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auto` (
  `auto_id` int NOT NULL AUTO_INCREMENT,
  `merkki` varchar(45) NOT NULL,
  `malli` varchar(45) NOT NULL,
  `vuosimalli` int NOT NULL,
  `kilometrit` int NOT NULL,
  `reknro` varchar(7) NOT NULL,
  `huoltotarve` varchar(255) DEFAULT '0',
  `hinta` int NOT NULL,
  `toimipiste_id` int NOT NULL,
  PRIMARY KEY (`auto_id`),
  KEY `fk_auto_toimipiste_idx` (`toimipiste_id`),
  CONSTRAINT `fk_auto_toimipiste` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auto`
--

LOCK TABLES `auto` WRITE;
/*!40000 ALTER TABLE `auto` DISABLE KEYS */;
INSERT INTO `auto` VALUES (1,'Skoda','Octavia',2014,90000,'NUB-420','Huollettu 5.4.2023',14000,1),(2,'Toyota','Corolla',2018,65000,'ERU-768','Huollettu 2.5.2023',16000,2),(3,'Ford','Focus',2015,80000,'LPM-532','Renkaanvaihto',12000,1),(4,'Volkswagen','Golf',2016,70000,'BAX-225','Huollettu 3.5.2023',15000,3),(5,'Audi','A4',2017,80000,'SGX-987','Öljynvaihto',18000,2),(6,'Opel','Astra',2018,95000,'FES-345','Huollettu 7.5.2023',11000,1),(7,'Mercedes-Benz','C200',2015,90000,'VAK-542','Renkaanvaihto',20000,3),(8,'BMW','320i',2016,75000,'JMX-123','Huollettu 1.4.2023',22000,2),(9,'Hyundai','i30',2013,100000,'KNJ-765','Takavalojen vaihto',9000,1),(10,'Renault','Megane',2017,65000,'YGD-654','Huollettu 10.5.2023',13000,3);
/*!40000 ALTER TABLE `auto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myyja`
--

DROP TABLE IF EXISTS `myyja`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myyja` (
  `myyja_id` int NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) NOT NULL,
  `puhelinnumero` varchar(20) NOT NULL,
  `sahkoposti` varchar(45) NOT NULL,
  `toimipiste_id` int NOT NULL,
  PRIMARY KEY (`myyja_id`),
  KEY `fk_myyja_toimipiste_idx` (`toimipiste_id`),
  CONSTRAINT `fk_myyja_toimipiste` FOREIGN KEY (`toimipiste_id`) REFERENCES `toimipiste` (`toimipiste_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myyja`
--

LOCK TABLES `myyja` WRITE;
/*!40000 ALTER TABLE `myyja` DISABLE KEYS */;
INSERT INTO `myyja` VALUES (1,'Aleksi Hatsune','040 123 4567','aleksi.hatsune@jannenauto.fi',1),(2,'Arttu Pulkkinen','040 222 2444','arttu.pulkkinen@jannenauto.fi',3),(3,'Juhani Sigma','045 420 1691','juhani.sigma@autokeidas.fi',2),(4,'Aku Pulkkensdorf','050 404 4222','aku.pulkkensdorf@autokeidas.fi',2),(5,'Maili Sairus','040 152 5252','maili.sairus@jannenauto.fi',1),(6,'Jarkko Niemeläinen','050 420 1110','jarkko.niemelainen@jannenauto.fi',3),(7,'Hilla Kinnunen','050 130 1760','hilla.kinnunen@jannenauto.fi',3),(8,'Seppo Ilmarinen','045 235 9898','seppo.ilmarinen@jannenauto.fi',1),(9,'Santeri Kinnunen','040 111 5678','santeri.kinnunen@autokeidas.fi',2);
/*!40000 ALTER TABLE `myyja` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `myyntitapahtumat`
--

DROP TABLE IF EXISTS `myyntitapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `myyntitapahtumat` (
  `myyntitapahtumat_id` int NOT NULL AUTO_INCREMENT,
  `auto_id` int NOT NULL,
  `myyja_id` int NOT NULL,
  `asiakas_id` int NOT NULL,
  `myyntihinta` int NOT NULL,
  `myyntipvm` varchar(15) NOT NULL,
  PRIMARY KEY (`myyntitapahtumat_id`),
  KEY `fk_myyntitapahtumat_auto_idx` (`auto_id`),
  KEY `fk_myyntitapahtumat_myyja_idx` (`myyja_id`),
  KEY `fk_myyntitapahtumat_ostaja_idx` (`asiakas_id`),
  CONSTRAINT `fk_myyntitapahtumat_asiakas` FOREIGN KEY (`asiakas_id`) REFERENCES `asiakas` (`asiakas_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_myyntitapahtumat_auto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `fk_myyntitapahtumat_myyja` FOREIGN KEY (`myyja_id`) REFERENCES `myyja` (`myyja_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `myyntitapahtumat`
--

LOCK TABLES `myyntitapahtumat` WRITE;
/*!40000 ALTER TABLE `myyntitapahtumat` DISABLE KEYS */;
INSERT INTO `myyntitapahtumat` VALUES (1,2,3,5,13500,'1.5.2023'),(2,8,3,4,22000,'9.5.2023'),(3,6,1,9,10000,'10.5.2023'),(4,4,2,1,10000,'10.3.2023'),(5,10,2,10,12000,'10.5.2023'),(6,7,6,6,19500,'7.5.2023');
/*!40000 ALTER TABLE `myyntitapahtumat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ostotapahtumat`
--

DROP TABLE IF EXISTS `ostotapahtumat`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ostotapahtumat` (
  `ostotapahtumat_id` int NOT NULL AUTO_INCREMENT,
  `ostohinta` int NOT NULL,
  `ostopvm` varchar(15) NOT NULL,
  `auto_id` int NOT NULL,
  PRIMARY KEY (`ostotapahtumat_id`),
  KEY `fk_ostotapahtumat_auto_idx` (`auto_id`),
  CONSTRAINT `fk_ostotapahtumat_auto` FOREIGN KEY (`auto_id`) REFERENCES `auto` (`auto_id`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ostotapahtumat`
--

LOCK TABLES `ostotapahtumat` WRITE;
/*!40000 ALTER TABLE `ostotapahtumat` DISABLE KEYS */;
INSERT INTO `ostotapahtumat` VALUES (1,10000,'4.4.2023',1),(3,11000,'20.4.2023',2),(4,9500,'1.3.2023',3),(5,10000,'7.3.2023',4),(6,8500,'30.3.2023',5),(7,1500,'30.4.2023',6),(8,17500,'1.5.2023',7),(9,15500,'5.5.2023',8),(10,5700,'9.5.2023',9),(11,2500,'2.2.2023',10);
/*!40000 ALTER TABLE `ostotapahtumat` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `toimipiste`
--

DROP TABLE IF EXISTS `toimipiste`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `toimipiste` (
  `toimipiste_id` int NOT NULL AUTO_INCREMENT,
  `nimi` varchar(45) NOT NULL,
  `osoite` varchar(45) NOT NULL,
  PRIMARY KEY (`toimipiste_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `toimipiste`
--

LOCK TABLES `toimipiste` WRITE;
/*!40000 ALTER TABLE `toimipiste` DISABLE KEYS */;
INSERT INTO `toimipiste` VALUES (1,'Jannen Auto Järvenpää','Vanha valtatie 69, 04460 Järvenpää'),(2,'Autokeidas Kinnunen','Linnanrakentajantie 7, 00810 Helsinki'),(3,'Jannen Auto Riihimäki','Oikokatu 2, 11130 Riihimäki');
/*!40000 ALTER TABLE `toimipiste` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-09 15:20:18
