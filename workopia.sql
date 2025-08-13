--Create the 'workopia' database
CREATE DATABASE IF NOT EXISTS if0_39126041_workopia_db;
USE if0_39126041_workopia_db;

-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: workopia
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'John Doe','user1@gmail.com','$10$1GOhRc92DWE3TvVqulJR6.JFEUd6Gk3wuEIdUShPa1gAio1KkCn6q','Boston','MA','2025-04-12 11:52:19'),(2,'Jane Doe','user2@gmail.com','$10$1GOhRc92DWE3TvVqulJR6.JFEUd6Gk3wuEIdUShPa1gAio1KkCn6q','San Francisco','CA','2025-04-12 11:54:30'),(3,'Jack Dorsey','user3@gmail.com','$10$1GOhRc92DWE3TvVqulJR6.JFEUd6Gk3wuEIdUShPa1gAio1KkCn6q','Miami','FL','2025-04-12 11:56:05'),(4,'Faisal Khan','nick@ani.com','$2y$10$1GOhRc92DWE3TvVqulJR6.JFEUd6Gk3wuEIdUShPa1gAio1KkCn6q','Lucknow','Uttar Pradesh','2025-05-12 14:14:52'),(5,'Grey Matter','grey@matter.com','$2y$10$nuTmfrmuoBrzAd6mwH4p2eAgH01EVnQcnO8UKSEdebZjhE6OC2XAO','Mars','Planet','2025-05-12 14:17:25'),(6,'Valerie Kay','val@p.com','$2y$10$tqP0UcIy7XkfBgcqIrp.b.Agv0LWUXfCBKmpffYpFFwavl2aq0lDm','Miami','Florida','2025-05-13 12:59:39'),(7,'Nicole Doshi','nic@p.com','$2y$10$7XWWlFBlPOK5FVACYKzn1uHL4ORi5SQUFHHP41g0GuXojjx/6W3dW','Lucknow','Uttar Pradesh','2025-05-14 11:22:09');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31 17:22:05


-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: workopia
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `listings`
--

DROP TABLE IF EXISTS `listings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `listings` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext,
  `salary` varchar(45) DEFAULT NULL,
  `tags` varchar(255) DEFAULT NULL,
  `company` varchar(45) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `requirements` longtext,
  `benefits` longtext,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `fk_listings_users_idx` (`user_id`),
  CONSTRAINT `fk_listings_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `listings`
--

LOCK TABLES `listings` WRITE;
/*!40000 ALTER TABLE `listings` DISABLE KEYS */;
INSERT INTO `listings` VALUES (1,1,'Software Engineer','We are seeking a skilled software engineer to develop high-quality software solutions','90000','development, coding, java, python','Tech Solutions Inc.','123 Main St','Albany','NY','348-334-3949','info@techsolutions.com','Bachelors degree in Computer Science or related field, 3+ years of software development experience','Healthcare, 401(k) matching, flexible work hours','2025-04-12 12:00:52'),(2,2,'Marketing Specialist','We are looking for a Marketing Specialist to create and manage marketing campaigns','72000','marketing, advertising','Marketing Pros','456 Market St','San Francisco','CA','454-344-3344','info@marketingpros.com','Bachelors degree in Marketing or related field, experience in digital marketing','Health and dental insurance, paid time off, remote work options','2025-04-12 12:03:50'),(3,3,'Web Developer','Join our team as a Web Developer and create amazing web applications','85000','web development, programming','WebTech Solutions','789 Web Ave','Chicago','IL','456-876-5432','info@webtechsolutions.com','Bachelors degree in Computer Science or related field, proficiency in HTML, CSS, JavaScript','Competitive salary, professional development opportunities, friendly work environment','2025-04-12 12:06:16'),(4,1,'Data Scientist','We\\\'re looking for a Data Scientist to analyze complex data and generate insights','100000','data science, machine learning','DataGenius Corp','567 Data Drive','Boston','MA','684-789-1234','info@datagenius.com','Masters or Ph.D. in Data Science or related field, experience with machine learning algorithms','Competitive salary, remote work options, professional development','2025-04-12 12:14:39'),(5,2,'Graphic Designer','Join our creative team as a Graphic Designer and bring ideas to life','70000','graphic design, creative','CreativeWorks Inc.','234 Design Blvd','Albany','NY','499-321-9876','info@creativeworks.com','Bachelors degree in Graphic Design or related field, proficiency in Adobe Creative Suite','Flexible work hours, creative work environment, opportunities for growth','2025-04-12 12:17:53'),(18,4,'TITLE','DNDHDHD','65000','shopify, front-end, react','COMP Inc.','Husainganj','Lucknow','Uttar Pradesh','08566886341','mn@g.com','Bachelors degree in Marketing or related field, experience in digital marketing',NULL,'2025-05-18 12:17:17');
/*!40000 ALTER TABLE `listings` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-05-31 17:22:05
