CREATE DATABASE  IF NOT EXISTS `scholarship_dbms` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `scholarship_dbms`;
-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: localhost    Database: scholarship_dbms
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `institute_login`
--

DROP TABLE IF EXISTS `institute_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `institute_login` (
  `password` varchar(45) DEFAULT NULL,
  `user_type_id` varchar(45) DEFAULT NULL,
  `account_status` varchar(45) DEFAULT NULL,
  `mst_institute_officer_institute_officer_id` int(11) NOT NULL,
  KEY `fk_institute_login_mst_institute_officer1` (`mst_institute_officer_institute_officer_id`),
  CONSTRAINT `fk_institute_login_mst_institute_officer1` FOREIGN KEY (`mst_institute_officer_institute_officer_id`) REFERENCES `mst_institute_officer` (`institute_officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `institute_login`
--

LOCK TABLES `institute_login` WRITE;
/*!40000 ALTER TABLE `institute_login` DISABLE KEYS */;
INSERT INTO `institute_login` VALUES ('pass1','1','Actuve',1),('pass2','1','Actuve',2),('pass3','1','Actuve',3),('pass4','1','Actuve',4),('pass1','1','Actuve',1),('pass2','1','Actuve',2),('pass3','1','Actuve',3),('pass4','1','Actuve',4);
/*!40000 ALTER TABLE `institute_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_address_type`
--

DROP TABLE IF EXISTS `mst_address_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_address_type` (
  `address_id` char(1) NOT NULL,
  `address_type` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_address_type`
--

LOCK TABLES `mst_address_type` WRITE;
/*!40000 ALTER TABLE `mst_address_type` DISABLE KEYS */;
INSERT INTO `mst_address_type` VALUES ('1','Personal address'),('2','parent address');
/*!40000 ALTER TABLE `mst_address_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_bank`
--

DROP TABLE IF EXISTS `mst_bank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_bank` (
  `bank_id` int(11) NOT NULL,
  `bank_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`bank_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_bank`
--

LOCK TABLES `mst_bank` WRITE;
/*!40000 ALTER TABLE `mst_bank` DISABLE KEYS */;
INSERT INTO `mst_bank` VALUES (1,'Kotak Mahindra Bank'),(2,'ICICI'),(3,'HDFC'),(4,'AXIS');
/*!40000 ALTER TABLE `mst_bank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_bank_ifsc`
--

DROP TABLE IF EXISTS `mst_bank_ifsc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_bank_ifsc` (
  `branch_ifsc_code` varchar(20) NOT NULL,
  `mst_state_state_id` tinyint(4) NOT NULL,
  `mst_district_district_id` int(11) NOT NULL,
  `mst_bank_bank_id` int(11) NOT NULL,
  PRIMARY KEY (`branch_ifsc_code`),
  KEY `fk_mst_bank_ifsc_mst_state1_idx` (`mst_state_state_id`),
  KEY `fk_mst_bank_ifsc_mst_district1_idx` (`mst_district_district_id`),
  KEY `fk_mst_bank_ifsc_mst_bank1_idx` (`mst_bank_bank_id`),
  CONSTRAINT `fk_mst_bank_ifsc_mst_bank1` FOREIGN KEY (`mst_bank_bank_id`) REFERENCES `mst_bank` (`bank_id`),
  CONSTRAINT `fk_mst_bank_ifsc_mst_district1` FOREIGN KEY (`mst_district_district_id`) REFERENCES `mst_district` (`district_id`),
  CONSTRAINT `fk_mst_bank_ifsc_mst_state1` FOREIGN KEY (`mst_state_state_id`) REFERENCES `mst_state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_bank_ifsc`
--

LOCK TABLES `mst_bank_ifsc` WRITE;
/*!40000 ALTER TABLE `mst_bank_ifsc` DISABLE KEYS */;
INSERT INTO `mst_bank_ifsc` VALUES ('1111',1,1,1),('2222',1,2,2),('3333',2,3,3),('4444',2,4,4);
/*!40000 ALTER TABLE `mst_bank_ifsc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_category`
--

DROP TABLE IF EXISTS `mst_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_category` (
  `category_id` char(1) NOT NULL,
  `category_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_category`
--

LOCK TABLES `mst_category` WRITE;
/*!40000 ALTER TABLE `mst_category` DISABLE KEYS */;
INSERT INTO `mst_category` VALUES ('1','General',0),('2','SC',0),('3','ST',0),('4','OBC',0);
/*!40000 ALTER TABLE `mst_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_course`
--

DROP TABLE IF EXISTS `mst_course`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_course` (
  `course_id` int(11) NOT NULL,
  `course_name` varchar(45) DEFAULT NULL,
  `course_level` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_course`
--

LOCK TABLES `mst_course` WRITE;
/*!40000 ALTER TABLE `mst_course` DISABLE KEYS */;
INSERT INTO `mst_course` VALUES (1,'Course A','6-10',0),(2,'COurse B','10 class',0),(3,'Couse C','12 class',0),(4,'course D','under graduate',0),(5,'course D','graduate',0);
/*!40000 ALTER TABLE `mst_course` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_course_has_mst_institute`
--

DROP TABLE IF EXISTS `mst_course_has_mst_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_course_has_mst_institute` (
  `mst_course_course_id` int(11) NOT NULL,
  `mst_institute_institute_id` int(11) NOT NULL,
  PRIMARY KEY (`mst_course_course_id`,`mst_institute_institute_id`),
  KEY `fk_mst_course_has_mst_institute_mst_institute1_idx` (`mst_institute_institute_id`),
  KEY `fk_mst_course_has_mst_institute_mst_course1_idx` (`mst_course_course_id`),
  CONSTRAINT `fk_mst_course_has_mst_institute_mst_course1` FOREIGN KEY (`mst_course_course_id`) REFERENCES `mst_course` (`course_id`),
  CONSTRAINT `fk_mst_course_has_mst_institute_mst_institute1` FOREIGN KEY (`mst_institute_institute_id`) REFERENCES `mst_institute` (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_course_has_mst_institute`
--

LOCK TABLES `mst_course_has_mst_institute` WRITE;
/*!40000 ALTER TABLE `mst_course_has_mst_institute` DISABLE KEYS */;
INSERT INTO `mst_course_has_mst_institute` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `mst_course_has_mst_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_disablity`
--

