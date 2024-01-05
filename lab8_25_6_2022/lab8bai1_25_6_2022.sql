-- Bai 1. tao chi muc tren cac bang co tan suat truy van nhieu

use  quanlybanhang_lab7;
select * from khachhang;
create unique index unique_index_dienthoai on khachhang(dienThoai);
create unique index unique_index_email on khachhang(email);

-- Bai 2 Thao tac sao luu du phong, import, export va bao mat du lieu
-- a. Su