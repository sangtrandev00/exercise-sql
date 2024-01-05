-- 1. Tao database 
create database ps20227_trannhatsang_bds;
-- 2. Tao bang Van Phong
create table VanPhong (
	maVanPhong int primary key,
    tenVanPhong varchar(50) not null,
    diaDiem varchar(100) not null  
    );
    
-- 3. Tao bang chu so huu
 create table ChuSoHuu(
	maChuSoHuu int primary key, 
    tenChuSoHuu varchar(50) not null,
    diaChi varchar(125) not null,
    soDienThoai varchar(15) not null
    );    
-- 4. Tao bang bat dong san
create table BDS (
	maBDS INT primary key,
    diaChi varchar(50) not null,
    maVanPhong INT references VanPhong (maVanPhong),
    maChuSoHuu int references ChuSoHuu (maChuSoHuu)  );
	
-- 5. Tao bang nhan vien
create table NhanVien (
	maNhanVien INT primary key,
	tenNhanVien varchar(50) not null,
    Email varchar(50) not null,
    soDienThoai varchar(15) not null,
    diaChi varchar(50) not null,
    maVanPhong INT references VanPhong (maVanPhong)
    );
-- 6. Tao ban than nhan
create table NhanThan(
	maNhanThan INT primary key,
    tenNhanThan varchar(50) not null,
    ngaySinh date not null,
    moiQuanHe varchar(50) not null,
    maNhanVien INT references NhanVien(maNhanVien));
    
