-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: sqlcommerce
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categorie`
--

DROP TABLE IF EXISTS `categorie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categorie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomcategorie` varchar(255) DEFAULT NULL,
  `descriptioncategorie` varchar(255) DEFAULT NULL,
  `utilisateuradmin_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `utilisateuradmin_id` (`utilisateuradmin_id`),
  CONSTRAINT `categorie_ibfk_1` FOREIGN KEY (`utilisateuradmin_id`) REFERENCES `utilisateuradmin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categorie`
--

LOCK TABLES `categorie` WRITE;
/*!40000 ALTER TABLE `categorie` DISABLE KEYS */;
INSERT INTO `categorie` VALUES (1,'Electronique','Appareils et systèmes fonctionnant grâce a des composants électroniques',1),(2,'Fruits','Produits naturels délicieux et nutritifs',1),(3,'Légumes','Eléments essentiels d\'une alimentation',1),(4,'Fourniture de Bureau','Articles nécessaires pour les activités professionnels et éducatives',1),(5,'Vêtements et accessoirs','Articles portées sur le corps',1);
/*!40000 ALTER TABLE `categorie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomclient` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `adresselivraison` varchar(255) DEFAULT NULL,
  `numtelephone` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES (1,'Kwesi','kwesi@example.com','Tanambao 5','+261340000000'),(2,'Isabel','isabel@example.com','Barikadimy','+261330000000'),(3,'Idriss','idriss@example.com','Mangarano II','+261320000000'),(4,'Marc','marc@example.com','Andranomadio','+261341111111'),(5,'Ntsay','ntsay@example.com','Tanambao 2','+261331111111'),(6,'Jean','jean@example.com','Mangarano I','+261321111111'),(7,'Andry','andry@example.com','Toamasina','+261332200000'),(8,'Hery','hery@example.com','Mangarano II','+261332200000'),(9,'Ratsiraka','ratsiraka@example.com','Tomasina','+261322200000');
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `commande`
--

DROP TABLE IF EXISTS `commande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `commande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datecommande` datetime DEFAULT NULL,
  `etatcommande` varchar(50) DEFAULT NULL,
  `client_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `client_id` (`client_id`),
  CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `commande`
--

LOCK TABLES `commande` WRITE;
/*!40000 ALTER TABLE `commande` DISABLE KEYS */;
INSERT INTO `commande` VALUES (1,'2023-10-15 10:25:00','En cours',1),(2,'2023-10-13 14:25:00','Livré',1),(3,'2023-10-17 08:30:00','En attente',3),(4,'2023-10-15 10:28:00','En cours',4),(5,'2023-10-15 10:20:00','En cours',5),(6,'2023-10-13 14:25:00','Livré',6),(7,'2023-10-16 08:30:00','En attente',7),(8,'2023-10-15 10:27:00','Annulé',4),(9,'2023-10-14 09:30:00','Livré',8),(10,'2023-10-15 10:30:00','En attente',9);
/*!40000 ALTER TABLE `commande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produit`
--

DROP TABLE IF EXISTS `produit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produit` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomproduit` varchar(255) DEFAULT NULL,
  `descriptionproduit` varchar(255) DEFAULT NULL,
  `prix` varchar(255) DEFAULT NULL,
  `stock` varchar(255) DEFAULT NULL,
  `categorie_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categorie_id` (`categorie_id`),
  CONSTRAINT `produit_ibfk_1` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produit`
--

LOCK TABLES `produit` WRITE;
/*!40000 ALTER TABLE `produit` DISABLE KEYS */;
INSERT INTO `produit` VALUES (1,'Smartphones','Téléphones mobile dotés de fonctionnalités avancées','150000Ar','50 pièces',1),(2,'Ordinateur','Dispositif éléctronique capable déxecuter divers tâche','500000Ar','25 pièces',1),(3,'Tablette','Appareils portable qui se situe entre les smartphone et les ordinateur portable','200000Ar','10 pièces',1),(4,'Appareil photo','Dispositif électronique utilisés pour capturer des images ou vidéo','20 pièces','10',1),(5,'Mangue','Fruits tropicaux sucrés et crémeux','3000Ar','60kg',2),(6,'Orange','Acidulés, source élevé de vitamine C','2000Ar','20kg',2),(7,'Bananas','Fruits doux et énergétiques, riche en potassium','1500Ar','10 kg',2),(8,'Cahier','Livres à pages blanche et lignées pour écrire','1500Ar','20 paquets',3),(9,'Crayons','Pour dessiner ou écrire','500Ar','2 Boites',3),(10,'Gommes','Pour effacer le crayon','300Ar','15 pièces',3),(11,'Chemise','Vêtements à manches pour le haut du corps','20000Ar','2 Bal',5),(12,'Robes','Vêtements d\'une seule pièce','20000Ar','3 pièces',5),(13,'Jupes','Forme de tube','15000Ar','10 pièces',5),(14,'Cravates','Autour du cou, souvent avec des costumes','5000 Ar','20 pièces',5);
/*!40000 ALTER TABLE `produit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produitcommande`
--

DROP TABLE IF EXISTS `produitcommande`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produitcommande` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `quantite` varchar(255) DEFAULT NULL,
  `produit_id` int(11) DEFAULT NULL,
  `commande_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `produit_id` (`produit_id`),
  KEY `commande_id` (`commande_id`),
  CONSTRAINT `produitcommande_ibfk_1` FOREIGN KEY (`produit_id`) REFERENCES `produit` (`id`),
  CONSTRAINT `produitcommande_ibfk_2` FOREIGN KEY (`commande_id`) REFERENCES `commande` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produitcommande`
--

LOCK TABLES `produitcommande` WRITE;
/*!40000 ALTER TABLE `produitcommande` DISABLE KEYS */;
INSERT INTO `produitcommande` VALUES (1,'3',1,1),(2,'1',2,1),(3,'1',3,1),(4,'1',4,1),(5,'3 kg',5,4),(6,'2 kg',6,4),(7,'1',7,5),(8,'2 paquets',8,5),(9,'2 Boite',9,6),(10,'5 pièces',10,6),(11,'1 Bal',11,7),(12,'1',12,9),(13,'3',13,9),(14,'10',14,7),(15,'3 kg',5,8),(16,'1',3,2),(17,'1',1,2),(18,'1',2,2);
/*!40000 ALTER TABLE `produitcommande` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `utilisateuradmin`
--

DROP TABLE IF EXISTS `utilisateuradmin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `utilisateuradmin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomutilisateur` varchar(255) DEFAULT NULL,
  `motdepasse` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `utilisateuradmin`
--

LOCK TABLES `utilisateuradmin` WRITE;
/*!40000 ALTER TABLE `utilisateuradmin` DISABLE KEYS */;
INSERT INTO `utilisateuradmin` VALUES (1,'Davida','passwords','admin');
/*!40000 ALTER TABLE `utilisateuradmin` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16  3:13:44
