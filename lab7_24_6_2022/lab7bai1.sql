create database ps20227_tran_nhat_sang_web18101_lab7;
use ps20227_tran_nhat_sang_web18101_lab7;

create table khachhang(
	maKhachHang varchar(10) primary key,
    hoVaTenLot varchar(30) not null,
    ten varchar(10) not null,
    diaChi varchar(100) not null,
    email varchar(30) not null,
    dienThoai varchar(13) not null
);

create table sanpham(
	maSanPham varchar(5) primary key,
    moTa varchar(255) not null,
    soLuong int not null,
    donGia float not null,
    tenSP varchar(50)
);

create table hoadon(
	maHoaDon varchar(10) primary key,
	maKhachHang varchar(10),
    ngayMuaHang date not null,
    trangThai varchar(20) not null
);

-- references khachhang(maKhachHang),
alter table hoadon
add constraint FK_hoadon_khachhang
foreign key (maKhachHang)
references khachhang(maKhachHang);

create table hoadonchitiet(
	maHoaDonChiTiet varchar(5) primary key,
    maHoaDon varchar(10),
    maSanPham varchar(5),
    soLuong int not null
);

alter table hoadonchitiet
add constraint FK_HDCT_hoadon foreign key (maHoaDon)
references hoaDon(maHoaDon),
add constraint KF_HDCT_sanpham foreign key (maSanPham)
references sanPham(maSanPham);



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