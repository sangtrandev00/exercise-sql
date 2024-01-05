-- 7.2 Viet cac cau len de cap nhat lai du lieu

-- a. 
SELECT *FROM khachhang

UPDATE khachhang
SET dienThoai ="16267788989"
WHERE maKhachHang LIKE "KH002"

-- b. Tang so luong mat hang co ma 3 len 200 don vi

SELECT *FROM sanpham

UPDATE sanpham
SET soLuong = soLuong + 200
WHERE maSanPham = 3
-- c. Giam gia cho tat ca san pham. Giam 5%.
	UPDATE sanpham
	SET donGia = donGia*0.95;

-- d. Tang so luong cua mat hang ban chay nhat trong thang 12/2016 len 100 don vi
	-- tim so luong mat hang ban chay nhat trong nam 12/2016
	
	UPDATE sanpham
	SET soLuong = soLuong +100
	WHERE maSanPham IN (		SELECT maSanPham
	FROM hoadonchitiet hdct
	INNER JOIN  hoadon hd
	ON hd.maHoaDon = hdct.maHoaDon
	WHERE ngayMuaHang LIKE "%2016-02%"
	GROUP BY maSanPham
	ORDER BY SUM(soLuong) desc
	LIMIT 1)
	
	
	-- ----
	SELECT *,SUM(soLuong) AS "So Luong da ban"
	FROM hoadonchitiet hdct
	INNER JOIN  hoadon hd
	ON hd.maHoaDon = hdct.maHoaDon
	WHERE ngayMuaHang LIKE "%2016-02%"
	GROUP BY maSanPham
	ORDER BY SUM(soLuong) desc
	LIMIT 1;
	
	--- select ma san pham
		SELECT maSanPham
	FROM hoadonchitiet hdct
	INNER JOIN  hoadon hd
	ON hd.maHoaDon = hdct.maHoaDon
	WHERE ngayMuaHang LIKE "%2016-02%"
	GROUP BY maSanPham
	ORDER BY SUM(soLuong) desc
	LIMIT 1;

-- e. Giam gia 10% cho 2 san pham ban it nhat nam 2016

	SELECT *,SUM(soLuong) AS "So Luong da ban"
	FROM hoadonchitiet hdct
	INNER JOIN  hoadon hd
	ON hd.maHoaDon = hdct.maHoaDon
	WHERE ngayMuaHang LIKE "%2016-02%"
	GROUP BY maSanPham
	ORDER BY SUM(soLuong) asc
	LIMIT 2;
	
	-- update 
	UPDATE sanpham
	SET donGia = donGia*0.9
	WHERE maSanPham IN 	(select maSanPham
	FROM hoadonchitiet hdct
	INNER JOIN  hoadon hd
	ON hd.maHoaDon = hdct.maHoaDon
	WHERE ngayMuaHang LIKE "%2016-02%"
	GROUP BY maSanPham
	ORDER BY SUM(soLuong) asc
	LIMIT 2 )


-- f. Cap nhat trang thai

SELECT *FROM hoadon

UPDATE hoadon
SET trangThai ="đã thanh toán"
WHERE maHoaDon LIKE 120956

-- g. xoa mat hang co ma san pham la 2 ra khoi hoa don
	SELECT *FROM hoadonchitiet
	SELECT *FROM hoadon
	
	SELECT hdct.maHoaDon FROM hoadonchitiet hdct 
	INNER JOIN hoadon hd ON hd.maHoaDon = hdct.maHoaDon
	WHERE (trangThai LIKE "chưa thanh toán" )AND (maSanPham = 2) AND (hd.maHoaDon LIKE 120956)
	--- Dap an.
	DELETE from hoadonchitiet
	WHERE maHoaDon in (SELECT hdct.maHoaDon FROM hoadonchitiet hdct 
	INNER JOIN hoadon hd ON hd.maHoaDon = hdct.maHoaDon
	WHERE (trangThai LIKE "chưa thanh toán" ) AND (hd.maHoaDon LIKE 120956) AND (maSanPham = 2))
  
-- h. xoa khach hang chua tung mua hang.


-- khach hang chua tung mua hang ke tu ngay 1/1/2016
SELECT * FROM khachHang
WHERE maKhachHang not IN (SELECT maKhachHang FROM hoadon WHERE ngayMuaHang >="2016-7-1")

-- xem lai. Neu can === ***
DELETE from khachhang
WHERE maKhachHang not IN (SELECT maKhachHang FROM hoadon WHERE ngayMuaHang >="2016-7-1")