DROP TABLE IF EXISTS `mst_disablity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_disablity` (
  `disablity_type_id` tinyint(3) unsigned NOT NULL,
  `disablity_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`disablity_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_disablity`
--

LOCK TABLES `mst_disablity` WRITE;
/*!40000 ALTER TABLE `mst_disablity` DISABLE KEYS */;
INSERT INTO `mst_disablity` VALUES (1,'vision Impairment',0),(2,'deaf or hard of hearing',0),(3,'mental health conditions',0),(4,'intellectual disability',0),(5,'physical disability.',0);
/*!40000 ALTER TABLE `mst_disablity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_district`
--

DROP TABLE IF EXISTS `mst_district`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_district` (
  `district_id` int(11) NOT NULL,
  `district_name` varchar(45) DEFAULT NULL,
  `mst_state_state_id` tinyint(4) NOT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`district_id`),
  KEY `fk_mst_district_mst_state1_idx` (`mst_state_state_id`),
  CONSTRAINT `fk_mst_district_mst_state1` FOREIGN KEY (`mst_state_state_id`) REFERENCES `mst_state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_district`
--

LOCK TABLES `mst_district` WRITE;
/*!40000 ALTER TABLE `mst_district` DISABLE KEYS */;
INSERT INTO `mst_district` VALUES (1,'District A',1,0),(2,'District B',1,0),(3,'District C',2,0),(4,'District D',2,0);
/*!40000 ALTER TABLE `mst_district` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_doc`
--

DROP TABLE IF EXISTS `mst_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_doc` (
  `doc_id` tinyint(4) NOT NULL,
  `doc_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`doc_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_doc`
--

LOCK TABLES `mst_doc` WRITE;
/*!40000 ALTER TABLE `mst_doc` DISABLE KEYS */;
INSERT INTO `mst_doc` VALUES (1,'5-9 class marksheet',0),(2,'10th class marksheet',0),(3,'12th marksheet',0),(4,'under graduate marsheet',0),(5,'graduate marsheet',0),(6,'PHD marskeet',0);
/*!40000 ALTER TABLE `mst_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_gender`
--

DROP TABLE IF EXISTS `mst_gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_gender` (
  `gender_id` char(1) NOT NULL,
  `gender_type` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`gender_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_gender`
--

LOCK TABLES `mst_gender` WRITE;
/*!40000 ALTER TABLE `mst_gender` DISABLE KEYS */;
INSERT INTO `mst_gender` VALUES ('1','Male'),('2','Female'),('3','Others');
/*!40000 ALTER TABLE `mst_gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_identity`
--

DROP TABLE IF EXISTS `mst_identity`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_identity` (
  `identity_id` tinyint(4) NOT NULL,
  `identity_name` varchar(45) NOT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`identity_id`,`identity_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_identity`
--

LOCK TABLES `mst_identity` WRITE;
/*!40000 ALTER TABLE `mst_identity` DISABLE KEYS */;
INSERT INTO `mst_identity` VALUES (1,'Aadhar Card',0),(2,'Passport',0),(3,'Driving License',0),(4,'Voter Card',0),(5,'Pan Card',0);
/*!40000 ALTER TABLE `mst_identity` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_institute`
--

DROP TABLE IF EXISTS `mst_institute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_institute` (
  `institute_id` int(11) NOT NULL,
  `institute_name` varchar(45) DEFAULT NULL,
  `mst_university_university_id` int(11) NOT NULL,
  `mst_district_district_id` int(11) NOT NULL,
  `mst_state_state_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`institute_id`),
  KEY `fk_mst_institute_mst_university1_idx` (`mst_university_university_id`),
  KEY `fk_mst_institute_mst_district1_idx` (`mst_district_district_id`),
  KEY `fk_mst_institute_mst_state1_idx` (`mst_state_state_id`),
  CONSTRAINT `fk_mst_institute_mst_district1` FOREIGN KEY (`mst_district_district_id`) REFERENCES `mst_district` (`district_id`),
  CONSTRAINT `fk_mst_institute_mst_state1` FOREIGN KEY (`mst_state_state_id`) REFERENCES `mst_state` (`state_id`),
  CONSTRAINT `fk_mst_institute_mst_university1` FOREIGN KEY (`mst_university_university_id`) REFERENCES `mst_university_board` (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_institute`
--

LOCK TABLES `mst_institute` WRITE;
/*!40000 ALTER TABLE `mst_institute` DISABLE KEYS */;
INSERT INTO `mst_institute` VALUES (1,'Institute A',1,1,1),(2,'Institute B',2,2,1),(3,'Institute C',2,3,2),(4,'Institute D',2,4,2);
/*!40000 ALTER TABLE `mst_institute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_institute_officer`
--

DROP TABLE IF EXISTS `mst_institute_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_institute_officer` (
  `institute_officer_id` int(11) NOT NULL,
  `institute_officer_name` varchar(45) DEFAULT NULL,
  `institute_officer_mobile` varchar(45) DEFAULT NULL,
  `mst_institute_institute_id` int(11) NOT NULL,
  `institute_office_email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`institute_officer_id`),
  KEY `fk_mst_institute_officer_mst_institute1_idx` (`mst_institute_institute_id`),
  CONSTRAINT `fk_mst_institute_officer_mst_institute1` FOREIGN KEY (`mst_institute_institute_id`) REFERENCES `mst_institute` (`institute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_institute_officer`
--

LOCK TABLES `mst_institute_officer` WRITE;
/*!40000 ALTER TABLE `mst_institute_officer` DISABLE KEYS */;
INSERT INTO `mst_institute_officer` VALUES (1,'institute officer 1','987654321',1,'abc@gmail.com'),(2,'institute officer 2','123456789',2,'pqr@gmail.com'),(3,'institute officer 3','79297329',3,'uvw@gmail.com'),(4,'institute officer 4','29379237923',4,'xyz@gmail.com');
/*!40000 ALTER TABLE `mst_institute_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_marital`
--

DROP TABLE IF EXISTS `mst_marital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_marital` (
  `marital_type` tinyint(3) unsigned NOT NULL,
  `marital_status` varchar(20) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`marital_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_marital`
--

LOCK TABLES `mst_marital` WRITE;
/*!40000 ALTER TABLE `mst_marital` DISABLE KEYS */;
INSERT INTO `mst_marital` VALUES (1,'Married',0),(2,'single',0),(3,'divorced',0),(4,'widowed',0);
/*!40000 ALTER TABLE `mst_marital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_nodal_officer`
--

DROP TABLE IF EXISTS `mst_nodal_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_nodal_officer` (
  `nodal_officer_id` varchar(20) NOT NULL,
  `nodal_officercol_name` varchar(45) DEFAULT NULL,
  `nodal_officercol_mobile` varchar(45) DEFAULT NULL,
  `nodal_office_email` varchar(100) DEFAULT NULL,
  `mst_district_district_id` int(11) NOT NULL,
  `mst_state_state_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`nodal_officer_id`),
  KEY `fk_mst_nodal_officer_mst_district1_idx` (`mst_district_district_id`),
  KEY `fk_mst_nodal_officer_mst_state1_idx` (`mst_state_state_id`),
  CONSTRAINT `fk_mst_nodal_officer_mst_district1` FOREIGN KEY (`mst_district_district_id`) REFERENCES `mst_district` (`district_id`),
  CONSTRAINT `fk_mst_nodal_officer_mst_state1` FOREIGN KEY (`mst_state_state_id`) REFERENCES `mst_state` (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_nodal_officer`
--

LOCK TABLES `mst_nodal_officer` WRITE;
/*!40000 ALTER TABLE `mst_nodal_officer` DISABLE KEYS */;
INSERT INTO `mst_nodal_officer` VALUES ('1','nod officer A','123422222','abcd@gmail.com',1,1),('2','nod officer B','7878787878','pqrs@gmail.com',2,1),('3','nod officer C','4545454545','stuv@gmail.com',3,2),('4','nod officer D','3232323232','uvwx@gmail.com',4,2);
/*!40000 ALTER TABLE `mst_nodal_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_parent_profession`
--

DROP TABLE IF EXISTS `mst_parent_profession`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_parent_profession` (
  `parent_profession_id` int(11) NOT NULL,
  `parent_profession_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`parent_profession_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_parent_profession`
--

LOCK TABLES `mst_parent_profession` WRITE;
/*!40000 ALTER TABLE `mst_parent_profession` DISABLE KEYS */;
INSERT INTO `mst_parent_profession` VALUES (1,'Businessman',0),(2,'Government Employee',0),(3,'farmer',0);
/*!40000 ALTER TABLE `mst_parent_profession` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_religion`
--

DROP TABLE IF EXISTS `mst_religion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_religion` (
  `religion_type` tinyint(3) unsigned NOT NULL,
  `religion_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`religion_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_religion`
--

LOCK TABLES `mst_religion` WRITE;
/*!40000 ALTER TABLE `mst_religion` DISABLE KEYS */;
INSERT INTO `mst_religion` VALUES (1,'Hinduism',0),(2,'Islam',0),(3,'Christianity',0),(4,'Sikhism',0),(5,'Buddhism',0),(6,'Jainism',0);
/*!40000 ALTER TABLE `mst_religion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_scheme`
--

DROP TABLE IF EXISTS `mst_scheme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_scheme` (
  `scheme_id` int(11) NOT NULL,
  `scheme_name` varchar(45) DEFAULT NULL,
  `mst_nodal_officer_nodal_officer_id` varchar(20) NOT NULL,
  `scheme_deadline_apply` date DEFAULT NULL,
  PRIMARY KEY (`scheme_id`),
  KEY `fk_mst_scheme_mst_nodal_officer1_idx` (`mst_nodal_officer_nodal_officer_id`),
  CONSTRAINT `fk_mst_scheme_mst_nodal_officer1` FOREIGN KEY (`mst_nodal_officer_nodal_officer_id`) REFERENCES `mst_nodal_officer` (`nodal_officer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_scheme`
--

LOCK TABLES `mst_scheme` WRITE;
/*!40000 ALTER TABLE `mst_scheme` DISABLE KEYS */;
INSERT INTO `mst_scheme` VALUES (1,'scheme A','1','2019-01-01'),(2,'scheme B','2','2019-01-01'),(3,'scheme C','3','2019-01-01'),(4,'scheme D','4','2019-01-01');
/*!40000 ALTER TABLE `mst_scheme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_scheme_has_mst_doc`
--

DROP TABLE IF EXISTS `mst_scheme_has_mst_doc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_scheme_has_mst_doc` (
  `mst_scheme_scheme_id` int(11) NOT NULL,
  `mst_doc_doc_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`mst_scheme_scheme_id`,`mst_doc_doc_id`),
  KEY `fk_mst_scheme_has_mst_doc_mst_doc1_idx` (`mst_doc_doc_id`),
  KEY `fk_mst_scheme_has_mst_doc_mst_scheme1_idx` (`mst_scheme_scheme_id`),
  CONSTRAINT `fk_mst_scheme_has_mst_doc_mst_doc1` FOREIGN KEY (`mst_doc_doc_id`) REFERENCES `mst_doc` (`doc_id`),
  CONSTRAINT `fk_mst_scheme_has_mst_doc_mst_scheme1` FOREIGN KEY (`mst_scheme_scheme_id`) REFERENCES `mst_scheme` (`scheme_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_scheme_has_mst_doc`
--

LOCK TABLES `mst_scheme_has_mst_doc` WRITE;
/*!40000 ALTER TABLE `mst_scheme_has_mst_doc` DISABLE KEYS */;
INSERT INTO `mst_scheme_has_mst_doc` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `mst_scheme_has_mst_doc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_scholarship_category`
--

DROP TABLE IF EXISTS `mst_scholarship_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_scholarship_category` (
  `scholarship_category_id` tinyint(3) unsigned NOT NULL,
  `scholarship_name` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`scholarship_category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_scholarship_category`
--

LOCK TABLES `mst_scholarship_category` WRITE;
/*!40000 ALTER TABLE `mst_scholarship_category` DISABLE KEYS */;
INSERT INTO `mst_scholarship_category` VALUES (1,'Pre Matrix',0),(2,'Post Matrix',0);
/*!40000 ALTER TABLE `mst_scholarship_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_state`
--

DROP TABLE IF EXISTS `mst_state`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_state` (
  `state_id` tinyint(4) NOT NULL,
  `state_name` varchar(45) DEFAULT NULL,
  `country` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`state_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_state`
--

LOCK TABLES `mst_state` WRITE;
/*!40000 ALTER TABLE `mst_state` DISABLE KEYS */;
INSERT INTO `mst_state` VALUES (1,'State A','India',0),(2,'State B','India',0),(3,'State C','India',0),(4,'State D','India',0);
/*!40000 ALTER TABLE `mst_state` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_type_of_study`
--

DROP TABLE IF EXISTS `mst_type_of_study`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_type_of_study` (
  `Study_id` char(1) NOT NULL,
  `Study_type` varchar(45) DEFAULT NULL,
  `is_deleted` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`Study_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_type_of_study`
--

LOCK TABLES `mst_type_of_study` WRITE;
/*!40000 ALTER TABLE `mst_type_of_study` DISABLE KEYS */;
INSERT INTO `mst_type_of_study` VALUES ('1','Inside India',0),('2','Outside India',0);
/*!40000 ALTER TABLE `mst_type_of_study` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mst_university_board`
--

DROP TABLE IF EXISTS `mst_university_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `mst_university_board` (
  `university_id` int(11) NOT NULL,
  `university_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`university_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mst_university_board`
--

LOCK TABLES `mst_university_board` WRITE;
/*!40000 ALTER TABLE `mst_university_board` DISABLE KEYS */;
INSERT INTO `mst_university_board` VALUES (1,'University A'),(2,'University B'),(3,'ICSE'),(4,'CBSE');
/*!40000 ALTER TABLE `mst_university_board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodal_officer_login`
--

DROP TABLE IF EXISTS `nodal_officer_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `nodal_officer_login` (
  `password` varchar(45) DEFAULT NULL,
  `user_type_id` varchar(45) DEFAULT NULL,
  `account_status` varchar(45) DEFAULT NULL,
  `mst_nodal_officer_nodal_officer_id` varchar(20) NOT NULL,
  KEY `fk_nodal_officer_login_mst_nodal_officer1_idx` (`mst_nodal_officer_nodal_officer_id`),
  CONSTRAINT `fk_nodal_officer_login_mst_nodal_officer1` FOREIGN KEY (`mst_nodal_officer_nodal_officer_id`) REFERENCES `mst_nodal_officer` (`nodal_officer_id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodal_officer_login`
--

LOCK TABLES `nodal_officer_login` WRITE;
/*!40000 ALTER TABLE `nodal_officer_login` DISABLE KEYS */;
INSERT INTO `nodal_officer_login` VALUES ('pass1','1','Actuve','1'),('pass2','1','Actuve','2'),('pass3','1','Actuve','3'),('pass4','1','Actuve','4'),('pass1','1','Actuve','1'),('pass2','1','Actuve','2'),('pass3','1','Actuve','3'),('pass4','1','Actuve','4');
/*!40000 ALTER TABLE `nodal_officer_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sch_applicant_basic_details`
--

DROP TABLE IF EXISTS `sch_applicant_basic_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sch_applicant_basic_details` (
  `registration_id` int(11) NOT NULL,
  `form_submission_date` date NOT NULL,
  `application_current_level` char(1) DEFAULT NULL,
  `application_current_status` varchar(3) NOT NULL,
  `fresh_renewal` char(1) NOT NULL,
  `student_name` varchar(100) NOT NULL,
  `father_name` varchar(100) NOT NULL,
  `mother_name` varchar(100) NOT NULL,
  `dob` date NOT NULL,
  `mobile_no` varchar(15) NOT NULL,
  `email_id` varchar(100) NOT NULL,
  `is_orphan_flag` tinyint(4) NOT NULL,
  `is_disabled` char(1) NOT NULL,
  `mst_disablity_disablity_type_id` tinyint(3) unsigned DEFAULT NULL,
  `disability_percentage` tinyint(4) DEFAULT NULL,
  `ip_address` varchar(20) NOT NULL,
  `mst_gender_gender_id` char(1) NOT NULL,
  `mst_category_category_id` char(1) NOT NULL,
  `mst_religion_religion_type` tinyint(3) unsigned NOT NULL,
  `mst_marital_marital_type` tinyint(3) unsigned NOT NULL,
  `mst_scheme_scheme_id` int(11) NOT NULL,
  `mst_scholarship_category_scholarship_category_id` tinyint(3) unsigned NOT NULL,
  `mst_type_of_study_Study_id` char(1) NOT NULL,
  `mst_parent_profession_parent_profession_id` int(11) NOT NULL,
  `total_family_income` decimal(15,2) NOT NULL,
  `mst_bank_ifsc_branch_ifsc_code` varchar(20) NOT NULL,
  `bank_account_no` varchar(25) NOT NULL,
  `mst_identity_identity_id` tinyint(4) NOT NULL,
  `identity_no` varchar(50) NOT NULL,
  `mst_institute_officer_institute_officer_id` int(11) DEFAULT NULL,
  `institute_verify_ip` varchar(20) DEFAULT NULL,
  `institute_verify_date` date DEFAULT NULL,
  `institute_verify_status` char(1) DEFAULT NULL,
  `mst_nodal_officer_nodal_officer_id` varchar(20) DEFAULT NULL,
  `nodoff_ip` varchar(20) DEFAULT NULL,
  `nodoff_verify_date` date DEFAULT NULL,
  `nodoff_is_selected` tinyint(4) DEFAULT NULL,
  `is_approved_for_payment` char(1) DEFAULT NULL,
  `scholarship_fee_amount` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`registration_id`),
  KEY `fk_sch_applicant_basic_details_mst_gender1_idx` (`mst_gender_gender_id`),
  KEY `fk_sch_applicant_basic_details_mst_category1_idx` (`mst_category_category_id`),
  KEY `fk_sch_applicant_basic_details_mst_religion1_idx` (`mst_religion_religion_type`),
  KEY `fk_sch_applicant_basic_details_mst_marital1_idx` (`mst_marital_marital_type`),
  KEY `fk_sch_applicant_basic_details_mst_bank_ifsc1_idx` (`mst_bank_ifsc_branch_ifsc_code`),
  KEY `fk_sch_applicant_basic_details_mst_parent_profession1_idx` (`mst_parent_profession_parent_profession_id`),
  KEY `fk_sch_applicant_basic_details_mst_disablity1_idx` (`mst_disablity_disablity_type_id`),
  KEY `fk_sch_applicant_basic_details_mst_scheme1_idx` (`mst_scheme_scheme_id`),
  KEY `fk_sch_applicant_basic_details_mst_nodal_officer1_idx` (`mst_nodal_officer_nodal_officer_id`),
  KEY `fk_sch_applicant_basic_details_mst_institute_officer1_idx` (`mst_institute_officer_institute_officer_id`),
  KEY `fk_sch_applicant_basic_details_mst_type_of_study1_idx` (`mst_type_of_study_Study_id`),
  KEY `fk_sch_applicant_basic_details_mst_identity1_idx` (`mst_identity_identity_id`),
  KEY `fk_sch_applicant_basic_details_mst_scholarship_category1_idx` (`mst_scholarship_category_scholarship_category_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_bank_ifsc1` FOREIGN KEY (`mst_bank_ifsc_branch_ifsc_code`) REFERENCES `mst_bank_ifsc` (`branch_ifsc_code`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_category1` FOREIGN KEY (`mst_category_category_id`) REFERENCES `mst_category` (`category_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_disablity1` FOREIGN KEY (`mst_disablity_disablity_type_id`) REFERENCES `mst_disablity` (`disablity_type_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_gender1` FOREIGN KEY (`mst_gender_gender_id`) REFERENCES `mst_gender` (`gender_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_identity1` FOREIGN KEY (`mst_identity_identity_id`) REFERENCES `mst_identity` (`identity_id`) ON DELETE CASCADE,
  CONSTRAINT `fk_sch_applicant_basic_details_mst_institute_officer1` FOREIGN KEY (`mst_institute_officer_institute_officer_id`) REFERENCES `mst_institute_officer` (`institute_officer_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_marital1` FOREIGN KEY (`mst_marital_marital_type`) REFERENCES `mst_marital` (`marital_type`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_nodal_officer1` FOREIGN KEY (`mst_nodal_officer_nodal_officer_id`) REFERENCES `mst_nodal_officer` (`nodal_officer_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_parent_profession1` FOREIGN KEY (`mst_parent_profession_parent_profession_id`) REFERENCES `mst_parent_profession` (`parent_profession_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_religion1` FOREIGN KEY (`mst_religion_religion_type`) REFERENCES `mst_religion` (`religion_type`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_scheme1` FOREIGN KEY (`mst_scheme_scheme_id`) REFERENCES `mst_scheme` (`scheme_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_scholarship_category1` FOREIGN KEY (`mst_scholarship_category_scholarship_category_id`) REFERENCES `mst_scholarship_category` (`scholarship_category_id`),
  CONSTRAINT `fk_sch_applicant_basic_details_mst_type_of_study1` FOREIGN KEY (`mst_type_of_study_Study_id`) REFERENCES `mst_type_of_study` (`study_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_applicant_basic_details`
--

LOCK TABLES `sch_applicant_basic_details` WRITE;
/*!40000 ALTER TABLE `sch_applicant_basic_details` DISABLE KEYS */;
INSERT INTO `sch_applicant_basic_details` VALUES (1,'2018-12-12','0','SL','1','satwik','father','mother','1992-03-24','123456789','abc@yahoo.in',0,'N',NULL,NULL,'10.10.10.10','1','1',1,1,1,1,'1',1,1.00,'1111','1234567898',1,'7658676',1,'10.10.10.111','2018-12-13','V','1','10.102.100.01','2018-12-11',1,'Y',10000.00),(2,'2018-12-12','1','IR','1','gagan','g father','g mother','1992-03-02','12345678','baba@gmail.com',0,'Y',1,NULL,'12.1.1.1','1','1',1,1,1,1,'1',2,1111.00,'2222','11111222121',1,'223221',2,'10.11.1.1','2019-01-01','R',NULL,NULL,NULL,NULL,NULL,NULL),(3,'2018-12-12','2','IV','1','shweta','s father ','smother','1992-09-09','12345678','abc@hdhd.com',1,'N',NULL,NULL,'10.10.101.10','2','2',1,2,2,2,'2',2,11199.00,'3333','1111111',2,'987654',3,'19.010.00.11','2019-01-01','V',NULL,NULL,NULL,NULL,NULL,NULL),(4,'2018-12-13','1','NR','1','hari','f hari','m hari','1990-02-02','12345678','dhdh@gmail.com',1,'Y',2,NULL,'19.020.102.12','1','3',3,3,3,3,'2',1,811818.00,'3333','1234567888',2,'12345654343',1,'18.91.12.12','2019-01-01','V','1','10.19.19.12','2019-01-05',0,'N',NULL),(5,'2018-12-14','1','SR','1','harsh','h father','h mother','1992-09-02','98765432','gaga@gmail',0,'N',NULL,NULL,'87.2.211.2','1','2',4,3,1,1,'1',1,87654.00,'2222','87654321',1,'098765432',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(6,'2018-12-13','0','IC','1','aman','a father','a mother','1989-02-02','1234567','gdgdg@yahoo.com',0,'N',NULL,NULL,'10.12.122.12','1','2',1,1,1,1,'2',2,12212.00,'1111','12345672',1,'9876543456',2,'928282892','2019-01-01','C',NULL,NULL,NULL,NULL,NULL,NULL),(7,'2018-12-12','2','IV','1','harsha','h father','h mothre','1989-09-09','87654','gdhgd@hmail.com',0,'N',NULL,NULL,'98.19.19.11','1','1',1,1,1,1,'1',1,1000.00,'1111','111100191',1,'199292',1,'10.2.21.11','2019-09-09','V',NULL,NULL,NULL,NULL,NULL,NULL),(8,'2018-02-02','2','IV','1','ritwik','father r','mother r','1989-02-02','9876543','abc@yahoo.in',0,'N',NULL,NULL,'92.2.1.2','1','1',1,1,1,1,'1',1,100.00,'1111','12121212',1,'1010101991',1,'10.22.1.2','2019-09-09',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `sch_applicant_basic_details` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_sch_applicant_basic_details` BEFORE UPDATE ON `sch_applicant_basic_details` FOR EACH ROW begin
IF new.application_current_status = 'SR' THEN SET new.application_current_level= 1;
end if;
IF new.application_current_status = 'IV' THEN SET new.application_current_level= 2;
end if;
IF new.application_current_status = 'IR' THEN SET new.application_current_level= 1;
end if;
IF new.application_current_status = 'IC' THEN SET new.application_current_level= 0;
end if;
IF new.application_current_status = 'NV' THEN SET new.application_current_level= 3;
end if;
IF new.application_current_status = 'NR' THEN SET new.application_current_level= 1;
end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sch_applicant_education_details`
--

DROP TABLE IF EXISTS `sch_applicant_education_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sch_applicant_education_details` (
  `course_year` varchar(45) DEFAULT NULL,
  `academic_year` varchar(45) DEFAULT NULL,
  `sch_applicant_basic_details_registration_id` int(11) NOT NULL,
  `mst_institute_institute_id` int(11) NOT NULL,
  `mst_course_course_id` int(11) NOT NULL,
  `mst_university_board_university_id` int(11) NOT NULL,
  PRIMARY KEY (`sch_applicant_basic_details_registration_id`,`mst_course_course_id`,`mst_institute_institute_id`,`mst_university_board_university_id`),
  KEY `fk_sch_applicant_education_details_sch_applicant_basic_deta_idx` (`sch_applicant_basic_details_registration_id`),
  KEY `fk_sch_applicant_education_details_mst_course1_idx` (`mst_course_course_id`),
  KEY `fk_sch_applicant_education_details_mst_university_board1_idx` (`mst_university_board_university_id`),
  KEY `fk_sch_applicant_education_details_mst_institute1` (`mst_institute_institute_id`),
  CONSTRAINT `fk_sch_applicant_education_details_mst_course1` FOREIGN KEY (`mst_course_course_id`) REFERENCES `mst_course` (`course_id`),
  CONSTRAINT `fk_sch_applicant_education_details_mst_institute1` FOREIGN KEY (`mst_institute_institute_id`) REFERENCES `mst_institute` (`institute_id`),
  CONSTRAINT `fk_sch_applicant_education_details_mst_university_board1` FOREIGN KEY (`mst_university_board_university_id`) REFERENCES `mst_university_board` (`university_id`),
  CONSTRAINT `fk_sch_applicant_education_details_sch_applicant_basic_details1` FOREIGN KEY (`sch_applicant_basic_details_registration_id`) REFERENCES `sch_applicant_basic_details` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_applicant_education_details`
--

LOCK TABLES `sch_applicant_education_details` WRITE;
/*!40000 ALTER TABLE `sch_applicant_education_details` DISABLE KEYS */;
INSERT INTO `sch_applicant_education_details` VALUES ('2016','2016',1,1,1,1),('2017','2017',2,2,2,2),('2018','2018',3,2,3,2),('2017','2017',4,2,1,2),('2016','2017',5,1,2,1),('2018','2018',6,1,3,1);
/*!40000 ALTER TABLE `sch_applicant_education_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sch_student_address`
--

DROP TABLE IF EXISTS `sch_student_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `sch_student_address` (
  `address` varchar(45) DEFAULT NULL,
  `pin_code` varchar(45) DEFAULT NULL,
  `sch_applicant_basic_details_registration_id` int(11) NOT NULL,
  `mst_district_district_id` int(11) NOT NULL,
  `mst_address_type_address_id` char(1) NOT NULL,
  `mst_state_state_id` tinyint(4) NOT NULL,
  PRIMARY KEY (`sch_applicant_basic_details_registration_id`,`mst_district_district_id`,`mst_address_type_address_id`,`mst_state_state_id`),
  KEY `fk_sch_student_address_sch_applicant_basic_details1_idx` (`sch_applicant_basic_details_registration_id`),
  KEY `fk_sch_student_address_mst_district1_idx` (`mst_district_district_id`),
  KEY `fk_sch_student_address_mst_address_type1_idx` (`mst_address_type_address_id`),
  KEY `fk_sch_student_address_mst_state1_idx` (`mst_state_state_id`),
  CONSTRAINT `fk_sch_student_address_mst_address_type1` FOREIGN KEY (`mst_address_type_address_id`) REFERENCES `mst_address_type` (`address_id`),
  CONSTRAINT `fk_sch_student_address_mst_district1` FOREIGN KEY (`mst_district_district_id`) REFERENCES `mst_district` (`district_id`),
  CONSTRAINT `fk_sch_student_address_mst_state1` FOREIGN KEY (`mst_state_state_id`) REFERENCES `mst_state` (`state_id`),
  CONSTRAINT `fk_sch_student_address_sch_applicant_basic_details1` FOREIGN KEY (`sch_applicant_basic_details_registration_id`) REFERENCES `sch_applicant_basic_details` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sch_student_address`
--

LOCK TABLES `sch_student_address` WRITE;
/*!40000 ALTER TABLE `sch_student_address` DISABLE KEYS */;
INSERT INTO `sch_student_address` VALUES ('add','11001',1,1,'1',1),('addd','11111',2,2,'1',1),('add','32232',3,3,'1',2),('add','2323',4,3,'1',2),('add','1212',5,4,'1',2),('add','343434',6,4,'1',2);
/*!40000 ALTER TABLE `sch_student_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scheme_document_upload`
--

DROP TABLE IF EXISTS `scheme_document_upload`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `scheme_document_upload` (
  `sch_applicant_basic_details_registration_id` int(11) NOT NULL,
  `mst_doc_doc_id` tinyint(4) NOT NULL,
  `doc_file _type` varchar(45) DEFAULT NULL,
  `doc_upload_date_time` date DEFAULT NULL,
  `certificate_name` varchar(45) DEFAULT NULL,
  `place_of_issue` varchar(45) DEFAULT NULL,
  `issues_by` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`sch_applicant_basic_details_registration_id`,`mst_doc_doc_id`),
  KEY `fk_scheme_document_upload_mst_doc1_idx` (`mst_doc_doc_id`),
  CONSTRAINT `fk_scheme_document_upload_mst_doc1` FOREIGN KEY (`mst_doc_doc_id`) REFERENCES `mst_doc` (`doc_id`),
  CONSTRAINT `fk_scheme_document_upload_sch_applicant_basic_details1` FOREIGN KEY (`sch_applicant_basic_details_registration_id`) REFERENCES `sch_applicant_basic_details` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scheme_document_upload`
--

LOCK TABLES `scheme_document_upload` WRITE;
/*!40000 ALTER TABLE `scheme_document_upload` DISABLE KEYS */;
/*!40000 ALTER TABLE `scheme_document_upload` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_login`
--

DROP TABLE IF EXISTS `student_login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `student_login` (
  `Password` varchar(50) NOT NULL,
  `sch_applicant_basic_details_registration_id` int(11) NOT NULL,
  PRIMARY KEY (`sch_applicant_basic_details_registration_id`),
  CONSTRAINT `fk_Student_login_sch_applicant_basic_details1` FOREIGN KEY (`sch_applicant_basic_details_registration_id`) REFERENCES `sch_applicant_basic_details` (`registration_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_login`
--

LOCK TABLES `student_login` WRITE;
/*!40000 ALTER TABLE `student_login` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vapplicationdistrictstatewithcount`
--

DROP TABLE IF EXISTS `vapplicationdistrictstatewithcount`;
/*!50001 DROP VIEW IF EXISTS `vapplicationdistrictstatewithcount`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vapplicationdistrictstatewithcount` AS SELECT 
 1 AS `state_name`,
 1 AS `district_name`,
 1 AS `count(*)`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vapplicationstatus`
--

DROP TABLE IF EXISTS `vapplicationstatus`;
/*!50001 DROP VIEW IF EXISTS `vapplicationstatus`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `vapplicationstatus` AS SELECT 
 1 AS `scheme_name`,
 1 AS `mst_scheme_scheme_id`,
 1 AS `total_applications`,
 1 AS `total_rejected_applications`,
 1 AS `total_defective_applications`,
 1 AS `applications_pending_at_institute`,
 1 AS `applications_pending_at_nodal_officer`,
 1 AS `Student_selected_for_scholarship`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'scholarship_dbms'
--

--
-- Dumping routines for database 'scholarship_dbms'
--
/*!50003 DROP PROCEDURE IF EXISTS `countdistrictstate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `countdistrictstate`(in d INT, in s TINYINT)
begin
SELECT mst_state.state_name, mst_district.district_name, count(*)from sch_student_address
left join mst_state on mst_state.state_id = sch_student_address.mst_state_state_id
left join mst_district on mst_district.district_id = sch_student_address.mst_district_district_id
where sch_student_address.mst_district_district_id = @d and sch_student_address.mst_state_state_id = @s
group by sch_student_address.sch_applicant_basic_details_registration_id,mst_state.state_name, mst_district.district_name with rollup;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `set_application_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `set_application_status`(IN  p_application_level CHAR(1) ,IN  p_application_status varchar(3), IN p_registration_id int(11))
BEGIN 
    UPDATE sch_applicant_basic_details  SET application_current_level  = p_application_level, application_current_status=p_application_status WHERE  registration_id = p_registration_id ; 
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vapplicationdistrictstatewithcount`
--

/*!50001 DROP VIEW IF EXISTS `vapplicationdistrictstatewithcount`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vapplicationdistrictstatewithcount` AS select `mst_state`.`state_name` AS `state_name`,`mst_district`.`district_name` AS `district_name`,count(0) AS `count(*)` from ((`sch_student_address` left join `mst_state` on((`mst_state`.`state_id` = `sch_student_address`.`mst_state_state_id`))) left join `mst_district` on((`mst_district`.`district_id` = `sch_student_address`.`mst_district_district_id`))) group by `sch_student_address`.`sch_applicant_basic_details_registration_id`,`mst_state`.`state_name`,`mst_district`.`district_name` with rollup */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vapplicationstatus`
--

/*!50001 DROP VIEW IF EXISTS `vapplicationstatus`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vapplicationstatus` AS select `mst_scheme`.`scheme_name` AS `scheme_name`,`sch_applicant_basic_details`.`mst_scheme_scheme_id` AS `mst_scheme_scheme_id`,sum((case when (`sch_applicant_basic_details`.`application_current_status` <> 'SR') then 1 else 0 end)) AS `total_applications`,sum((case when (`sch_applicant_basic_details`.`application_current_status` in ('IR','NR')) then 1 else 0 end)) AS `total_rejected_applications`,sum((case when (`sch_applicant_basic_details`.`application_current_status` = 'IC') then 1 else 0 end)) AS `total_defective_applications`,sum((case when (`sch_applicant_basic_details`.`application_current_level` = 1) then 1 else 0 end)) AS `applications_pending_at_institute`,sum((case when (`sch_applicant_basic_details`.`application_current_level` = 2) then 1 else 0 end)) AS `applications_pending_at_nodal_officer`,sum((case when ((`sch_applicant_basic_details`.`application_current_status` = 'NV') and (`sch_applicant_basic_details`.`institute_verify_status` = 'V') and (`sch_applicant_basic_details`.`is_approved_for_payment` = 'Y')) then 1 else 0 end)) AS `Student_selected_for_scholarship` from (`sch_applicant_basic_details` left join `mst_scheme` on((`mst_scheme`.`scheme_id` = `sch_applicant_basic_details`.`mst_scheme_scheme_id`))) group by `sch_applicant_basic_details`.`mst_scheme_scheme_id` */;
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

-- Dump completed on 2018-12-13  3:44:17
