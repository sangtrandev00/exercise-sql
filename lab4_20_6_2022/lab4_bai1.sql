create database quanlybatdongsan_20_6;

use quanlybatdongsan_20_6;

create table VanPhong(
	maVanPhong varchar(10),
    diaDiem varchar(50),
    tenVanPhong varchar(30)
);

create table NhanVien(
	MSNV varchar(10),
    soDienThoai varchar(13),
    email varchar(30),
    gioiTinh boolean,
    maVanPhong varchar(10)
);

create table NhanThan(
	tenNhanThan varchar(30),
    ngaySinh date,
    MSNV varchar(10)
);

create table ChuSoHuu(
	maChuSoHuu varchar(10),
    tenChuSoHuu varchar(30),
    diaChi varchar(50),
    soDienThoai varchar(13)
);

create table BatDongSan(
	maSoBDS varchar(10),
    diaChi varchar(50),
    maChuSoHuu varchar(10),
    maVanPhong varchar(10)
);

alter table VanPhong
add constraint pri_VanPhong
primary key (maVanPhong);

alter table NhanVien
add constraint pri_NhanVien
primary key (MSNV);

alter table ChuSoHuu
add constraint pri_ChuSoHuu
primary key (maChuSoHuu);

alter table NhanThan
add column maNhanThan varchar(10);

alter table NhanThan
add constraint pri_NhanThan
primary key (maNhanThan);

alter table NhanVien
add constraint fk_VanPhong
foreign key (maVanPhong)
references VanPhong(maVanPhong);

alter table NhanThan
add constraint fk_NhanVien
foreign key (MSNV)
references NhanVien(MSNV);

alter table BatDongSan
add constraint pri_BatDongSan
primary key (maSoBDS);

alter table BatDongSan
add constraint fk_ChuSoHuu
foreign key (maChuSoHuu)
references ChuSoHuu(maChuSoHuu);

alter table BatDongSan
add constraint fk_VanPhong_BDS
foreign key (maVanPhong)
references VanPhong(maVanPhong);


