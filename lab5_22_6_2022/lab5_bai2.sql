-- Lab 5 bai 2

-- a. Hien thi so luong kh co trong bang khach hang.
select * from khachhang;
select count(*) as 'So luong khach hang' from khachhang;

-- b. Hien thi don gia lon nhat trong bang san pham
select max(donGia) as 'don gia lon nhat' from sanpham;

-- c. Hien thi so luong san pham thap nhat trong bang san pham
select min(soluong) as 'so luong san pham thap nhat' from sanpham;

-- d. Hien thi tong ca so luong san pham co trong bang san pham
select sum(soLuong) as 'tong so luong san pham' from sanpham;

-- e. Hien thi so hoa don da xuat trong thang 12 / 2016 ma co trang thai chua thanh toan
select count(*) as 'so luong chua thanh toan' from hoadon
where trangthai like 'chưa thanh toán';

select count(*) 'so hoa don' from hoadon
where (ngayMuaHang between '2022-06-01' and '2022-06-30') and ( trangthai like 'chưa thanh toán');

-- f. Hien thi ma hoa don va so loai san pham dc mua trong tung hoa don
select * from hoadonchitiet;
select maHoaDon, soLuong from hoadonchitiet;
select * from hoadonchitiet;
select sum(soLuong) as ' so luong san pham', maSanPham from hoadonchitiet
group by  maSanPham;

-- g. Hien thi ma hoa don ( ma san pham ), so loai (luong) san pham 
-- duoc mua trong tung hoa don, co so luong san pham >= 12
select * from hoadonchitiet;
select sum(soLuong) as ' so luong san pham', maSanPham from hoadonchitiet
group by  maSanPham having sum(soLuong) >= 12;

-- h. Hoa don gom cot ma hoa don, ngay mua hang, ma khach hang. Sap xep theo thu tu giam dan cua ngay mua hang

select * from hoadon;
select maHoaDon, ngayMuaHang, maKhachHang from hoadon
order by ngayMuaHang desc;
