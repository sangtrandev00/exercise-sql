-- Bai 2.
-- cau a. Hien thi danh sach kh chua mua lan nao ke tu 1/7/2016.
-- Truoc do nguoi ta co mua, nhung ke tu 1/1/2016 nguoi ta khong mua nua
SELECT * FROM khachHang
WHERE maKhachHang not IN (SELECT maKhachHang FROM hoadon WHERE ngayMuaHang >="2016-7-1")

SELECT *FROM hoadon WHERE ngayMuaHang >="2016-7-1" -- hien thi danh sach khach hang da mua hang sau ngay 1/1/2016
FROM hoadon WHERE ngayMuaHang <= "2016-1-1"

-- cau b. -- San pham ban chay nhat.
SELECT sp.maSanPham, TenSP, SUM(hdct.soLuong) AS "So Luot Mua" 
FROM hoadonchitiet hdct
INNER JOIN hoadon hd ON hd.maHoaDon = hdct.maHoaDon
INNER JOIN sanpham sp ON hdct.maSanPham = sp.maSanPham
GROUP BY maSanPham, tenSP
having SUM(hdct.soLuong) >= ALL (SELECT  SUM(hdct.soLuong) AS "so luot mua" FROM hoadonchitiet hdct
INNER JOIN hoadon hd ON hdct.maHoaDon = hd.maHoaDon
GROUP BY maSanPham)


-- hien thi so luot mua trong hoa don chi tiet, theo ma san pham.
SELECT  SUM(hdct.soLuong) AS "so luot mua" FROM hoadonchitiet hdct
INNER JOIN hoadon hd ON hdct.maHoaDon = hd.maHoaDon
GROUP BY maSanPham


SELECT sp.maSanPham, TenSp
FROM hoadonchitiet hdct
INNER JOIN sanpham sp
ON sp.maSanPham = hdct.maSanPham
WHERE  hdct.soLuong = ( SELECT MAX(hdct.soLuong)  FROM hoadonchitiet WHERE 

SELECT MAX(soLuong) AS 'Max so luong' FROM sanpham
 
 -- cau c. Hien thi top 5 khach hang co tong tien mua hang nhieu nhat trong nam 2016.
 
 SELECT kh.maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai, ngayMuaHang,SUM( hdct.soLuong) AS 'So luong', SUM(sp.donGia*hdct.soLuong) AS "tongTien" 
 FROM khachhang kh
 INNER JOIN hoadon hd
 on kh.maKhachHang = hd.maKhachHang
 INNER JOIN hoadonchitiet hdct
 on hdct.maHoaDon = hd.maHoaDon
 INNER JOIN sanpham sp
 on sp.maSanPham = hdct.maSanPham
 WHERE YEAR(ngayMuaHang ) = 2016
 GROUP BY Ten 
 ORDER BY sum(sp.donGia*hdct.soLuong) DESC
 LIMIT 5;

-- cau d. Hien thi thong cac khach hang song o da nang, mua san pham co 

 SELECT kh.maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai, ngayMuaHang, sp.tenSP, hdct.soLuong, sp.donGia*hdct.soLuong AS "tongTien" 
 FROM khachhang kh
 INNER JOIN hoadon hd
 on kh.maKhachHang = hd.maKhachHang
 INNER JOIN hoadonchitiet hdct
 on hdct.maHoaDon = hd.maHoaDon
 INNER JOIN sanpham sp
 on sp.maSanPham = hdct.maSanPham
 WHERE (diaChi LIKE "%Đà Nẵng%" )AND (tenSP LIKE "%Dell%" ) AND ( ngayMuaHang like "2016-03-11"); 
 
 -- cau e. hien thi ten san pham co luong dat mua nho hon so luong mua trung binh cac san pham
 
 SELECT sp.*, hdct.soLuong AS "so luong dat mua" from hoadonchitiet hdct
 INNER JOIN sanpham sp ON sp.maSanPham = hdct.maSanPham
 GROUP BY sp.maSanPham
 WHERE hdct.soLuong <= (SELECT AVG(hdct.soLuong) FROM hoadonchitiet)
 
 
 SELECT AVG(soLuong) FROM hoadonchitiet
 
 SELECT sp.*
 FROM sanpham sp
 INNER JOIN hoadonchitiet hdct
 ON sp.maSanPham = hdct.maSanPham
 WHERE hdct.soLuong < (SELECT AVG(hdct.soLuong) FROM hoadonchitiet)
 
 
 SELECT AVG(soLuong) FROM hoadonchitiet
 