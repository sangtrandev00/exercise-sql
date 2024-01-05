-- Lab 4.1 Yeu cau 1 

create database ps20227_Tran_Nhat_Sang_Web18101_Lab4; 

create table vanPhong(
	maVanPhong varchar(10) primary key,
    diaDiem varchar(255) not null,
    tenVanPhong varchar(50) not null
);

create table nhanVien(
	maNhanVien varchar(10) primary key,
    tenNhanVien varchar(50) not null,
    email varchar(50) not null,
    soDienThoai varchar(50) not null,
    maVanPhong varchar(10) not null
);

alter table nhanVien
add constraint FK_NhanVien_VanPhong foreign key(maVanPhong)
references vanPhong(maVanPhong);

create table nhanThan(
	maNhanThan varchar(10) primary key,
    tenNhanThan varchar(50) not null,
    ngaySinh date not null,
    maNhanVien varchar(50) not null
);

alter table nhanThan
add constraint FK_nhanThan_NhanVien 
foreign key(maNhanVien)
references nhanVien(maNhanVien);

create table chuSoHuu(
	maChuSoHuu varchar(10) primary key,
    tenChuSoHuu varchar(50) not null,
    diaChi varchar(255) not null,
    soDienThoai varchar(13) not null
);

create table BDS(
	maSoBDS varchar(10) primary key,
    maVanPhong varchar(10) not null,
    maSoChuSoHuu varchar(10) not null,
    diaChi varchar(255) not null
);

alter table BDS
add constraint FK_BDS_ChuSoHuu
foreign key(maSoChuSoHuu)
references chuSoHuu(maChuSoHuu);

-- Lab 4.2 Yeu cau 2
-- Them cot soCMND cho bang nhanvien
alter table nhanVien
add column SoCMND varchar(10);

-- Them rang buoc unique cho cot SoCMND trong table NhanVien

alter table nhanVien
add unique(soCMND);

-- Doi kieu du lieu cua co MaNV thanh varchar(7)
SET FOREIGN_KEY_CHECKS = 0; -- Tai sao lai co dong nay
alter table nhanVien
modify column maNhanVien varchar(7);

-- Them cot gioitinh cho table nhanvien

alter table nhanvien
add column gioiTinh boolean; -- 0 --> false, khac 0 la --> true

-- Xoa rang buoc khoa ngoai cua table thannhan voi nhanvien
-- ALTER TABLE tbl_name DROP FOREIGN KEY fk_symbol

alter table nhanthan
drop foreign key FK_nhanThan_NhanVien;

-- Xoa table nhanThan
alter table nhanthan;
