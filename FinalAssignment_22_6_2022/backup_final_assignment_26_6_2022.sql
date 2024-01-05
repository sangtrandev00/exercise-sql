-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: quanlythuvien_26_6_2022
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
-- Table structure for table `loaisach`
--

DROP TABLE IF EXISTS `loaisach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loaisach` (
  `maLoai` varchar(10) NOT NULL,
  `tenLoaiSach` varchar(50) NOT NULL,
  PRIMARY KEY (`maLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loaisach`
--

LOCK TABLES `loaisach` WRITE;
/*!40000 ALTER TABLE `loaisach` DISABLE KEYS */;
INSERT INTO `loaisach` VALUES ('cntt','Công nghệ thông tin'),('ct','Chính Trị'),('ecom','Kinh tế'),('ks','Du lịch và khách sạn'),('math','Toán học'),('mkt','Marketting'),('psy','Tâm lý học'),('pts','Photoshop'),('sql','Cơ sở dữ liệu'),('tg','Tôn Giáo'),('vh','Văn học'),('xh','Xã hội học');
/*!40000 ALTER TABLE `loaisach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuon`
--

DROP TABLE IF EXISTS `phieumuon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phieumuon` (
  `maPhieuMuon` int(11) NOT NULL AUTO_INCREMENT,
  `ngayMuon` date NOT NULL,
  `ngayTra` date DEFAULT NULL,
  `soLuongSach` int(11) NOT NULL,
  `maSinhVien` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`maPhieuMuon`),
  KEY `FK_phieuMuon_TheSinhVien` (`maSinhVien`),
  CONSTRAINT `FK_phieuMuon_TheSinhVien` FOREIGN KEY (`maSinhVien`) REFERENCES `thesinhvien` (`maSinhVien`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuon`
--

LOCK TABLES `phieumuon` WRITE;
/*!40000 ALTER TABLE `phieumuon` DISABLE KEYS */;
INSERT INTO `phieumuon` VALUES (1,'2017-02-02','2017-02-15',3,'PD05394'),(2,'2016-01-02','2016-01-15',2,'PD05021'),(3,'2021-02-28','2021-10-21',1,'PD05364'),(4,'2020-12-02','2022-07-21',2,'PD05396'),(5,'2019-02-02','2019-02-08',3,'PD05395'),(6,'2019-03-11','2019-03-21',2,'PS20227'),(7,'2018-04-12','2019-06-13',2,'PS20228'),(8,'2021-05-13','2021-06-01',3,'PS20229');
/*!40000 ALTER TABLE `phieumuon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phieumuonchitiet`
--

DROP TABLE IF EXISTS `phieumuonchitiet`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `phieumuonchitiet` (
  `maPhieuMuonChiTiet` varchar(10) NOT NULL,
  `maSach` varchar(10) DEFAULT NULL,
  `maPhieuMuon` int(11) DEFAULT NULL,
  `ghiChu` varchar(100) NOT NULL,
  `ngayGiaHan` date DEFAULT NULL,
  PRIMARY KEY (`maPhieuMuonChiTiet`),
  KEY `FK_phieuMuonChiTiet_QuyenSach` (`maSach`),
  KEY `FK_phieuMuonChiTiet_PhieuMuon` (`maPhieuMuon`),
  CONSTRAINT `FK_phieuMuonChiTiet_PhieuMuon` FOREIGN KEY (`maPhieuMuon`) REFERENCES `phieumuon` (`maPhieuMuon`),
  CONSTRAINT `FK_phieuMuonChiTiet_QuyenSach` FOREIGN KEY (`maSach`) REFERENCES `quyensach` (`maSach`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phieumuonchitiet`
--

LOCK TABLES `phieumuonchitiet` WRITE;
/*!40000 ALTER TABLE `phieumuonchitiet` DISABLE KEYS */;
INSERT INTO `phieumuonchitiet` VALUES ('PMCT001','SQL001',1,'Đã trả sách','2017-02-15'),('PMCT002','IT002',2,'Đã trả sách','2016-01-15'),('PMCT003','SQL003',3,'Đã trả sách',NULL),('PMCT004','PTS004',4,'Chưa trả sách',NULL),('PMCT005','IT005',5,'Đã trả sách','2019-02-08'),('PMCT006','SQL001',6,'Đã trả sách',NULL),('PMCT007','SQL001',3,'Đã trả sách',NULL);
/*!40000 ALTER TABLE `phieumuonchitiet` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quyensach`
--

DROP TABLE IF EXISTS `quyensach`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quyensach` (
  `maSach` varchar(10) NOT NULL,
  `tieuDe` varchar(50) NOT NULL,
  `nhaXuatBan` varchar(50) NOT NULL,
  `tacGia` varchar(30) NOT NULL,
  `soTrang` int(11) NOT NULL CHECK (`soTrang` >= 5),
  `banSao` int(11) NOT NULL CHECK (`banSao` > 1),
  `giaTien` float NOT NULL CHECK (`giaTien` > 0),
  `ngayNhapKho` date NOT NULL,
  `viTriDatSach` varchar(10) DEFAULT NULL,
  `maLoai` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`maSach`),
  KEY `FK_quyenSach_LoaiSach` (`maLoai`),
  CONSTRAINT `FK_quyenSach_LoaiSach` FOREIGN KEY (`maLoai`) REFERENCES `loaisach` (`maLoai`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quyensach`
--

LOCK TABLES `quyensach` WRITE;
/*!40000 ALTER TABLE `quyensach` DISABLE KEYS */;
INSERT INTO `quyensach` VALUES ('IT002','Lap trinh huong doi tuong','NXB Ha Noi','Herbert Schildt',20,4,400000,'2017-01-30','VT0002','cntt'),('IT005','Photoshop nang cao','NXB Ha Noi','Cavert Lewin',20,4,500000,'2017-01-01','VT0005','cntt'),('MAR201','Marketing trên internet','NXB HCM','Robert Alberto',120,30,122000,'0000-00-00','VT0008','ecom'),('PTS004','Photoshop','NXB Ha Noi','Luis Diaz',25,4,350000,'2016-07-05','VT0004','cntt'),('SQL001','SQL sever','NXB Ha Noi','Mike Tyson',30,9,350000,'2010-01-20','VT0001','cntt'),('SQL003','Tin hoc co so','NXB Ha Noi','Darkwin urik',15,4,200000,'2018-05-06','VT0003','cntt');
/*!40000 ALTER TABLE `quyensach` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `thesinhvien`
--

DROP TABLE IF EXISTS `thesinhvien`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `thesinhvien` (
  `maSinhVien` varchar(10) NOT NULL,
  `tenSinhVien` varchar(50) NOT NULL,
  `ngayHetHan` date NOT NULL,
  `chuyenNganhHoc` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `soDienThoai` varchar(13) NOT NULL,
  `maLop` varchar(10) NOT NULL,
  PRIMARY KEY (`maSinhVien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `thesinhvien`
--

LOCK TABLES `thesinhvien` WRITE;
/*!40000 ALTER TABLE `thesinhvien` DISABLE KEYS */;
INSERT INTO `thesinhvien` VALUES ('PD05021','Mai Ngọc Anh','2022-04-06','Lập trình','anhmn@gmail.com','0123456785','LT16005'),('PD05364','Nguyễn Ngọc Anh','2022-06-05','Lập trình','anhnn@gmail.com','0123456784','LT16004'),('PD05394','Hồ Ngọc Anh','2022-09-06','Lập trình','anhhn@gmail.com','0123456783','LT16003'),('PD05395','Đặng Ngọc Anh','2022-03-03','Lập trình Máy Tính','anh@gmail.com','0123456789','LT16001'),('PD05396','Đặng Ngọc Minh','2022-06-08','Lập trình','minh@gmail.com','0123456782','LT16002'),('PS20227','Trần Nhật Sang','2022-11-08','Lập trình Web','sang@gmail.com','0123456792','WEB1013'),('PS20228','Trần Văn Lan','2022-12-12','Ứng dụng phần mềm','lan@gmail.com','0123459821','UDPM1012'),('PS20229','Hà Thị Loan','2023-03-11','Thiết kế ứng dụng mobile','loan@gmail.com','0123486232','MOB1021');
/*!40000 ALTER TABLE `thesinhvien` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-06-26 16:19:28
