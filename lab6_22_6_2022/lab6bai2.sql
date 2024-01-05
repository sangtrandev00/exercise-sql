-- Day la co so du lieu nao trong bai vay nhi ?
-- lab6 bai 2

-- a. Hien thi ds cac khach hang chua mua hang lan nao ke tu 2022 - 04 -01 ( KH001 va KH005 ).
-- Hien thi ds khach hang da mua hang tu 1/1/2016
select * from khachhang;
select * from hoadonchitiet;
select * from hoadon;

select * from hoadon where ngayMuaHang >= '2022-04-01';
select * from khachhang 
where maKhachHang not in (select maKhachHang from hoadon where ngayMuaHang >= '2022-04-01');

-- b. Hien thi ma sp, ten sp co luot mua nhieu nhat trong thang 02 / 2022
select * from sanpham;
select * from hoadonchitiet;
select * from hoadon where ngayMuaHang between '2022-02-01' and '2022-02-29';
-- select sp.maSanPham, tenSP from sanpham sp
-- inner join hoadonchitiet hdct on hdct.maSanPham = sp.maSanPham
-- where maHoaDon in (select maHoaDon from hoadon where ngayMuaHang between '2022-02-01' and '2022-02-29');

select * from hoadonchitiet;
select max(hdct.soLuong), sp.maSanPham, tenSP as 'max so luot trong thang 12' from hoadonchitiet hdct
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
where maHoaDon in (select maHoaDon from hoadon where ngayMuaHang between '2022-02-01' and '2022-02-29'); 
-- Cac san pham co trong thang 12 la HD005 va HD006
-- max cua HD005 & HD006  la 10  ==> san pham la SP005 va co ten la LAPTOP ACER 003

-- c. Hien thi top 5 khach hang co tong so tien mua hang nhieu thang nam 2022
select * from hoadon;
select * from hoadonchitiet;
select * from sanpham;

select * , hdct.soLuong * sp.donGia as 'TongTien'  from sanpham sp 
inner join hoadonchitiet hdct on sp.maSanPham = hdct.maSanPham
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
where (ngayMuaHang in (select ngayMuaHang from hoadon where ngayMuaHang between '2022-01-01' and '2022-12-31'))
order by TongTien desc
limit 5;

-- select *, soLuong*donGia from sanpham;
-- select max(soLuong*donGia) from sanpham;
-- d. Trogn thang 1/2022
select * from khachhang kh 
inner join hoadon hd on hd.maKhachHang = kh.maKhachHang
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
where diaChi like "%binh duong%" and tenSp like"%Laptop Dell%" and (ngayMuaHang between '2022-01-01' and '2022-01-31');

-- e. Ten san pham co luot mua nho hon luot mua trung binh cac san pham
select tenSP from sanpham sp inner join hoadonchitiet hdct on hdct.maSanPham = sp.maSanPham
where hdct.soLuong < (select avg(hdct.soLuong) from hoadonchitiet hdct);