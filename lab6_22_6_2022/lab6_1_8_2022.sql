use quanlybanhang;

-- lab 6 bai 1
-- a. 
select hd.maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang 
from hoadon hd
inner join hoadonchitiet hdct on hd.maHoaDon = hdct.maHoaDon;

-- b.
-- select * from hoadon;
-- select * from hoadonchitiet;

select hd.maHoaDon, maKhachHang, trangThai, maSanPham, soLuong, ngayMuaHang, maHoaDonChiTiet 
from hoadon hd
inner join hoadonchitiet hdct
on hdct.maHoaDon = hd.maHoaDon
where maKhachHang like "PS20227";

-- c 
select * from sanpham;
select * from hoadonchitiet;
select * from hoadon;
select * from khachhang;

select hd.maHoaDon, ngayMuaHang, tenSP, donGia, hdct.soLuong, hdct.soLuong * donGia as "Thanh Tien"
from hoadon hd inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
inner join sanpham sp 
on sp.maSanPham = hdct.maSanPham;

-- d 

select Concat(hoVaTenLot, " ", Ten) 
as "HoVaTen", email, dienThoai, hd.maHoaDon,
trangThai, maHoaDonChiTiet, hdct.soLuong, 
donGia, hdct.soLuong * donGia as "Tong Tien"
from khachhang kh
inner join hoadon hd on hd.maKhachHang = kh.maKhachHang
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
group by maHoaDon having trangThai like "chưa thanh toán";

-- e. 
select hd.maHoaDon, ngayMuaHang, hdct.soLuong * donGia as "tongTien"
from hoadon hd 
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
where hdct.soLuong * donGia >= 50000000 order by hdct.soLuong * donGia desc;
 
-- Lab 6 bai 2
-- a.
select * from khachhang
where maKhachHang not in (select kh.maKhachHang from khachhang kh
inner join hoadon hd on kh.maKhachHang = hd.maKhachHang
where ngayMuaHang >= "2022-01-01");

-- subquery --> Nhung khach hang da mua hang tu ngay 1 - 1 - 2022;
-- select kh.maKhachHang from khachhang kh
-- inner join hoadon hd on kh.maKhachHang = hd.maKhachHang
-- where ngayMuaHang >= "2022-01-01";

-- b Hiển thị mã sản phẩm, tên sản phẩm có lượt mua nhiều nhất trong tháng 12/2016
-- 
select * from hoadon;
select * from sanpham;
select * from hoadonchitiet;



select count(*),hd.maHoaDon, sp.maSanPham, tenSp, ngayMuaHang  from hoadonchitiet hdct
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
where  ngayMuaHang between "2021-12-01" and "2021-12-31"
group by hd.maHoaDon limit 1;

-- select max(hdct.soLuong), sp.maSanPham, tenSp from sanpham sp
-- inner join hoadonchitiet hdct on
-- sp.maSanPham = hdct.maSanPham
-- inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
-- where ngayMuaHang between "2021-12-01" and "2021-12-31";

-- c. Hiển thị top 5 khách hàng có tổng số tiền mua hàng nhiều nhất trong năm 2016

select * from hoadonchitiet;
select * from khachhang;
select * from sanpham;
select * from hoadon;

select * from khachhang kh
inner join hoadon hd on hd.maKhachHang = hd.maKhachHang
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon 
group by kh.maKhachHang;


-- sub query khachhang.

select * from khachhang
where maKhachHang ;--

select * from khachhang;

select hd.maKhachHang, hoVaTenLot, Ten, sum(hdct.soLuong * sp.donGia) as "tong tien mua hang" from hoadonchitiet hdct
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
inner join khachhang kh on kh.maKhachHang = hd.maKhachHang
group by kh.maKhachHang 
order by sum(hdct.soLuong * sp.donGia) desc
limit 5;

-- d. 

select * from khachhang;
select * from hoadon;
select * from hoadonchitiet;
select * from sanpham;

select * from khachhang kh
inner join hoadon hd on hd.maKhachHang = kh.maKhachHang
inner join hoadonchitiet hdct on hdct.maHoaDon = hd.maHoaDon
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
where diaChi like "%Bình Dương%"
and tenSP like "%Laptop levano%" and (ngayMuaHang between "2021-12-01" and "2021-12-31");

-- e.

select * from hoadonchitiet ;

select tenSp, hdct.soLuong as "So luot mua" from sanpham sp
inner join hoadonchitiet hdct on hdct.maSanPham = sp.maSanPham
where hdct.soLuong < (select avg(soLuong) from hoadonchitiet);


create table countAvgSp as
select maSanPham, sum(soLuong) as "countMSP" from hoadonchitiet
group by maSanPham;

select avg(countMSP) from countAvgSp;

select sp.tenSp, sum(hdct.soLuong) from sanpham sp
inner join hoadonchitiet hdct on sp.maSanPham = hdct.maSanPham
group by sp.maSanPham having sum(hdct.soLuong) < (select avg(countMSP) from countAvgSp);





