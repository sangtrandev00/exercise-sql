create database backup_ps20227_lab8bai2;

use backup_ps20227_lab8bai2;
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: quanlybatdongsan_20_6
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `batdongsan`
--

DROP TABLE IF EXISTS `batdongsan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `batdongsan` (
  `maSoBDS` varchar(10) NOT NULL,
  `diaChi` varchar(50) DEFAULT NULL,
  `maChuSoHuu` varchar(10) DEFAULT NULL,
  `maVanPhong` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`maSoBDS`),
  KEY `fk_ChuSoHuu` (`maChuSoHuu`),
  KEY `fk_VanPhong_BDS` (`maVanPhong`),
  CONSTRAINT `fk_ChuSoHuu` FOREIGN KEY (`maChuSoHuu`) REFERENCES `chusohuu` (`maChuSoHuu`),
  CONSTRAINT `fk_VanPhong_BDS` FOREIGN KEY (`maVanPhong`) REFERENCES `vanphong` (`maVanPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batdongsan`
--

LOCK TABLES `batdongsan` WRITE;
/*!40000 ALTER TABLE `batdongsan` DISABLE KEYS */;
/*!40000 ALTER TABLE `batdongsan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chusohuu`
--

DROP TABLE IF EXISTS `chusohuu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chusohuu` (
  `maChuSoHuu` varchar(10) NOT NULL,
  `tenChuSoHuu` varchar(30) DEFAULT NULL,
  `diaChi` varchar(50) DEFAULT NULL,
  `soDienThoai` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`maChuSoHuu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chusohuu`
--

LOCK TABLES `chusohuu` WRITE;
/*!40000 ALTER TABLE `chusohuu` DISABLE KEYS */;
/*!40000 ALTER TABLE `chusohuu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanthan`
--

DROP TABLE IF EXISTS `nhanthan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhanthan` (
  `tenNhanThan` varchar(30) DEFAULT NULL,
  `ngaySinh` date DEFAULT NULL,
  `MSNV` varchar(10) DEFAULT NULL,
  `maNhanThan` varchar(10) NOT NULL,
  PRIMARY KEY (`maNhanThan`),
  KEY `fk_NhanVien` (`MSNV`),
  CONSTRAINT `fk_NhanVien` FOREIGN KEY (`MSNV`) REFERENCES `nhanvien` (`MSNV`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanthan`
--

LOCK TABLES `nhanthan` WRITE;
/*!40000 ALTER TABLE `nhanthan` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanthan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nhanvien`
--

DROP TABLE IF EXISTS `nhanvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nhanvien` (
  `MSNV` varchar(10) NOT NULL,
  `soDienThoai` varchar(13) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `gioiTinh` tinyint(1) DEFAULT NULL,
  `maVanPhong` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`MSNV`),
  KEY `fk_VanPhong` (`maVanPhong`),
  CONSTRAINT `fk_VanPhong` FOREIGN KEY (`maVanPhong`) REFERENCES `vanphong` (`maVanPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nhanvien`
--

LOCK TABLES `nhanvien` WRITE;
/*!40000 ALTER TABLE `nhanvien` DISABLE KEYS */;
/*!40000 ALTER TABLE `nhanvien` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vanphong`
--

DROP TABLE IF EXISTS `vanphong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vanphong` (
  `maVanPhong` varchar(10) NOT NULL,
  `diaDiem` varchar(50) DEFAULT NULL,
  `tenVanPhong` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`maVanPhong`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vanphong`
--

LOCK TABLES `vanphong` WRITE;
/*!40000 ALTER TABLE `vanphong` DISABLE KEYS */;
/*!40000 ALTER TABLE `vanphong` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-25 14:01:25
