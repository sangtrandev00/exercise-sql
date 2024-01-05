-- cau a.
SELECT *FROM khachhang;
-- cau b. hien thi 10 khach hang dau tien

SELECT maKhachHang, hoVaTenLot, Ten, Email, dienThoai FROM khachhang
LIMIT 10;
-- cau b sau khi da edited
SELECT  maKhachHang, hoVaTenLot +''+ Ten as 'Ho va Ten', Email, dienThoai FROM khachhang

-- cau c. Hien thi thong tin tu bang san pham gom cac cot: ma san  pham , ten san pham , tien tong kho
SELECT *FROM sanpham;

SELECT maSanPham, tenSp, donGia*SoLuong AS 'tongTienTonKho' FROM sanpham;

-- cau d. Hien thi danh sach khach hang co ten bat dau boi ki tu H. => chua complete

SELECT maKhachHang, hoVaTenLot + " " + Ten AS 'Ho va Ten'
, diaChi FROM khachhang WHERE Ten LIKE "L%";

-- cau e. Hien thi tat ca thong tin cac cot cua khach hang co dia chi chua chuoi "Da Nang"
SELECT * FROM khachhang WHERE diaChi LIKE "%Bình Dương%";

-- cau f. Hien thi cac san pham co so luong nam trong khaong 100 den 500.

SELECT * FROM sanpham WHERE soLuong BETWEEN 10 AND 20;
-- cau g. Hien thi danh sach cac hoa don co trang thai la chua thanh toan
-- va ngay mua hang trong nam 2016
SELECT *FROM hoadon;

SELECT *FROM hoadon WHERE (trangThai="chưa thanh toán") AND YEAR (ngayMuaHang) ="2022";

-- cau h. Hien thi cac hoa don co ma khach hang thuoc 1 trong 3 ma sau: KH001, KH003, KH006;
SELECT *FROM hoadon WHERE maKhachHang IN ("003","001","006");
-- c2
SELECT *FROM hoadon WHERE maKhachHang LIKE "003" OR maKhachHang LIKE "001" OR maKhachHang LIKE "006";