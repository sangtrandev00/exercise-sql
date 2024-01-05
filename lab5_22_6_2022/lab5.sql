use quanlybanhang2;

-- Bai 1.

-- a.
select * from khachhang;
-- b.

-- alter table khachhang
-- add column soDienThoai varchar(13);

select maKhachHang, hoVaTenLot, Ten, email, dienThoai 
from khachhang;

-- c. 
select maSanPham, tenSP, soLuong * donGia as "Tong Tien Ton Kho"
from sanpham;

-- d.

select maKhachHang, Concat(hoVaTenLot," ", Ten) as "Ho va Ten" , diaChi 
from khachhang where Ten like "N%"; -- Cu dung ham Concat(); --> Trong phien bang moi

-- e.
select * from khachhang
where diaChi like "%Đà Nẵng%";

-- f. 
select * from sanpham
where soLuong between 30 and 40;

-- g. Hien thi hoa don
select * from hoadon
where (ngayMuaHang between "2021-01-01" and "2021-12-12") and ( trangThai like "Chưa thanh toán" );

-- h. 

select * from hoadon
where maKhachHang in ("PS20227","PS20231","PS20229");

-- Bai 2
-- a.
select count(*) as "so luong khach hang" from khachhang;

-- b. 
select max(donGia) as "Don Gia Lon Nhat" from sanpham;

-- c. min
select min(donGia) as "Don gia nho nhat:" from sanpham;

-- d. sum
select sum(soLuong) as "Tong so luong" from sanpham;

-- e 
-- select * from hoadon;


select count(*) as "so hoa don xuat trong thang 12" from hoadon where ngayMuaHang 
between "2021-12-01" and "2021-12-31"
and trangThai like "Chưa thanh toán";

-- f. Hien thi maHoaDon va soLoaiSanPHam duoc mua trong tung hoa don

select maHoaDon, count(*) as"so loai san pham" from hoadonchitiet group by maHoaDon;

-- g. 
-- select * from hoadonchitiet;
select maHoaDon, count(*) as"so_loai_san_pham" from hoadonchitiet 
group by maHoaDon having so_loai_san_pham>=5;

-- h. 
select maHoaDon, ngayMuaHang, maKhachHang 
from hoadon order by ngayMuaHang desc;

