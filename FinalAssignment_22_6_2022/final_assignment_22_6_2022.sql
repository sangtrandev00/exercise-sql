-- Y4. Tao cac bang trong CSDL, tao rang buoc ( khoa chinh, khoa ngoai, rang buoc duy nhat, rang buoc kiem tra check )

create database quanlythuvien_26_6_2022;
use quanlythuvien_26_6_2022;

create table loaiSach(
	maLoai varchar(10) primary key,
    tenLoaiSach varchar(50) not null
);

create table quyenSach(
	maSach varchar(10) primary key,
    tieuDe varchar(50) not null,
    nhaXuatBan varchar(50) not null,
    tacGia varchar(30) not null,
    soTrang int not null check(soTrang >=5),
    banSao int not null check(banSao >1),
    giaTien float not null check(giaTien > 0),
    ngayNhapKho date not null,
    viTriDatSach varchar(10),
    maLoai varchar(10) references loaiSach(maLoai)
);

alter table quyenSach
add constraint FK_quyenSach_LoaiSach foreign key(maLoai)
references loaiSach(maLoai);

create table TheSinhVien(
	maSinhVien varchar(10) primary key,
    tenSinhVien varchar(50) not null,
    ngayHetHan date not null,
    chuyenNganhHoc varchar(30) not null,
    email varchar(30) not null,
    soDienThoai varchar(13) not null,
    maLop varchar(10) not null
);

create table PhieuMuon(
	maPhieuMuon int primary key auto_increment,
    ngayMuon date not null,
    ngayTra date,
    soLuongSach int not null, -- Them check <=3
    maSinhVien varchar(10) references TheSinhVien(maSinhVien)
);

alter table phieuMuon
add constraint FK_phieuMuon_TheSinhVien foreign key(maSinhVien)
references TheSinhVien(maSinhVien);

create table phieuMuonChiTiet(
	maPhieuMuonChiTiet varchar(10) primary key,
    maSach varchar(10) references QuyenSach(maSach),
    maPhieuMuon int references PhieuMuon(maPhieuMuon),
    ghiChu varchar(100) not null,
    ngayGiaHan date
);

alter table phieuMuonChiTiet
add constraint FK_phieuMuonChiTiet_QuyenSach foreign key(maSach)
references QuyenSach(maSach),
add constraint FK_phieuMuonChiTiet_PhieuMuon foreign key(maPhieuMuon)
references PhieuMuon(maPhieuMuon);


-- Y5. Nhap du lieu vao cho  cac bang ( itt nhat 5 ban ghi tren moi bang )
-- Table The Sinh Vien
insert into TheSinhVien values
	('PD05395', 'Đặng Ngọc Anh', '2022-3-3', 'Lập trình Máy Tính','anh@gmail.com','0123456789',"LT16001"),
    ('PD05396', 'Đặng Ngọc Minh', '2022-6-8', 'Lập trình','minh@gmail.com','0123456782','LT16002'),
    ('PD05394', 'Hồ Ngọc Anh', '2022-9-6', 'Lập trình','anhhn@gmail.com','0123456783','LT16003'),
    ('PD05364', 'Nguyễn Ngọc Anh', '2022-6-5', 'Lập trình','anhnn@gmail.com','0123456784','LT16004'),
    ('PD05021', 'Mai Ngọc Anh', '2022-4-6', 'Lập trình','anhmn@gmail.com','0123456785','LT16005');

-- Table Loai Sach

insert into LoaiSach values
	('cntt', 'Công nghệ thông tin'),
	('pts', 'Photoshop'),
	('sql', 'Cơ sở dữ liệu'),
	('ks', 'Du lịch và khách sạn'),
	('mkt', 'Marketting');
-- Table Quyen Sach

