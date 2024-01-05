-- lab 7 bai 2

-- a. Cap nhat lai thong tin so dien thoai cua khach hang co ma KH002
-- co gia tri moi la...
use quanlybanhang_lab7;
select * from khachhang;
update khachhang
set dienThoai = '16267788989'
where maKhachHang like 'KH002';

-- b. Tang so luong mat hang co ma '3' len them '200' don vi.
select *from khachhang;
select *from sanpham;
update sanpham
set soLuong = soLuong + 200
where maSanPham = '3';

-- c. Giam gia cho tat ca san pham --> giam 5%
update sanpham
set donGia = donGia *0.95;

-- d. Tang so luong cua mat hang ban chay nhat trong thang 12/2016 len 100 don vi

select *from hoadonchitiet;
select *from hoadon;
select *from khachhang;
select *from sanpham;

-- Select cac mat hang ban duoc trong thang 12 ---> ma san pham la 2 va 3 ( max co ma san pham la 2)
select hdct.maSanPham from hoadonchitiet hdct 
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon 
where ngayMuaHang between '2016-12-01' and '2016-12-31'
group by hdct.maSanPham order by sum(hdct.soLuong) desc limit 1; 

-- 2. update -- fixed from lecture
update sanpham
set soLuong = soLuong + 100  -- asume 500 --> 600
where maSanPham = (
	select hdct.maSanPham from hoadonchitiet hdct 
inner join sanpham sp on sp.maSanPham = hdct.maSanPham
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon 
where ngayMuaHang between '2016-12-01' and '2016-12-31'
group by hdct.maSanPham order by sum(hdct.soLuong) desc limit 1
);

-- e. Giam gia 10% cho 2 san pham ban it nhat trong nam 2016; 
-- B1. Tao mot bang con co chua 2 ma san pham it nhat trong nam 2016
create table new_table as
select sp.maSanPham from sanpham sp
inner join hoadonchitiet hdct on hdct.maSanPham = sp.maSanPham
inner join hoadon hd on hd.maHoaDon = hdct.maHoaDon
where ngayMuaHang between '2016-01-01'and '2016-12-31'
group by sp.maSanPham
order by sum(hdct.soLuong) limit 2;
-- B2 cap nhat san pham tu bang trung gian do
select * from sanpham;
update sanpham
set donGia = donGia *0.9
where maSanPham in (select maSanPham from new_table);

-- f. Cap nhat lai trang thai da thanh cho hoa don co ma 120956 ( success ).
select * from hoadon
where maHoaDon like '120956';

update hoadon
set trangThai = 'Đã thanh toán' 
where maHoaDon like '120956';

-- g. Xoa mat hang co ma san pham la '2' ra khoi hoa don '120956' va trang thai la chua thanh toan
 -- Tim san pham co: Ma san pham la 2 va hoa don la 120956 va trang thai chua thanh toan
select * from hoadonchitiet;
select hd.maHoaDon from hoadon hd
inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
where  hdct.maSanPham = '2' and hd.maHoaDon = '120956' and hd.trangThai like'%chưa%';

delete from hoadonchitiet 
where maSanPham = '2' and maHoaDon in (select hd.maHoaDon from hoadon hd
inner join hoadonchitiet hdct
on hd.maHoaDon = hdct.maHoaDon
where  hdct.maSanPham = '2' and hd.maHoaDon = '120956' and hd.trangThai like'%chưa%');

-- h. Xoa khach hang chua tung mua hang ke tu ngay '1-1-2016'
select * from khachhang;
select * from hoadon;

-- B1. Tim khach hang chua mua hang
select kh.maKhachHang from khachhang kh 
inner join hoadon hd on kh.maKhachHang = hd.maKhachHang
where ngayMuaHang >= '2016-01-01';

-- B2. Xoa khach hang
delete from khachhang
where maKhachHang not in (select kh.maKhachHang from khachhang kh 
inner join hoadon hd on kh.maKhachHang = hd.maKhachHang
where ngayMuaHang >= '2016-01-01');

