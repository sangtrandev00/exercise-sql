-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema quanlybanhang2
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `quanlybanhang2` ;

-- -----------------------------------------------------
-- Schema quanlybanhang2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `quanlybanhang2` DEFAULT CHARACTER SET utf8 ;
SHOW WARNINGS;
USE `quanlybanhang2` ;

-- -----------------------------------------------------
-- Table `KhachHang`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `KhachHang` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `KhachHang` (
  `maKhachHang` VARCHAR(10) NOT NULL,
  `hoVaTenLot` VARCHAR(50) NOT NULL,
  `Ten` VARCHAR(50) NOT NULL,
  `diaChi` VARCHAR(225) NOT NULL,
  `Email` VARCHAR(50) NOT NULL,
  `dienThoai` VARCHAR(13) NOT NULL,
  PRIMARY KEY (`maKhachHang`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `SanPham`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `SanPham` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `SanPham` (
  `maSanPham` INT NOT NULL,
  `moTa` VARCHAR(255) NOT NULL,
  `soLuong` INT NOT NULL,
  `donGia` INT NOT NULL,
  `tenSP` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`maSanPham`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HoaDon`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HoaDon` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `HoaDon` (
  `maHoaDon` INT NOT NULL,
  `ngayMuaHang` DATE NOT NULL,
  `maKhachHang` VARCHAR(10) NOT NULL,
  `trangThai` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`maHoaDon`))
ENGINE = InnoDB;

SHOW WARNINGS;

-- -----------------------------------------------------
-- Table `HoaDonChiTiet`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `HoaDonChiTiet` ;

SHOW WARNINGS;
CREATE TABLE IF NOT EXISTS `HoaDonChiTiet` (
  `maHoaDon` INT NOT NULL,
  `maSanPham` INT NOT NULL,
  `soLuong` INT NOT NULL,
  `maHoaDonChiTiet` INT NOT NULL,
  PRIMARY KEY (`maHoaDonChiTiet`))
ENGINE = InnoDB;

SHOW WARNINGS;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