insert into QuyenSach (maSach,tieuDe,tacGia,nhaXuatBan,soTrang,banSao,giaTien,ngayNhapKho,viTriDatSach, maLoai)
values 
	('SQL001','SQL sever','Herbert Schildt','NXB Ha Noi','30','4','500000', '2010-1-20','VT0001','cntt'),
	('IT002','Lap trinh huong doi tuong', 'Herbert Schildt','NXB Ha Noi','20', '4','400000','2017-1-30','VT0002','cntt'),
	('SQL003','Tin hoc co so','Herbert Schildt','NXB Ha Noi','15','4','200000','2018-5-6','VT0003','cntt'),
    ('PTS004','Photoshop','Herbert Schildt','NXB Ha Noi', '25','4','350000', '2016-7-5','VT0004','cntt'),
    ('IT005','Photoshop nang cao','Herbert Schildt','NXB Ha Noi','20','4','500000','2017-1-1','VT0005','cntt');

-- Table phieu muon
insert into PhieuMuon (maPhieuMuon,ngayMuon,ngayTra,soLuongSach,maSinhVien)
values 
	('1', '2017-2-2', '2017-2-15', '3', 'PD05394'),
	('2', '2016-1-2', '2016-1-15', '2', 'PD05021'),
	('3', '2021-2-28', null, '1', 'PD05364'),
	('4', '2020-12-2', null, '2', 'PD05396'),
	('5', '2019-2-2', '2019-2-8', '3', 'PD05395');
-- Table phieu muon chi tiet
insert into PhieuMuonChiTiet(maPhieuMuonChiTiet,maPhieuMuon ,maSach, GhiChu,ngayGiaHan)
values 
		('PMCT001','1', 'SQL001', 'no thing special','2017-2-15'),
		('PMCT002','2', 'IT002', 'no thing special','2016-1-15'),
		('PMCT003','3', 'SQL003', 'no thing special',null),
		('PMCT004','4', 'PTS004', 'no thing special',null),
		('PMCT005','5', 'IT005', 'no thing special','2019-2-8');
        
-- select * from phieuMuonChiTiet;

-- Y6. Viet cac cau truy van

-- Y 6.1 Liet ke tat ca thong tin cua cac dau sach gom ten sach, ma sa ch, gia tien, tac gia thuoc loai sach co ma IT
select * from quyensach;
select maSach,tieuDe,giaTien, tacGia from quyenSach where maLoai like "%cntt%";
-- 6.2 liet ke cac phieu muon gom cac thong tin: 
-- (ma phieu muon, ma sach, ngay muon, ma sinh vien co ngay muon trong thang 01/2017)
select * from phieumuon;
select * from phieumuonchitiet;
select pm.maPhieuMuon, ct.maSach, ngayMuon, maSinhVien from phieumuon pm
inner join phieumuonchitiet ct on ct.maPhieuMuon = pm.maPhieuMuon
where ngayMuon between '2017-02-01' and '2017-02-29';

-- 6.3 Liet ke cac phieu muon, chua tra sach cho thu vien theo thu tu tang dan cua ngay muon sach.
select * from phieumuonchitiet;
select * from phieumuon;

select pm.maPhieuMuon, pm.ngayMuon from phieumuonchitiet ct
inner join phieumuon pm on pm.maPhieuMuon = ct.maPhieuMuon
where ghiChu like "%chưa%"
order by ngayMuon;

-- 6.4 Liet ke tong so dau sach cua moi loai sach ( gom maLoaiSach, tenLoaiSach, tongSoLuongSachMoiLoai)
select * from quyensach;
select * from loaiSach;
select count(*) as'Tong dau sach moi loai', loaiSach.maLoai, tieuDe as 'Ten Sach'  from quyensach
inner join loaiSach on loaiSach.maLoai = quyensach.maLoai
group by loaiSach.maLoai;

-- 6.5 Dem xem co bao nhieu luot sinh vien da muon sach
select * from phieumuon;
select count(*) as 'so luong sinh vien da muon sach' from phieumuon;

