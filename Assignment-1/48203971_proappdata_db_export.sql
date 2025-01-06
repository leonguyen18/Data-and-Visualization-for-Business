CREATE DATABASE  IF NOT EXISTS `proappdata` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proappdata`;
-- MySQL dump 10.13  Distrib 8.0.38, for macos14 (arm64)
--
-- Host: localhost    Database: proappdata
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Temporary view structure for view `acceptance_rate_by_experience`
--

DROP TABLE IF EXISTS `acceptance_rate_by_experience`;
/*!50001 DROP VIEW IF EXISTS `acceptance_rate_by_experience`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `acceptance_rate_by_experience` AS SELECT 
 1 AS `Experience_Level`,
 1 AS `Total_Offers`,
 1 AS `Accepted_Offers`,
 1 AS `Acceptance_Rate_Percentage`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `certificates`
--

DROP TABLE IF EXISTS `certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `certificates` (
  `Certificate_ID` int NOT NULL AUTO_INCREMENT,
  `Certificate_Level` enum('Certificate I','Certificate II','Certificate III','Certificate IV') NOT NULL,
  `Certificate_Description` varchar(100) NOT NULL,
  `Validity_Period` int NOT NULL DEFAULT '2',
  `Training_Provider_ID` int NOT NULL,
  PRIMARY KEY (`Certificate_ID`),
  KEY `Training_Provider_ID` (`Training_Provider_ID`),
  CONSTRAINT `certificates_ibfk_1` FOREIGN KEY (`Training_Provider_ID`) REFERENCES `training_providers` (`Training_Provider_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `certificates`
--

LOCK TABLES `certificates` WRITE;
/*!40000 ALTER TABLE `certificates` DISABLE KEYS */;
INSERT INTO `certificates` VALUES (1,'Certificate I','Basic Skills',2,1),(2,'Certificate II','Intermediate Skills',2,1),(3,'Certificate III','Advanced Skills',2,1),(4,'Certificate IV','Master Skills',2,1),(5,'Certificate I','Basic Skills',2,2),(6,'Certificate II','Intermediate Skills',2,2),(7,'Certificate III','Advanced Skills',2,2),(8,'Certificate IV','Master Skills',2,2);
/*!40000 ALTER TABLE `certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customer_satisfaction_ratings_tradesperson_exp`
--

DROP TABLE IF EXISTS `customer_satisfaction_ratings_tradesperson_exp`;
/*!50001 DROP VIEW IF EXISTS `customer_satisfaction_ratings_tradesperson_exp`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_satisfaction_ratings_tradesperson_exp` AS SELECT 
 1 AS `Experience_Level`,
 1 AS `Average_Customer_Rating`,
 1 AS `Number_of_Ratings`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `Customer_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_FName` varchar(50) NOT NULL,
  `Customer_LName` varchar(50) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Registration_Date` date NOT NULL,
  `Postal_Code` varchar(20) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Customer_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'John','Smith','0412345678','john.smith@example.com','2024-01-15','3000','Melbourne','Australia'),(2,'David','Lee','0298765432','david.lee@example.com','2024-03-05','2000','Sydney','Australia'),(3,'Emily','Brown','0887654321','emily.brown@example.com','2024-05-25','5000','Adelaide','Australia'),(4,'Olivia','Martin','0488997766','olivia.martin@example.com','2024-06-02','6000','Perth','Australia'),(5,'Maria','Garcia','+628123456789','maria.garcia@example.co.id','2024-02-20','10110','Jakarta','Indonesia'),(6,'Siti','Nurhaliza','+628987654321','siti.nurhaliza@example.co.id','2024-04-12','40115','Bandung','Indonesia'),(7,'Noah','Wilson','+628899776655','noah.wilson@example.co.id','2024-06-03','40115','Bandung','Indonesia'),(8,'Liam','Nguyen','0414811966','liam.nguyen@example.com','2024-06-01','3000','Melbourne','Australia'),(9,'Emma','Clark','0298765432','emma.clark@example.com','2024-06-04','2000','Sydney','Australia'),(10,'Mason','Lee','+6286655443322','mason.lee@example.co.id','2024-06-05','15156','Tangerang','Indonesia');
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `customers_utilization`
--

DROP TABLE IF EXISTS `customers_utilization`;
/*!50001 DROP VIEW IF EXISTS `customers_utilization`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customers_utilization` AS SELECT 
 1 AS `Customer_ID`,
 1 AS `Customer_Name`,
 1 AS `Registration_Date`,
 1 AS `Tasks_Created`,
 1 AS `Tasks_Completed`,
 1 AS `Tasks_Cancelled`,
 1 AS `First_Transaction_Date`,
 1 AS `Days_to_First_Transaction`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `feedback_between_customers_tradespeople`
--

DROP TABLE IF EXISTS `feedback_between_customers_tradespeople`;
/*!50001 DROP VIEW IF EXISTS `feedback_between_customers_tradespeople`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `feedback_between_customers_tradespeople` AS SELECT 
 1 AS `Offer_ID`,
 1 AS `Experience_Level`,
 1 AS `Rating_for_Customer`,
 1 AS `Rating_for_Tradesperson`,
 1 AS `Feedback_for_Tradesperson`,
 1 AS `Feedback_for_Customer`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `geographical_distribution_with_ratings`
--

DROP TABLE IF EXISTS `geographical_distribution_with_ratings`;
/*!50001 DROP VIEW IF EXISTS `geographical_distribution_with_ratings`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `geographical_distribution_with_ratings` AS SELECT 
 1 AS `City`,
 1 AS `Number_of_Tradespeople`,
 1 AS `Number_of_Customers`,
 1 AS `Tradespeople_Customer_Difference`,
 1 AS `Number_of_Transactions`,
 1 AS `Average_Customer_Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materials`
--

DROP TABLE IF EXISTS `materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materials` (
  `Material_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_ID` int NOT NULL,
  `Material_Name` varchar(100) NOT NULL,
  `Unit` varchar(20) NOT NULL,
  `Unit_Price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Material_ID`),
  KEY `Supplier_ID` (`Supplier_ID`),
  CONSTRAINT `materials_ibfk_1` FOREIGN KEY (`Supplier_ID`) REFERENCES `suppliers` (`Supplier_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materials`
--

LOCK TABLES `materials` WRITE;
/*!40000 ALTER TABLE `materials` DISABLE KEYS */;
INSERT INTO `materials` VALUES (1,1,'Electrical Wires','Meter',2.50),(2,1,'Light Fixtures','Piece',25.00),(3,1,'Timber Planks','Piece',15.00),(4,2,'Door Frames','Piece',200.00),(5,3,'Metal Sheets','Piece',50.00),(6,4,'PVC Pipes','Meter',1.75),(7,5,'Granite Slabs','Square Meter',120.00),(8,4,'Bathroom Fixtures','Set',250.00),(9,6,'Wi-Fi Access Points','Piece',150.00),(10,2,'HVAC Air Filters','Piece',30.00),(11,2,'Refrigerant Coolant','Kilogram',15.00),(12,2,'Thermostat Units','Piece',120.00);
/*!40000 ALTER TABLE `materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `supplier_performance`
--

DROP TABLE IF EXISTS `supplier_performance`;
/*!50001 DROP VIEW IF EXISTS `supplier_performance`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `supplier_performance` AS SELECT 
 1 AS `Supplier_ID`,
 1 AS `Supplier_Name`,
 1 AS `Tasks_Supplied`,
 1 AS `Average_Task_Completion_Time`,
 1 AS `Total_Material_Cost`,
 1 AS `Average_Task_Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suppliers` (
  `Supplier_ID` int NOT NULL AUTO_INCREMENT,
  `Supplier_Name` varchar(100) NOT NULL,
  `Contact_Person` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Registration_Date` date NOT NULL,
  `Postal_Code` varchar(20) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Supplier_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'Melbourne Build Supply','Rebecca Wilson','0399887766','contact@melbuildsupplies.com.au','2023-11-20','3000','Melbourne','Australia'),(2,'Sydney Electrical Wholesale','Peter Evans','0299776655','sales@sydneyelectrical.com.au','2024-01-25','2000','Sydney','Australia'),(3,'Adelaide Metal Works','Steve Harris','0888776655','contact@adelaidemetals.com.au','2024-02-15','5000','Adelaide','Australia'),(4,'Jakarta Hardware','Rahmat Hidayat','+6283344556677','info@jakartahardware.co.id','2023-12-15','10110','Jakarta','Indonesia'),(5,'Bandung Stone Supplies','Dewi Anggraini','+6285566778899','contact@bandungstone.co.id','2024-03-10','40115','Bandung','Indonesia'),(6,'Tangerang Tech Supplies','Siti Nurhayati','+6286677889900','contact@tangerangtech.co.id','2024-05-05','15156','Tangerang','Indonesia');
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `task_materials`
--

DROP TABLE IF EXISTS `task_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `task_materials` (
  `Resource_ID` int NOT NULL AUTO_INCREMENT,
  `Task_ID` int NOT NULL,
  `Material_ID` int NOT NULL,
  `Required_Quantity` decimal(10,2) NOT NULL,
  PRIMARY KEY (`Resource_ID`),
  UNIQUE KEY `Task_ID` (`Task_ID`,`Material_ID`),
  KEY `Material_ID` (`Material_ID`),
  CONSTRAINT `task_materials_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`Task_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `task_materials_ibfk_2` FOREIGN KEY (`Material_ID`) REFERENCES `materials` (`Material_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `task_materials`
--

LOCK TABLES `task_materials` WRITE;
/*!40000 ALTER TABLE `task_materials` DISABLE KEYS */;
INSERT INTO `task_materials` VALUES (1,1,1,200.00),(2,1,2,10.00),(3,2,3,30.00),(4,3,5,5.00),(5,4,2,15.00),(6,5,10,2.00),(7,5,11,5.00),(8,5,12,1.00),(9,6,6,100.00),(10,7,7,15.00),(11,8,2,5.00),(12,9,6,5.00),(13,10,9,3.00);
/*!40000 ALTER TABLE `task_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `Task_ID` int NOT NULL AUTO_INCREMENT,
  `Customer_ID` int NOT NULL,
  `Task_Type` varchar(50) NOT NULL,
  `Details` text,
  `Budget` decimal(10,2) NOT NULL,
  `Task_Status` enum('Open','In Progress','Completed','Cancelled') NOT NULL DEFAULT 'Open',
  `Creation_Date` date NOT NULL,
  PRIMARY KEY (`Task_ID`),
  KEY `Customer_ID` (`Customer_ID`),
  CONSTRAINT `tasks_ibfk_1` FOREIGN KEY (`Customer_ID`) REFERENCES `customers` (`Customer_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
INSERT INTO `tasks` VALUES (1,1,'Electrical','Need to rewire the kitchen and install new outlets.',1500.00,'Completed','2024-06-01'),(2,2,'Carpentry','Build a custom bookshelf for the study room.',1200.00,'Completed','2024-06-10'),(3,3,'Welding','Repair the metal fence in the backyard.',500.00,'Completed','2024-06-20'),(4,8,'Electrical','Install new LED lighting in the living room and kitchen.',1000.00,'Completed','2024-06-06'),(5,4,'HVAC','Service and maintenance of the air conditioning system.',600.00,'Completed','2024-06-07'),(6,5,'Plumbing','Install new pipes for bathroom renovation.',800.00,'Completed','2024-06-05'),(7,6,'Masonry','Install granite countertops in the kitchen.',2000.00,'Completed','2024-06-15'),(8,7,'Electrical','Install new bathroom light fixtures.',700.00,'Completed','2024-06-08'),(9,9,'Plumbing','Fix leaking pipe under the kitchen sink.',300.00,'Cancelled','2024-06-12'),(10,10,'IT Specialist','Set up a home network and configure Wi-Fi access points.',800.00,'Cancelled','2024-06-10');
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tradespeople`
--

DROP TABLE IF EXISTS `tradespeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradespeople` (
  `Tradesperson_ID` int NOT NULL AUTO_INCREMENT,
  `Tradesperson_FName` varchar(50) NOT NULL,
  `Tradesperson_LName` varchar(50) NOT NULL,
  `Occupation` varchar(100) NOT NULL,
  `Experience_Level` enum('Apprentice','Master','Specialist') NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Registration_Date` date NOT NULL,
  `Postal_Code` varchar(20) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Tradesperson_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradespeople`
--

LOCK TABLES `tradespeople` WRITE;
/*!40000 ALTER TABLE `tradespeople` DISABLE KEYS */;
INSERT INTO `tradespeople` VALUES (1,'Michael','Johnson','Electrician','Master','michael.johnson@example.com','0400123456','2023-12-01','3000','Melbourne','Australia'),(2,'Daniel','Harris','Electrician','Apprentice','daniel.harris@example.com','0455667788','2024-05-01','3000','Melbourne','Australia'),(3,'Emily','Davis','Plumber','Specialist','emily.davis@example.com','0499001122','2024-06-01','3000','Melbourne','Australia'),(4,'James','Wilson','Plumber','Master','james.wilson@example.com','0400334455','2024-06-02','3000','Melbourne','Australia'),(5,'Samantha','Williams','Carpenter','Specialist','samantha.williams@example.com','0411222333','2024-02-15','2000','Sydney','Australia'),(6,'Sophia','Evans','Carpenter','Master','sophia.evans@example.com','0411223344','2024-06-01','2000','Sydney','Australia'),(7,'Jessica','Taylor','Welder','Apprentice','jessica.taylor@example.com','0422334455','2024-04-05','5000','Adelaide','Australia'),(8,'Mark','Anderson','Welder','Master','mark.anderson@example.com','0422998877','2024-06-01','5000','Adelaide','Australia'),(9,'Ryan','Walker','HVAC Technician','Master','ryan.walker@example.com','0466778899','2024-05-03','6000','Perth','Australia'),(10,'Laura','Scott','HVAC Technician','Apprentice','laura.scott@example.com','0466778800','2024-06-03','6000','Perth','Australia'),(11,'Ahmad','Khan','Plumber','Apprentice','ahmad.khan@example.co.id','+6281122334455','2024-01-10','10110','Jakarta','Indonesia'),(12,'Sarah','Lewis','Plumber','Master','sarah.lewis@example.co.id','+6284433221100','2024-05-02','10110','Jakarta','Indonesia'),(13,'Budi','Santoso','Masonry Worker','Master','budi.santoso@example.co.id','+6282233445566','2024-03-20','40115','Bandung','Indonesia'),(14,'Ayu','Putri','Electrician','Specialist','ayu.putri@example.co.id','+6283322110099','2024-05-04','40115','Bandung','Indonesia'),(15,'Rina','Kurnia','Electrician','Apprentice','rina.kurnia@example.co.id','+62866554433','2024-05-05','40115','Bandung','Indonesia'),(16,'Linda','Green','IT Specialist','Specialist','linda.green@example.co.id','+6287788990011','2024-05-07','15156','Tangerang','Indonesia'),(17,'Rudi','Hartono','IT Specialist','Apprentice','rudi.hartono@example.co.id','+6285566778899','2024-06-01','15156','Tangerang','Indonesia'),(18,'Oliver','Brown','Electrician','Apprentice','oliver.brown@example.com','0400555666','2024-05-15','3000','Melbourne','Australia'),(19,'Ethan','White','Carpenter','Apprentice','ethan.white@example.com','0411333444','2024-05-20','2000','Sydney','Australia'),(20,'Hasan','Setiawan','Plumber','Apprentice','hasan.setiawan@example.co.id','+6287766554433','2024-05-25','10110','Jakarta','Indonesia');
/*!40000 ALTER TABLE `tradespeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `tradespeople_engagement_levels`
--

DROP TABLE IF EXISTS `tradespeople_engagement_levels`;
/*!50001 DROP VIEW IF EXISTS `tradespeople_engagement_levels`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tradespeople_engagement_levels` AS SELECT 
 1 AS `Tradesperson_ID`,
 1 AS `Tradesperson_Name`,
 1 AS `Registration_Date`,
 1 AS `Total_Offers_Made`,
 1 AS `Offers_Accepted`,
 1 AS `Offers_Rejected`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `tradespeople_performance_certificate`
--

DROP TABLE IF EXISTS `tradespeople_performance_certificate`;
/*!50001 DROP VIEW IF EXISTS `tradespeople_performance_certificate`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `tradespeople_performance_certificate` AS SELECT 
 1 AS `Certificate_Level`,
 1 AS `Description`,
 1 AS `Number_of_Tradespeople`,
 1 AS `Number_of_Offers`,
 1 AS `Accepted_Offers`,
 1 AS `Average_Customer_Rating`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `tradesperson_certificates`
--

DROP TABLE IF EXISTS `tradesperson_certificates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tradesperson_certificates` (
  `CertHolder_ID` int NOT NULL AUTO_INCREMENT,
  `Tradesperson_ID` int NOT NULL,
  `Certificate_ID` int NOT NULL,
  `Certificate_Number` varchar(50) DEFAULT NULL,
  `Date_Obtained` date NOT NULL,
  `Expiry_Date` date DEFAULT NULL,
  PRIMARY KEY (`CertHolder_ID`),
  UNIQUE KEY `Tradesperson_ID` (`Tradesperson_ID`,`Certificate_ID`),
  KEY `Certificate_ID` (`Certificate_ID`),
  CONSTRAINT `tradesperson_certificates_ibfk_1` FOREIGN KEY (`Tradesperson_ID`) REFERENCES `tradespeople` (`Tradesperson_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `tradesperson_certificates_ibfk_2` FOREIGN KEY (`Certificate_ID`) REFERENCES `certificates` (`Certificate_ID`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tradesperson_certificates`
--

LOCK TABLES `tradesperson_certificates` WRITE;
/*!40000 ALTER TABLE `tradesperson_certificates` DISABLE KEYS */;
INSERT INTO `tradesperson_certificates` VALUES (1,1,4,'T123456','2023-12-10','2025-12-10'),(2,2,2,'T654321','2024-05-10','2026-05-10'),(3,3,3,'T112233','2024-06-01','2026-06-01'),(4,4,4,'T445566','2024-06-02','2026-06-02'),(5,5,3,'T778899','2024-02-20','2026-02-20'),(6,6,4,'T334455','2024-06-01','2026-06-01'),(7,7,2,'T998877','2024-04-10','2026-04-10'),(8,8,4,'T665544','2024-06-01','2026-06-01'),(9,9,4,'T556677','2024-05-05','2026-05-05'),(10,10,2,'T889900','2024-06-03','2026-06-03'),(11,11,6,'T223344','2024-01-15','2026-01-15'),(12,12,8,'T112244','2024-05-02','2026-05-02'),(13,13,8,'T667788','2024-03-25','2026-03-25'),(14,14,7,'T223344','2024-05-04','2026-05-04'),(15,15,5,'T778899','2024-05-05','2026-05-05'),(16,16,7,'T334455','2024-05-07','2026-05-07'),(17,17,5,'T667788','2024-06-01','2026-06-01'),(18,18,2,'T990011','2024-05-16','2026-05-16'),(19,19,2,'T880022','2024-05-21','2026-05-21'),(20,20,6,'T770033','2024-05-26','2026-05-26');
/*!40000 ALTER TABLE `tradesperson_certificates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `training_providers`
--

DROP TABLE IF EXISTS `training_providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `training_providers` (
  `Training_Provider_ID` int NOT NULL AUTO_INCREMENT,
  `Provider_Name` varchar(100) NOT NULL,
  `Contact_Person` varchar(100) NOT NULL,
  `Phone_Number` varchar(20) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Postal_Code` varchar(20) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  PRIMARY KEY (`Training_Provider_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `training_providers`
--

LOCK TABLES `training_providers` WRITE;
/*!40000 ALTER TABLE `training_providers` DISABLE KEYS */;
INSERT INTO `training_providers` VALUES (1,'Sydney Trade Academy','Peter Johnson','0299776655','contact@sydneytrade.edu.au','2000','Sydney','Australia'),(2,'Jakarta Technical Institute','Rahmat Hidayat','+622155667788','contact@jakartatech.id','10110','Jakarta','Indonesia');
/*!40000 ALTER TABLE `training_providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `Offer_ID` int NOT NULL AUTO_INCREMENT,
  `Task_ID` int NOT NULL,
  `Tradesperson_ID` int NOT NULL,
  `Offer_Amount` decimal(10,2) NOT NULL,
  `Offer_Status` enum('Pending','Accepted','Rejected') NOT NULL DEFAULT 'Pending',
  `Offer_Date` date NOT NULL,
  `Accepted_Date` date DEFAULT NULL,
  `Completion_Date` date DEFAULT NULL,
  `Rating_for_Tradesperson` int DEFAULT NULL,
  `Rating_for_Customer` int DEFAULT NULL,
  `Feedback_from_Customer` text,
  `Feedback_from_Tradesperson` text,
  PRIMARY KEY (`Offer_ID`),
  KEY `Task_ID` (`Task_ID`),
  KEY `Tradesperson_ID` (`Tradesperson_ID`),
  CONSTRAINT `transactions_ibfk_1` FOREIGN KEY (`Task_ID`) REFERENCES `tasks` (`Task_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `transactions_ibfk_2` FOREIGN KEY (`Tradesperson_ID`) REFERENCES `tradespeople` (`Tradesperson_ID`) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT `transactions_chk_1` CHECK ((`Rating_for_Tradesperson` between 1 and 5)),
  CONSTRAINT `transactions_chk_2` CHECK ((`Rating_for_Customer` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
INSERT INTO `transactions` VALUES (1,1,1,1400.00,'Accepted','2024-06-02','2024-06-03','2024-06-07',5,5,'Excellent work!','Great client!'),(2,1,2,1300.00,'Rejected','2024-06-02',NULL,NULL,NULL,NULL,NULL,NULL),(3,2,5,1150.00,'Accepted','2024-06-11','2024-06-12','2024-06-18',5,5,'Beautiful craftsmanship!','Enjoyed the project.'),(4,2,6,1200.00,'Rejected','2024-06-11',NULL,NULL,NULL,NULL,NULL,NULL),(5,3,8,480.00,'Accepted','2024-06-21','2024-06-22','2024-06-24',5,5,'Fence repaired perfectly.','Happy to help!'),(6,3,7,450.00,'Rejected','2024-06-21',NULL,NULL,NULL,NULL,NULL,NULL),(7,4,2,950.00,'Accepted','2024-06-07','2024-06-08','2024-06-10',4,5,'Good job, minor delays.','Glad to assist.'),(8,4,1,1700.00,'Rejected','2024-06-07',NULL,NULL,NULL,NULL,NULL,NULL),(9,5,9,550.00,'Accepted','2024-06-08','2024-06-09','2024-06-11',5,5,'HVAC system runs smoothly now.','Happy to help.'),(10,5,10,500.00,'Rejected','2024-06-08',NULL,NULL,NULL,NULL,NULL,NULL),(11,6,11,750.00,'Accepted','2024-06-06','2024-06-07','2024-06-10',2,2,'Work completed but not up to standard.','Faced some challenges.'),(12,6,12,1500.00,'Rejected','2024-06-06',NULL,NULL,NULL,NULL,NULL,NULL),(13,7,13,1950.00,'Accepted','2024-06-16','2024-06-17','2024-06-22',5,5,'Countertops look amazing!','Glad to help!'),(14,7,11,2000.00,'Rejected','2024-06-16',NULL,NULL,NULL,NULL,NULL,NULL),(15,8,14,650.00,'Accepted','2024-06-09','2024-06-10','2024-06-12',5,5,'Fixtures installed perfectly.','Great client to work with.'),(16,8,15,600.00,'Rejected','2024-06-09',NULL,NULL,NULL,NULL,NULL,NULL),(17,9,12,280.00,'Rejected','2024-06-13',NULL,NULL,NULL,NULL,NULL,NULL),(18,9,11,250.00,'Rejected','2024-06-13',NULL,NULL,NULL,NULL,NULL,NULL),(19,10,16,750.00,'Rejected','2024-06-11',NULL,NULL,NULL,NULL,NULL,NULL),(20,10,17,700.00,'Rejected','2024-06-11',NULL,NULL,NULL,NULL,NULL,NULL),(21,1,18,1250.00,'Rejected','2024-06-02',NULL,NULL,NULL,NULL,NULL,NULL),(22,2,19,1100.00,'Rejected','2024-06-11',NULL,NULL,NULL,NULL,NULL,NULL),(23,6,20,700.00,'Rejected','2024-06-06',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `acceptance_rate_by_experience`
--

/*!50001 DROP VIEW IF EXISTS `acceptance_rate_by_experience`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `acceptance_rate_by_experience` AS select `trppl`.`Experience_Level` AS `Experience_Level`,count(`ts`.`Offer_ID`) AS `Total_Offers`,count((case when (`ts`.`Offer_Status` = 'Accepted') then 1 end)) AS `Accepted_Offers`,round(((count((case when (`ts`.`Offer_Status` = 'Accepted') then 1 end)) * 100.0) / count(`ts`.`Offer_ID`)),2) AS `Acceptance_Rate_Percentage` from (`tradespeople` `trppl` join `transactions` `ts` on((`trppl`.`Tradesperson_ID` = `ts`.`Tradesperson_ID`))) group by `trppl`.`Experience_Level` order by `trppl`.`Experience_Level` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customer_satisfaction_ratings_tradesperson_exp`
--

/*!50001 DROP VIEW IF EXISTS `customer_satisfaction_ratings_tradesperson_exp`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_satisfaction_ratings_tradesperson_exp` AS select `trppl`.`Experience_Level` AS `Experience_Level`,round(avg(`ts`.`Rating_for_Tradesperson`),2) AS `Average_Customer_Rating`,count(`ts`.`Offer_ID`) AS `Number_of_Ratings` from (`tradespeople` `trppl` join `transactions` `ts` on((`trppl`.`Tradesperson_ID` = `ts`.`Tradesperson_ID`))) where (`ts`.`Rating_for_Tradesperson` is not null) group by `trppl`.`Experience_Level` order by `trppl`.`Experience_Level` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `customers_utilization`
--

/*!50001 DROP VIEW IF EXISTS `customers_utilization`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `customers_utilization` AS select `cu`.`Customer_ID` AS `Customer_ID`,concat(`cu`.`Customer_FName`,' ',`cu`.`Customer_LName`) AS `Customer_Name`,`cu`.`Registration_Date` AS `Registration_Date`,count(`ts`.`Task_ID`) AS `Tasks_Created`,sum((case when (`ta`.`Task_Status` = 'Completed') then 1 else 0 end)) AS `Tasks_Completed`,sum((case when (`ta`.`Task_Status` = 'Cancelled') then 1 else 0 end)) AS `Tasks_Cancelled`,min(`ts`.`Offer_Date`) AS `First_Transaction_Date`,(to_days(min(`ts`.`Offer_Date`)) - to_days(`cu`.`Registration_Date`)) AS `Days_to_First_Transaction` from ((`customers` `cu` left join `tasks` `ta` on((`cu`.`Customer_ID` = `ta`.`Customer_ID`))) left join `transactions` `ts` on((`ta`.`Task_ID` = `ts`.`Task_ID`))) group by `cu`.`Customer_ID`,`cu`.`Registration_Date` order by `Days_to_First_Transaction` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `feedback_between_customers_tradespeople`
--

/*!50001 DROP VIEW IF EXISTS `feedback_between_customers_tradespeople`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `feedback_between_customers_tradespeople` AS select `ts`.`Offer_ID` AS `Offer_ID`,`trppl`.`Experience_Level` AS `Experience_Level`,`ts`.`Rating_for_Customer` AS `Rating_for_Customer`,`ts`.`Rating_for_Tradesperson` AS `Rating_for_Tradesperson`,`ts`.`Feedback_from_Customer` AS `Feedback_for_Tradesperson`,`ts`.`Feedback_from_Tradesperson` AS `Feedback_for_Customer` from (((`transactions` `ts` join `tasks` `ta` on((`ts`.`Task_ID` = `ta`.`Task_ID`))) join `customers` `cu` on((`ta`.`Customer_ID` = `cu`.`Customer_ID`))) join `tradespeople` `trppl` on((`ts`.`Tradesperson_ID` = `trppl`.`Tradesperson_ID`))) where ((`ts`.`Rating_for_Customer` is not null) or (`ts`.`Rating_for_Tradesperson` is not null)) order by `ts`.`Rating_for_Tradesperson` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `geographical_distribution_with_ratings`
--

/*!50001 DROP VIEW IF EXISTS `geographical_distribution_with_ratings`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `geographical_distribution_with_ratings` AS with `city_list` as (select distinct `cu`.`City` AS `City` from `customers` `cu` union select distinct `trppl`.`City` AS `City` from `tradespeople` `trppl`), `tradespeople_count` as (select `trppl`.`City` AS `City`,count(0) AS `Number_of_Tradespeople` from `tradespeople` `trppl` group by `trppl`.`City`), `customer_count` as (select `cu`.`City` AS `City`,count(0) AS `Number_of_Customers` from `customers` `cu` group by `cu`.`City`), `transaction_data` as (select `trppl`.`City` AS `City`,count(`ts`.`Offer_ID`) AS `Number_of_Transactions`,round(avg(`ts`.`Rating_for_Tradesperson`),2) AS `Avg_Customer_Rating` from (`tradespeople` `trppl` left join `transactions` `ts` on((`trppl`.`Tradesperson_ID` = `ts`.`Tradesperson_ID`))) where (`ts`.`Rating_for_Tradesperson` is not null) group by `trppl`.`City`) select `c`.`City` AS `City`,coalesce(`tc`.`Number_of_Tradespeople`,0) AS `Number_of_Tradespeople`,coalesce(`cc`.`Number_of_Customers`,0) AS `Number_of_Customers`,(coalesce(`tc`.`Number_of_Tradespeople`,0) - coalesce(`cc`.`Number_of_Customers`,0)) AS `Tradespeople_Customer_Difference`,coalesce(`td`.`Number_of_Transactions`,0) AS `Number_of_Transactions`,coalesce(`td`.`Avg_Customer_Rating`,0) AS `Average_Customer_Rating` from (((`city_list` `c` left join `tradespeople_count` `tc` on((`c`.`City` = `tc`.`City`))) left join `customer_count` `cc` on((`c`.`City` = `cc`.`City`))) left join `transaction_data` `td` on((`c`.`City` = `td`.`City`))) order by coalesce(`td`.`Avg_Customer_Rating`,0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `supplier_performance`
--

/*!50001 DROP VIEW IF EXISTS `supplier_performance`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `supplier_performance` AS select `s`.`Supplier_ID` AS `Supplier_ID`,`s`.`Supplier_Name` AS `Supplier_Name`,count(distinct `ta`.`Task_ID`) AS `Tasks_Supplied`,avg((to_days(`ts`.`Completion_Date`) - to_days(`ta`.`Creation_Date`))) AS `Average_Task_Completion_Time`,sum((`m`.`Unit_Price` * `tm`.`Required_Quantity`)) AS `Total_Material_Cost`,avg(`ts`.`Rating_for_Tradesperson`) AS `Average_Task_Rating` from ((((`suppliers` `s` join `materials` `m` on((`s`.`Supplier_ID` = `m`.`Supplier_ID`))) join `task_materials` `tm` on((`m`.`Material_ID` = `tm`.`Material_ID`))) join `tasks` `ta` on((`tm`.`Task_ID` = `ta`.`Task_ID`))) join `transactions` `ts` on((`ta`.`Task_ID` = `ts`.`Task_ID`))) where ((`ta`.`Task_Status` = 'Completed') and (`ts`.`Offer_Status` = 'Accepted')) group by `s`.`Supplier_ID`,`s`.`Supplier_Name` order by `Tasks_Supplied` desc,`Average_Task_Rating` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tradespeople_engagement_levels`
--

/*!50001 DROP VIEW IF EXISTS `tradespeople_engagement_levels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tradespeople_engagement_levels` AS select `trppl`.`Tradesperson_ID` AS `Tradesperson_ID`,concat(`trppl`.`Tradesperson_FName`,' ',`trppl`.`Tradesperson_LName`) AS `Tradesperson_Name`,`trppl`.`Registration_Date` AS `Registration_Date`,count(`ts`.`Offer_ID`) AS `Total_Offers_Made`,sum((case when (`ts`.`Offer_Status` = 'Accepted') then 1 else 0 end)) AS `Offers_Accepted`,sum((case when (`ts`.`Offer_Status` = 'Rejected') then 1 else 0 end)) AS `Offers_Rejected` from (`tradespeople` `trppl` left join `transactions` `ts` on(((`ts`.`Tradesperson_ID` = `ts`.`Tradesperson_ID`) and (`ts`.`Offer_Date` between `trppl`.`Registration_Date` and (`trppl`.`Registration_Date` + interval 30 day))))) group by `trppl`.`Tradesperson_ID` order by `trppl`.`Registration_Date` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `tradespeople_performance_certificate`
--

/*!50001 DROP VIEW IF EXISTS `tradespeople_performance_certificate`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `tradespeople_performance_certificate` AS select `ce`.`Certificate_Level` AS `Certificate_Level`,`ce`.`Certificate_Description` AS `Description`,count(distinct `tc`.`Tradesperson_ID`) AS `Number_of_Tradespeople`,count(`ts`.`Offer_ID`) AS `Number_of_Offers`,count((case when (`ts`.`Offer_Status` = 'Accepted') then 1 end)) AS `Accepted_Offers`,round(avg(`ts`.`Rating_for_Tradesperson`),2) AS `Average_Customer_Rating` from ((`certificates` `ce` join `tradesperson_certificates` `tc` on((`ce`.`Certificate_ID` = `tc`.`Certificate_ID`))) left join `transactions` `ts` on((`tc`.`Tradesperson_ID` = `ts`.`Tradesperson_ID`))) group by `ce`.`Certificate_Level`,`ce`.`Certificate_Description` order by `ce`.`Certificate_Level` desc */;
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

-- Dump completed on 2024-10-05  3:04:46
