-- lab 5 bai 1 bai 2
use quanlybanhang;

alter table hoadonchitiet
modify maHoaDon varchar(20);

alter table khachhang
modify maKhachHang varchar(10);

-- a. Hien thi tat ca thong tin co trong bang khach hang bao gom tat ca cac cot
select * from khachHang;

-- b. Hien thi 10 ( 3 ) kh dau tien, trong bang khach hang bao gom cac cot: ma khach hang, ho va ten, email, so dien thoai
select maKhachHang, hoVaTenLot, Ten , Email, dienThoai from khachHang
limit 3;

-- c. Hien thi thong tin tu bang san pham gom cac cot: ma sp, ten san pham, tong tien ton kho. 
-- Voi tong tien tong kho = don gia * so luong.

select maSanPham, tenSP, soLuong * donGia as 'Tong tien ton kho' from sanpham;
-- d. DS KH co ten bat dau boi ky tu 'H' gom cac cot:
-- makhachhang, ho va ten, dia chi. Ho va ten ghep tu ...
select * from khachhang;
select maKhachHang, hoVaTenLot, ten, diaChi from khachhang
where ten like 'S%';

-- e. Hien thi tat ca thong tin cac cot cua khach hang co dia chi chua chuoi Da Nang.
-- Trong my sql khong phan biet chu hoa va thuong.
select * from khachhang
where diachi like'%bien hoa%';

-- f. Hien thi cac san pham co so luong nam trong khoang tu 100 den 500;
select * from sanpham
where soLuong >= 40 and soLuong <= 50;

-- g. Hien thi danh sach cac hoa don co trang thai la chua thanh toan va ngay mua hang trong nam 2016.
select * from hoadon
where (trangThai like "chưa thanh toán") and (ngayMuaHang between '2022-01-01' and '2022-12-31'); 

-- h. Hien thi cac hoa don co ma khach hang thuoc 1 trong 3 ma sau: KH001, KH003, KH006
select * from hoadon
where maKhachHang in ('KH001', 'KH003', 'KH006');