-- 6.6 Hien thi tat cac quyen sach co tieu de chua tu khoa "SQL"

select * from quyenSach 
where tieuDe like"%SQL%";

-- 6.7 Hien thi thong tin muon sach. Gom thong tin: 
-- maSinhVien, tenSinhVien, maPhieuMuon, tieuDeSach, ngayMuon, ngayTra.
-- Sap xep thu tu theo ngay muon sach!
-- Ket noi 4 bang lai voi nhau
select * from quyensach;
select * from phieumuon;
select * from thesinhvien;

select sv.maSinhVien, tenSinhVien, pm.maPhieuMuon, tieuDe, ngayMuon, ngayTra
from phieumuon pm inner join theSinhVien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet ct on ct.maPhieuMuon = pm.maPhieuMuon
inner join quyensach qs on qs.maSach = ct.maSach
order by ngayMuon;

-- 6.8 Liet ke cac dau sach co luot muon lon 20 lan. ( haven't solve yet )
select qs.maSach,qs.tieuDe, count(qs.maSach) as 'Luot Muon'  from phieumuonchitiet ct 
inner join quyensach qs on ct.maSach = qs.maSach 
group by qs.maSach having count(qs.maSach) > 2;

-- 6.9 Viet cau lenh cap nhat lai gia tien cua ca quyen sach co ngay nhap kho truoc nam 2014 giam 30%
select * from quyensach;
update quyensach
set giaTien = giaTien * 0.7
where ngayNhapKho <= '2014-01-01';

-- 6.10 Viet cau lenh cap nhat lai trang thai da tra sach cho phieu muon cua sinh vien
-- co ma sinh vien la PD12301
select * from phieumuonchitiet;
select * from thesinhvien;
select * from phieumuon;

update phieumuonchitiet
set ghiChu = 'Đã trả sách'
where maPhieuMuon = (select ct.maPhieuMuon from phieumuonchitiet ct
inner join phieumuon pm on pm.maPhieuMuon = ct.maPhieuMuon
inner join thesinhvien sv on sv.maSinhVien = pm.maSinhVien
where sv.maSinhVien like 'PD05021'); 

-- 6.11 Lap danh sach cac phieu muon qua han chua tra gom cac thong tin:
-- maPhieuMuon, tenSinhVien, email, danhsachcac sach da muon, ngayMuon. --> -- Su dung DATEIF in my sql. ( tham khao lai )

-- check thoi
select * from phieumuon;
select pm.maPhieuMuon, tenSinhVien, email, ngayMuon, ngayTra, ghiChu, datediff(curDate(),pm.ngayTra) as 'soNgayVuot'
from phieumuon pm inner join thesinhVien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet ct on ct.maPhieuMuon = pm.maPhieuMuon
where ghiChu like 'chưa trả sách'; 

-- main
select pm.maPhieuMuon, tenSinhVien, email, ngayMuon, ngayTra, ghiChu , datediff(curDate(),pm.ngayTra) as 'soNgayVuot'
from phieumuon pm inner join thesinhVien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet ct on ct.maPhieuMuon = pm.maPhieuMuon
where datediff(curDate(),pm.ngayTra) > 7 and ghiChu like 'chưa trả sách' ; 

-- 6.12 Viet cau lenh cap nhat lai so luong ban sao tang len 5 don vi,
-- doi voi cac dau sach co luot muon lon hon 10

select * from thesinhvien;
select * from quyensach;
select maSach from phieumuonchitiet
group by maSach having count(*) > 2;

update quyensach
set bansao = banSao + 5
where maSach in (select maSach from phieumuonchitiet
group by maSach having count(*) > 2);
-- Theo yeu cau la count(*) > 10
-- 6.13 Viet cau lenh xoa cac phieu muon co ngay muon va ngay tra truoc '01/01/2010';

select * from phieumuon;
delete from phieumuon
where ngayMuon <= '2017-01-01' and ngaytra <='2017-01-01';

