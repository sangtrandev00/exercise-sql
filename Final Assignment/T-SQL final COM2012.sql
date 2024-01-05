create database QuanLyThuVien;
use quanlythuvien;

create table SinhVien(
	maSinhVien varchar(50) primary key,
    ngayHetHan date not null,
    chuyenNganhHoc varchar(50) not null,
    Email varchar(50) not null,
    soDienThoai varchar(50) not null
);

create table LoaiSach(
	maLoaiSach varchar(50) primary key,
    tenLoaiSach varchar(50) not null
);

create table Sach (
	maSach varchar(50) primary key,
    tieuDe varchar(100) not null,
    nhaXuatBan varchar(50) not null,
    tacGia varchar(50) not null,
    soTrang int check (soTrang >5),
    soBanSao int check (soBanSao >1),
    giaTien int check (giaTien>0),
    ngayNhapKho date not null,
    viTriDatSach varchar(50) not null,
    maLoaiSach varchar(50) not null
);

alter table Sach
add constraint FK_maLoaiSach foreign key ( maLoaiSach) references loaiSach(maLoaiSach);


create table PhieuMuonSach(
	maPhieuMuon int auto_increment primary key auto_increment,
    ngayMuon date not null,
    ngayTra date not null check (ngayTra >= ngayMuon),
    maSinhVien varchar(25),
    maLop varchar(30) not null,
    trangThai varchar(50) null
);

alter table PhieuMuonSach
add constraint FK_SinhVien foreign key ( maSinhVien) references SinhVien (maSinhVien);

create table PhieuMuonChiTiet(
	maPhieuMuon int not null,
    maSach varchar(50) not null,
    ghiChu text null
);

alter table PhieuMuonChiTiet
add constraint FK_maPhieuMuon foreign key (maPhieuMuon) references PhieuMuonSach(maPhieuMuon),
add constraint FK_maSach foreign key (maSach) references Sach(maSach)



