-- Lab 7 bai1 

-- a.

INSERT INTO khachhang ( maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai)
	values
		("KH001", "Nguyễn Thị", "Nga", "15 Quang Trung TP Đà Nẵng", "ngant@gmail.com", "0912345670"),
		("KH002", "Trần Công ", "Thành", "234 Lê Lợi Quảng Nam", "thanhtc@gmail.com", "16109423443"),
		("KH003", "Lê Hoàng", "Nam", "23 Trần Phú TP Huế", "namlt@gmail.com", "0989354556"),
		("KH004", "Vũ Ngọc", "Hiền", "37 Nguyễn thị Thập TP Đà Nẵng", "hienvn@gmail.com", "0912345670");

INSERT INTO sanpham(maSanPham, moTa, soLuong, donGia, tenSp)
	VALUES (1,
		'Samsung Galaxy J7 Pro là một chiếc
		smartphone phù hợp với những người
		yêu thích một sản phẩm pin tốt, thích
		hệ điều hành mới cùng những tính
		năng đi kèm độc quyền ', 800, 6600000,"Samsung Galaxy J7 Pro"),
		(2,
		'iPhone 6 là một trong những
		smartphone được yêu thích nhất.
		Lắng nghe nhu cầu về thiết kế, khả
		năng lưu trữ và giá cả, iPhone 6 32GB được chính thức phân phối
		chính hãng tại Việt Nam hứa hẹn sẽ
		là một sản phẩm rất "Hot"s', 500, 8990000,"Iphone 6 32GB"),
		(3, 'Dell Inspiron 3467 i3
		7100U/4GB/1TB/Win10/(M20NR21)', 507,11290000,'Laptop Dell
		Inspiron 3467'),
        (4,'Pin sạc dự phòng Polymer 5.000
		mAh eSaver JP85',600,200000,'Pin sạc dự
		phòng'),
        (5,'Nokia 3100 phù hợp với SINH VIÊN',100,700000,'Nokia 3100');

select * from sanpham;

INSERT INTO hoadon ( maKhachHang, maHoaDon, ngayMuaHang, trangThai )
VALUES 
		("KH001", 120954, "2016-3-23", "đã thanh toán"),
		("KH002", 120955, "2016-2-04", "đã thanh toán"),
		("KH001", 120956, "2016-7-12", "chưa thanh toán"),
		("KH004", 120957, "2016-4-12", "chưa thanh toán");
        

		
INSERT INTO hoadonchitiet (maHoaDonChiTiet, maHoaDon, maSanPham, soLuong)
VALUES 
		(1,120954,3,40),
		(2,120954,1,20),
		(3,120955,2,100),
		(4,120956,4,6),
		(5,120956,2,60),
		(6,120956,1,10),
		(7,120957,2,50);

-- 1b. Tao 1 bang co ten khachhang_dannag chua thong tin day du ve cac khach hang den tu da nang
select * from khachhang_danang;
create table khachhang_danang as 
select * from khachhang
where diaChi like "%Đà nẵng%";


-- lab 7 bai 2
-- a 
select * from khachhang;
update khachhang
set dienThoai = 16109423443
where maKhachHang = "KH002";

-- b
select * from sanpham;

update sanpham
set soLuong = soLuong + 200
where maSanPham = 3;

-- c
select * from sanpham;
update sanpham
set soLuong = soLuong * 0.95;

-- d

select * from hoadonchitiet hdct
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
where ngayMuaHang between "2016-07-01" and "2016-07-31" 
order by hdct.soLuong desc limit 1;


update sanpham
set soLuong = soLuong + 100
where maSanPham = (
	select sp.maSanPham from hoadonchitiet hdct
	inner join sanpham sp on sp.maSanPham = hdct.maSanPham
	inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
	where ngayMuaHang between "2016-07-01" and "2016-07-31" 
	order by hdct.soLuong desc limit 1
);

select * from sanpham;

-- e
-- sub query
-- Tao mot bang moi lam trung gian
create table newSanPham as
select maSanPham from hoadon hd
inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
group by maSanPham
order by sum(soLuong)
limit 2;

-- 
update sanpham
set donGia = donGia * 0.9
where maSanPham in 
(select maSanPham from newSanPham);

-- g: Xoa mat hang co ma san pham la "2" ra khoi hoa don "120956" va trang thai la chua thanh toan

select * from hoadon;
select * from hoadonchitiet;
select * from sanpham;

select maHoaDonChiTiet from hoadonchitiet hdct 
inner join hoadon hd
on hd.maHoaDon = hdct.maHoaDon 
where maSanPham = 2 and hd.maHoaDon = "120956" and trangThai ="chưa thanh toán";

delete from hoadonchitiet
where maHoaDonChiTiet in (
select maHoaDonChiTiet from hoadonchitiet hdct 
inner join hoadon hd
on hd.maHoaDon = hdct.maHoaDon 
where maSanPham = 2 and hd.maHoaDon = "120956" and trangThai ="chưa thanh toán"
);

select * from hoadonchitiet;

-- h: Sai roi

-- h
select * from khachhang;
select * from hoadonchitiet;
select * from hoadon;
select * from khachhang;
-- delete KH002, KH003; --> Ask teacher !!!
SET FOREIGN_KEY_CHECKS=0;-- to disable them
delete from khachhang
where maKhachHang not in(select maKhachHang from hoadon hd 
inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
where ngayMuaHang >= "2016-03-01");
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them
select * from khachhang;

select maKhachHang from hoadon hd 
inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
where ngayMuaHang >= "2016-03-01";



