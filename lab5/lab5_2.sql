SELECT *FROM khachhang;
-- 1. Hien thi so luong khach hang co trong bang khach hang.
-- SELECT COUNT* FROM khachhang 
-- 2.
-- a Hien thi so luong khach hang co trong bang khach hang.
SELECT COUNT(maKhachHang) FROM khachhang;

SELECT COUNT(*) FROM khachhang;
SELECT *FROM khachhang;
-- b Hien thi don gia lon nhat trong bang san pham.
SELECT *FROM sanpham;
SELECT MAX(donGia) FROM sanpham;

-- c. Hien thi so luong san pham thap nhat trong ban san pham

SELECT MIN(soLuong) FROM sanpham;

-- d. hien thi tong tat ca so luong san pham co trong ban san pham.
SELECT SUM(soLuong) FROM sanpham;
-- e. Hien thi so hoa don da xuat trong thang 12/2016 -> chuyen thanh thang 1. ma co trang thai chua thanh toan.
SELECT *FROM hoadon WHERE ngayMuaHang >="2022-01-01" AND ngayMuaHang <="2022-01-31" AND trangThai LIKE "chưa%";
-- c2.
SELECT *FROM hoadon WHERE (ngayMuaHang BETWEEN "2022-01-01" AND "2022-01-31") AND trangThai LIKE "chưa%";

SELECT *FROM hoadon;
SELECT *FROM hoadonchitiet;

SELECT COUNT(maHoaDon) FROM hoadon WHERE trangThai ="chưa thanh toán";
-- f. Hien thi ma hoa don va so luong san pham duoc mua trong tung hoa don ( hoa don chi tiet).
SELECT maHoaDon, maSanPham, SUM(soLuong) 
FROM hoadonchitiet
GROUP BY maHoaDon;

-- g. Hien thi ma hoa don va so luong san pham duoc mua trong tung hoa don
-- yeu cau chi hien thi hang nao co so luong san pham duoc mua >=5.
SELECT maHoaDon, SUM(soLuong)
FROM hoadonchitiet
WHERE soLuong>=5
GROUP BY maHoaDon;
-- c2.
SELECT maHoaDon, SUM(soLuong)
FROM hoadonchitiet
GROUP BY maHoaDon
HAVING SUM(soLuong) >=5;

-- h. Hien thi thong tin bang HoaDon gom cac cot maHoaDon, ngayMuaHang, maKhachHang.
SELECT *FROM hoadon;
SELECT maHoaDon, ngayMuaHang, maKhachHang FROM hoadon ORDER BY ngayMuaHang DESC;
