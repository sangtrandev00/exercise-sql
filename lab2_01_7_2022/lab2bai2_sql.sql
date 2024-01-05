-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: quanlybanhang
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
  `maHoaDon` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ngayMuaHang` date NOT NULL,
  `maKhachHang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `trangThai` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maHoaDon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadon`
--

LOCK TABLES `hoadon` WRITE;
/*!40000 ALTER TABLE `hoadon` DISABLE KEYS */;
INSERT INTO `hoadon` VALUES ('HD001','2021-12-03','KH003','Đã thanh toán'),('HD002','2022-03-12','KH002','Chưa thanh toán'),('HD003','2022-01-23','KH001','Đã thanh toán'),('HD004','2022-04-13','KH002','Đã thanh toán'),('HD005','2022-02-15','KH004','Chưa thanh toán'),('HD006','2022-02-16','KH005','Đã thanh toán'),('HD007','2022-01-10','KH001','Đã thanh toán'),('HD008','2022-06-12','KH003','Chưa thanh toán'),('HD009','2022-05-11','KH004','Đã thanh toán'),('HD010','2021-12-11','KH006','Đã thanh toán'),('HD011','2021-06-12','KH007','Đã thanh toán'),('HD012','2022-12-11','KH005','Đã thanh toán');
/*!40000 ALTER TABLE `hoadon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hoadonchitiet`
--

DROP TABLE IF EXISTS `hoadonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hoadonchitiet` (
  `maHoaDon` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `maSanPham` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL,
  `maHoaDonChiTiet` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maHoaDonChiTiet`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hoadonchitiet`
--

LOCK TABLES `hoadonchitiet` WRITE;
/*!40000 ALTER TABLE `hoadonchitiet` DISABLE KEYS */;
INSERT INTO `hoadonchitiet` VALUES ('HD001','SP001',2,'HDCT001'),('HD002','SP003',1,'HDCT002'),('HD003','SP004',3,'HDCT003'),('HD004','SP002',4,'HDCT004'),('HD005','SP005',3,'HDCT005'),('HD006','SP002',10,'HDCT006'),('HD007','SP003',13,'HDCT007'),('HD008','SP004',8,'HDCT008'),('HD009','SP005',12,'HDCT009'),('HD010','SP002',8,'HDCT010'),('HD011','SP003',7,'HDCT011'),('HD012','SP005',3,'HDCT012'),('HD013','SP006',4,'HDCT013');
/*!40000 ALTER TABLE `hoadonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `khachhang`
--

DROP TABLE IF EXISTS `khachhang`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `khachhang` (
  `maKhachHang` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hoVaTenLot` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Họ và tên lót khách hàng',
  `Ten` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Tên khách hàng',
  `diaChi` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Địa chỉ khách hàng',
  `Email` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Email khách hàng',
  `dienThoai` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Số điện thoại khách hàng',
  PRIMARY KEY (`maKhachHang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `khachhang`
--

LOCK TABLES `khachhang` WRITE;
/*!40000 ALTER TABLE `khachhang` DISABLE KEYS */;
INSERT INTO `khachhang` VALUES ('KH001','tran nhat 2','Sang - 2','Di An, Binh Duong','nhatsang0101@gmail.com','0937988510'),('KH002','Tran Van','Lan','Dong Thanh, Bien Hoa','vanlan@gmail.com','0909129236'),('KH003','Vo Thi ','Ngoi','Hoang Kiem, Ha Noi','thingoi@gmail.com','0909129235'),('KH004','Ha Thi','Loan','Tan Phuoc Khanh, Binh Phuoc','thiloan@gmail.com','0909234567'),('KH005','Tran','Nhi','Ba Ria, Vung Tau','nhitran@gmail.com','0935789821'),('KH006','Vo Van','An','Dong Hoa, Binh Duong','vanan@gmail.com','0989001356'),('KH007','Tran Thi','Hue','An Binh, Binh Duong','thihue@gmail.com','0892301123');
/*!40000 ALTER TABLE `khachhang` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sanpham`
--

DROP TABLE IF EXISTS `sanpham`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sanpham` (
  `maSanPham` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `moTa` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `soLuong` int(11) NOT NULL,
  `donGia` float NOT NULL,
  `tenSP` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`maSanPham`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sanpham`
--

LOCK TABLES `sanpham` WRITE;
/*!40000 ALTER TABLE `sanpham` DISABLE KEYS */;
INSERT INTO `sanpham` VALUES ('SP001','Laptop laveno xx pin siêu trâu',30,14000000,'laptop leveno model 16'),('SP002','Laptop Asus mới ra chính hãng',35,16000000,'Laptop Asus pro X13'),('SP003','Laptop Dell lướt web thả ga, tha hồ coding',32,13000000,'Laptop Dell version 2'),('SP004','Laptop MSI giao diện chiến game cực đỉnh',40,21000000,'Laptop MSI X19'),('SP005','Laptop Acer đời mới, dân văn phòng',38,18000000,'Laptop Acer 003'),('SP006','Laptop HP bền không thể tả nổi',39,19000000,'Laptop HP 31'),('SP007','Macbook pro doanh nhân thành đạt',43,23000000,'Mackbook pro 2019'),('SP008','Laptop Apple Đồ họa cực cao, xử lý nhanh mọi tác vụ',50,30000000,'Apple Lap'),('SP009','Macbook PRO chip M1 tốc độ xử lý vô địch',20,32000000,'MackBook Pro chip M1');
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

-- Dump completed on 2022-07-11 19:34:04
