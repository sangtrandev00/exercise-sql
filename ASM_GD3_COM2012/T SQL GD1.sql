create database ps20227_Tran_Nhat_Sang_Web18101_ASM;

create table loaiSach(
	maLoai varchar(10) primary key,
    tenLoaiSach varchar(50) not null
);

create table Sach(
	maSach varchar(10) primary key,
    nhaXuatBan varchar(125) not null,
    tacGia varchar(50) not null,
    soTrang int not null, -- check(soTrang >= 5 ),
    banSao int not null, -- check(banSao > 1 ),
    giaTien float not null, -- check( giatien > 0 ),
    ngayNhapKho date not null,
    viTriDatSach varchar(10) not null,
    maLoai varchar(10) not null
);

alter table Sach
add constraint FK_Sach_LoaiSach foreign key(maLoai)
references loaiSach(maLoai);

create table theSinhVien(
	maSinhVien varchar(10) primary key,
    tenSinhVien varchar(50) not null,
    ngayHetHan date not null,
    chuyenNganhHoc varchar(30) not null,
    email varchar(30) not null,
    soDienThoai varchar(13) not null,
    maLop varchar(10) not null
);

create table phieuMuon(
	maPhieuMuon int primary key auto_increment,
    ngayMuon date not null,
    ngayTra date not null, -- check(ngayTra >= ngayMuon),
    soLuongSach int not null, -- check(soLuongSach <=3 ),
    maSinhVien varchar(10) not null
);

alter table phieuMuon
add constraint FK_PhieuMuon_TheSinhVien foreign key(maSinhVien)
references thesinhvien(maSinhVien);

create table phieuMuonChiTiet(
	maPhieuMuonChiTiet varchar(10) primary key,
    maSach varchar(10) not null,
    maPhieuMuon int not null,
    ngayTraSach date null,
    ghiChu varchar(100) null
);

alter table phieumuonchitiet
add constraint FK_PMCT_PhieuMuon foreign key(maPhieuMuon)
references phieumuon(maPhieuMuon),
add constraint FK_PCMT_Sach foreign key(maSach)
references Sach(maSach);



