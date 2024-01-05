-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: quanlybanhang_lab7
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
  `maKhachHang` varchar(10) DEFAULT NULL,
  `maHoaDon` varchar(10) NOT NULL,
  `ngayMuaHang` date NOT NULL,
  `trangThai` varchar(20) NOT NULL,
  PRIMARY KEY (`maHoaDon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES ('KH001','120954','2016-03-23','đã thanh toán'),('KH002','120955','2016-02-04','đã thanh toán'),('KH001','120956','2016-07-12','Chưa thanh toán'),('KH004','120957','2016-04-12','chưa thanh toán'),('KH005','120958','2016-12-12','Đã thanh toán'),('KH006','120959','2016-12-13','Đã thanh toán'),('KH007','120960','2016-12-23','Chưa thanh toán'),('KH008','120961','2015-12-21','Đã thanh toán'),('KH009','120962','2015-12-11','Đã thanh toán'),('KH009','120963','2016-11-20','Đã thanh toán'),('KH003','120964','2015-03-22','Đã thanh toán');
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
  PRIMARY KEY (`maHoaDonChiTiet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES ('1','120954','3',40),('10','120960','3',100),('2','120954','1',20),('3','120955','2',100),('4','120956','4',14),('7','120957','2',50),('8','120958','2',80),('9','120959','2',30);
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
  UNIQUE KEY `unique_index_dienthoai` (`dienThoai`),
  UNIQUE KEY `unique_index_email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('KH001','Nguyễn Thị','Nga','15 Quang Trung TP Đà Nẵng','ngant@gmail.com','0912345670'),('KH002','Trần Công ','Thành','234 Lê Lợi Quảng Nam','thanhtc@gmail.com','16267788989'),('KH004','Vũ Ngọc','Hiền','37 Nguyễn thị Thập TP Đà Nẵng','hienvn@gmail.com','0894545435'),('KH005','Trần Minh ','Chiến','40 Quang Trung, Quận 1','chientm@gmail.com','0934667277'),('KH006','Đinh Văn ','Thành','20 Cam ranh, Tây Ninh','thanhvd@gmail.com','0456277377'),('KH007','Tạ Thị','Huệ','Dĩ An, Bình Dương','huett@gmail.com','0626667272'),('KH009','Trần Nhật ','Sang','Cao lãnh, Đồng Tháp','sangtn@gmail.com','0938099316');
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
-- Table structure for table `new_table`
--

DROP TABLE IF EXISTS `new_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table` (
  `maSanPham` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table`
--

LOCK TABLES `new_table` WRITE;
/*!40000 ALTER TABLE `new_table` DISABLE KEYS */;
INSERT INTO `new_table` VALUES ('4'),('1');
/*!40000 ALTER TABLE `new_table` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_table_12_2016`
--

DROP TABLE IF EXISTS `new_table_12_2016`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_table_12_2016` (
  `maSanPham` varchar(5) DEFAULT NULL,
  `TongSoLuong` decimal(32,0) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_table_12_2016`
--

LOCK TABLES `new_table_12_2016` WRITE;
/*!40000 ALTER TABLE `new_table_12_2016` DISABLE KEYS */;
INSERT INTO `new_table_12_2016` VALUES ('2',110),('3',100);
/*!40000 ALTER TABLE `new_table_12_2016` ENABLE KEYS */;
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
INSERT INTO `sanpham` VALUES ('1','Samsung Galaxy J7 Pro là một chiếc\n		smartphone phù hợp với những người\n		yêu thích một sản phẩm pin tốt, thích\n		hệ điều hành mới cùng những tính\n		năng đi kèm độc quyền ',800,5078700,'Samsung Galaxy J7 Pro'),('2','Màn hình máy tính Asus, siêu mỏng, siêu tiện lợi',120,7000000,'Asus monitor 12'),('3','Dell Inspiron 3467 i3\n		7100U/4GB/1TB/Win10/(M20NR21)',707,10725500,'Laptop Dell\n		Inspiron 3467'),('4','Pin sạc dự phòng Polymer 5.000\n		mAh eSaver JP85',600,153900,'Pin sạc dự\n		phòng'),('5','Nokia 3100 phù hợp với SINH VIÊN',100,665000,'Nokia 3100');
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

-- Dump completed on 2022-06-25 13:57:45
