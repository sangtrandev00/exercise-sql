-- a. hien thi tat ca thong tin co trong 2 bang hoa don.

SELECT *
FROM hoadon hd,hoadonchitiet hdct
WHERE hd.maHoaDon = hdct.maHoaDon;


SELECT hd.maHoaDon,maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang
FROM hoadon hd,hoadonchitiet hdct
WHERE hd.maHoaDon = hdct.maHoaDon;

-- c2:
SELECT hoadon.maHoaDon,maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang
FROM hoadon
INNER JOIN hoadonchitiet 
ON hoadon.maHoaDon = hoadonchitiet.maHoaDon;

-- b. Hien thi tat ca thong tin co trong 2 bang hoa don va hoa don chi tiet

SELECT hoadon.maHoaDon,maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang
FROM hoadon
INNER JOIN hoadonchitiet 
ON hoadon.maHoaDon = hoadonchitiet.maHoaDon
WHERE maKhachHang ="001";

-- c. Hien thi thong tin tu 3 bang hoa don, hoadonchitiet va san pham

SELECT hd.maHoaDon, ngayMuaHang, tenSp, donGia, hdct.soLuong, donGia*hdct.soLuong AS 'thanhTien'
FROM hoadon hd
INNER JOIN hoadonchitiet hdct
ON hd.maHoaDon = hdct.maHoaDon
INNER JOIN sanpham sp
ON hdct.maSanPham = sp.maSanPham;

-- d. Hien thi thong tin tu bang khach hang, hoa don, hoa don chi tiet
SELECT hoVaTenLot, Ten, Email, dienThoai, hd.maHoaDon, trangThai,  sp.donGia*hdct.soLuong AS "Tổng Tiền" 
FROM khachhang kh
INNER JOIN hoadon hd
ON kh.maKhachHang = hd.maKhachHang
INNER JOIN hoadonchitiet hdct 
ON hd.maHoaDon = hdct.maHoaDon
INNER JOIN sanpham sp
ON sp.maSanPham = hdct.maSanPham;

-- e. Hien thi maHoaDon, ngayMuaHang, tong tien da mua trong tung hoa don.

SELECT hd.maHoaDon, ngayMuaHang, sp.donGia*hdct.soLuong AS 'tongTien'
FROM hoadon hd
INNER JOIN hoadonchitiet hdct
ON hd.maHoaDon = hdct.maHoaDon
INNER JOIN sanpham sp
ON sp.maSanPham = hdct.maSanPham
WHERE sp.donGia*hdct.soLuong >= 80000000
ORDER BY sp.donGia*hdct.soLuong DESC;