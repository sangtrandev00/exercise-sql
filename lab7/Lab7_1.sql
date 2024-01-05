-- Bai 1. Viet cac cau DML de thuc hien cac cong viec sau:

-- a. Su dung insert de them du lieu cac bang nhu sau.

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
		năng lưu trữ và giá cả, iPhone 6 ', 500, 8990000,"Iphone 6 32GB"),