use quanlybanhang;


select * from hoadon;
select * from hoadonchitiet;

-- a. hien thi tat ca thong tin co trong 2 bang hoa don va hoa don chi tiet
select hd.maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang 
from hoadon hd inner join hoadonchitiet hdct on hd.maHoaDon = hdct.maHoaDon;

-- b. voi dieu kien mkh == kh001
select hd.maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang 
from hoadon hd inner join hoadonchitiet hdct on hd.maHoaDon = hdct.maHoaDon 
where maKhachHang like 'KH001';

-- c. hien thi tu 3 bang ---- gom: hoa don, hoa don chi tiet, san pham 
-- co cac cot: (ho va ten khach hang, email, dien thoai, ma hoa don, trang thai hoa don va tong tien )
-- Chi hien thi thong cac hoa don chua thanh toan.
select * from sanpham;
select * from hoadon;
select * from hoadonchitiet;
select a.maHoaDon, ngayMuaHang, tenSP, donGia, b.soLuong, donGia * b.soLuong as 'Thanh Tien' from hoadon a
inner join hoadonchitiet b on a.maHoaDon = b.maHoaDon
inner join sanpham c on c.maSanPham = b.maSanPham;

-- d. Hien thi thong tin tu bang khach hang, hoa don, hoa don chi tiet 
-- gom cac cot: ( ho va ten kh, email, dien thoai, ma hoa don, trang thai hoa don va tong tien da mua trong hoa don )
-- chi hien thi cac hoa don chua thanh toan
select * from sanpham;
select * from khachhang;
select * from hoadon;
select * from hoadonchitiet;
select hoVaTenLot, ten, email, dienThoai, hd.maHoaDon, trangThai, hdct.soLuong * sp.donGia as 'Tong tien ( VND )' from khachhang kh 
inner join hoadon hd on kh.maKhachHang = hd.maKhachHang
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon 
inner join sanpham sp on sp.maSanPham = hdct.maSanPham;

-- e. Hien thi ma hoa don, ngay mua hang, tong so tien da mua trong tung hoa don. 
-- Chi hien thi nhung hoa don co tong so tien >= 500.000
--  va sap xep theo thu tu giam dan cua cot tien

select hd.maHoaDon, ngayMuaHang, hdct.soLuong * sp.donGia as 'TongTien'
from hoadon hd 
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon 
inner join sanpham sp on sp.maSanPham = hdct.maSanPham 
group by maHoaDon having TongTien >= 50000000;