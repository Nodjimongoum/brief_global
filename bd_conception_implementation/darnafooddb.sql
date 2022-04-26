CREATE DATABASE  IF NOT EXISTS `darnafooddb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `darnafooddb`;
-- MySQL dump 10.13  Distrib 8.0.28, for Linux (x86_64)
--
-- Host: localhost    Database: darnafooddb
-- ------------------------------------------------------
-- Server version	8.0.28-0ubuntu0.20.04.3

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
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `addresse` varchar(155) NOT NULL,
  `sexe` char(1) DEFAULT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Claver','Ridina','M','00235 66010101'),(2,'Yabo','Kabalaye','M','00235 66020202'),(3,'Gerard','Dembe','M','00235 66030303'),(4,'Anne','Atrone','F','00235 66040404'),(5,'Sophie','Moursal','F','00235 66050505'),(6,'Ghislaine','Abena','F','00235 66060606'),(7,'Tamia','Diguel','F','00235 66070707'),(8,'Abdel','Gassi','M','00235 66080808'),(9,'Yaya','Farcha','M','00235 66090909');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livraison`
--

DROP TABLE IF EXISTS `livraison`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livraison` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `libelle` varchar(150) NOT NULL,
  `id_produit` int unsigned NOT NULL,
  `id_client` int unsigned NOT NULL,
  `id_livreur` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id1` (`id`,`id_produit`),
  KEY `tbl_produit` (`id_produit`),
  KEY `id2` (`id`,`id_client`),
  KEY `tbl_client` (`id_client`),
  KEY `id3` (`id`,`id_livreur`),
  KEY `tbl_livreur` (`id_livreur`),
  CONSTRAINT `tbl_client` FOREIGN KEY (`id_client`) REFERENCES `client` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_livreur` FOREIGN KEY (`id_livreur`) REFERENCES `livreur` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tbl_produit` FOREIGN KEY (`id_produit`) REFERENCES `produit` (`id_produit`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livraison`
--

LOCK TABLES `livraison` WRITE;
/*!40000 ALTER TABLE `livraison` DISABLE KEYS */;
/*!40000 ALTER TABLE `livraison` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `livreur` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nom` varchar(150) NOT NULL,
  `addresse` varchar(155) NOT NULL,
  `tel` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `livreur`
--

LOCK TABLES `livreur` WRITE;
/*!40000 ALTER TABLE `livreur` DISABLE KEYS */;
INSERT INTO `livreur` VALUES (1,'Fall','Bakara','00235 66000001'),(2,'Kone','Boudabagar','00235 66000002'),(3,'Anouska','Mardjandafac','00235 66000003');
/*!40000 ALTER TABLE `livreur` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produit` (
  `id_produit` int unsigned NOT NULL AUTO_INCREMENT,
  `nom_produit` varchar(150) NOT NULL,
  `description` text,
  `prix` varchar(20) NOT NULL,
  `quantite` varchar(20) NOT NULL,
  `date_peremption` varchar(45) NOT NULL,
  PRIMARY KEY (`id_produit`),
  UNIQUE KEY `id_produit_UNIQUE` (`id_produit`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Piment','epice pour accompagner les repas','1000','5','31-12-2025'),(2,'Nere','epice pour assaisonner les repas','1000','10','30-08-2024'),(3,'Granules','a consommer avec eau chaude comme le the et eau fraiche comme du jus','2000','6','31-12-2026'),(4,'Viande','precuit pour la consommation','2500','8','31-12-2023'),(5,'Spirilune','complement alimentaire','1500','5','31-12-2025');
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-26  9:39:46
