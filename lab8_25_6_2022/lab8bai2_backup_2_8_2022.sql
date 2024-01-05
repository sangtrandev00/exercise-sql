-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: ps20227_tran_nhat_sang_web18101_lab7
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
-- Table structure for table `hoadon`
--

DROP TABLE IF EXISTS `hoadon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoadon` (
  `maHoaDon` varchar(10) NOT NULL,
  `maKhachHang` varchar(10) DEFAULT NULL,
  `ngayMuaHang` date NOT NULL,
  `trangThai` varchar(20) NOT NULL,
  PRIMARY KEY (`maHoaDon`),
  KEY `FK_hoadon_khachhang` (`maKhachHang`),
  CONSTRAINT `FK_hoadon_khachhang` FOREIGN KEY (`maKhachHang`) REFERENCES `khachhang` (`maKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES ('120954','KH001','2016-03-23','đã thanh toán'),('120955','KH002','2016-02-04','đã thanh toán'),('120956','KH001','2016-07-12','chưa thanh toán'),('120957','KH004','2016-04-12','chưa thanh toán');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoadonchitiet` (
  `maHoaDonChiTiet` varchar(5) NOT NULL,
  `maHoaDon` varchar(10) DEFAULT NULL,
  `maSanPham` varchar(5) DEFAULT NULL,
  `soLuong` int(11) NOT NULL,
  PRIMARY KEY (`maHoaDonChiTiet`),
  KEY `FK_HDCT_hoadon` (`maHoaDon`),
  KEY `KF_HDCT_sanpham` (`maSanPham`),
  CONSTRAINT `FK_HDCT_hoadon` FOREIGN KEY (`maHoaDon`) REFERENCES `hoadon` (`maHoaDon`),
  CONSTRAINT `KF_HDCT_sanpham` FOREIGN KEY (`maSanPham`) REFERENCES `sanpham` (`maSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES ('1','120954','3',40),('2','120954','1',20),('3','120955','2',100),('4','120956','4',6),('6','120956','1',10),('7','120957','2',50);
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `maKhachHang` varchar(10) NOT NULL,
  `hoVaTenLot` varchar(30) NOT NULL,
  `ten` varchar(10) NOT NULL,
  `diaChi` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dienThoai` varchar(13) NOT NULL,
  PRIMARY KEY (`maKhachHang`),
  UNIQUE KEY `unique_index_dienThoai` (`dienThoai`),
  UNIQUE KEY `unique_index_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('KH001','Nguyễn Thị','Nga','15 Quang Trung TP Đà Nẵng','ngant@gmail.com','0912345670'),('KH002','Trần Công ','Thành','234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16109423443'),('KH003','Lê Hoàng','Nam','23 Trần Phú TP Huế','namlt@gmail.com','0989354556'),('KH004','Vũ Ngọc','Hiền','37 Nguyễn thị Thập TP Đà Nẵng','hienvn@gmail.com','0923451511');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang_danang`
--

DROP TABLE IF EXISTS `khachhang_danang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang_danang` (
  `maKhachHang` varchar(10) NOT NULL,
  `hoVaTenLot` varchar(30) NOT NULL,
  `ten` varchar(10) NOT NULL,
  `diaChi` varchar(100) NOT NULL,
  `email` varchar(30) NOT NULL,
  `dienThoai` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang_danang`
--

LOCK TABLES `khachhang_danang` WRITE;
/*!40000 ALTER TABLE `khachhang_danang` DISABLE KEYS */;
INSERT INTO `khachhang_danang` VALUES ('KH001','Nguyễn Thị','Nga','15 Quang Trung TP Đà Nẵng','ngant@gmail.com','0912345670'),('KH004','Vũ Ngọc','Hiền','37 Nguyễn thị Thập TP Đà Nẵng','hienvn@gmail.com','0912345670');
/*!40000 ALTER TABLE `khachhang_danang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanpham` (
  `maSanPham` varchar(5) NOT NULL,
  `moTa` varchar(255) NOT NULL,
  `soLuong` int(11) NOT NULL,
  `donGia` float NOT NULL,
  `tenSP` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`maSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('1','Samsung Galaxy J7 Pro là một chiếc\n		smartphone phù hợp với những người\n		yêu thích một sản phẩm pin tốt, thích\n		hệ điều hành mới cùng những tính\n		năng đi kèm độc quyền ',800,6600000,'Samsung Galaxy J7 Pro'),('2','iPhone 6 là một trong những\n		smartphone được yêu thích nhất.\n		Lắng nghe nhu cầu về thiết kế, khả\n		năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối\n		chính hãng tại Việt Nam hứa hẹn sẽ\n		là một sản phẩm rất \"Hot\"s',700,8990000,'Iphone 6 32GB'),('3','Dell Inspiron 3467 i3\n		7100U/4GB/1TB/Win10/(M20NR21)',507,11290000,'Laptop Dell\n		Inspiron 3467'),('4','Pin sạc dự phòng Polymer 5.000\n		mAh eSaver JP85',600,200000,'Pin sạc dự\n		phòng'),('5','Nokia 3100 phù hợp với SINH VIÊN',100,700000,'Nokia 3100');
/*!40000 ALTER TABLE `sanpham` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-08-02 19:18:49
