

SELECT *
FROM sanpham 
FULL OUTER JOIN hoadonchitiet 
ON sanpham.maSanPham = hoadonchitiet.maSanPham
WHERE  sp.maSanPham NOT IN (1,2,3,4)

SELECT maSanPham FROM hoadonchitiet

SELECT maSanPham FROM sanpham

SELECT *FROM hoadonchitiet




-- cau 2. Liet ke ma khach hang, ten khach hang 

SELECT kh.maKhachHang, Ten 
FROM khachhang kh
INNER join hoadon hd ON hd.maKhachHang = kh.maKhachHang
INNER JOIN hoadonchitiet hdct ON hdct.maHoaDon = hd.maHoaDon
WHERE hdct.maSanPham = 2

