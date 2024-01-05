
-- Yeu cau 5.
-- Table The Sinh Vien
insert into TheSinhVien values
	('PD05395', 'Đặng Ngọc Anh', '2022-3-3', 'Lập trình Máy Tính','anh@gmail.com','0123456789',"LT16001"),
    ('PD05396', 'Đặng Ngọc Minh', '2022-6-8', 'Lập trình','minh@gmail.com','0123456782','LT16002'),
    ('PD05394', 'Hồ Ngọc Anh', '2022-9-6', 'Lập trình','anhhn@gmail.com','0123456783','LT16003'),
    ('PD05364', 'Nguyễn Ngọc Anh', '2022-6-5', 'Lập trình','anhnn@gmail.com','0123456784','LT16004'),
    ('PD05021', 'Mai Ngọc Anh', '2022-4-6', 'Lập trình','anhmn@gmail.com','0123456785','LT16005'),
	('PS20227','Trần Nhật Sang','2022-11-08','Lập trình Web','sang@gmail.com','0123456792','WEB1013'),
	('PS20228','Trần Văn Lan','2022-12-12','Ứng dụng phần mềm','lan@gmail.com','0123459821','UDPM1012'),
	('PS20229','Hà Thị Loan','2023-03-11','Thiết kế ứng dụng mobile','loan@gmail.com','0123486232','MOB1021');


-- Table Loai Sach

insert into LoaiSach values
	('cntt', 'Công nghệ thông tin'),
	('pts', 'Photoshop'),
	('sql', 'Cơ sở dữ liệu'),
	('ks', 'Du lịch và khách sạn'),
	('mkt', 'Marketting'),
	('ct','Chính Trị'),
	('ecom','Kinh tế'),
	('math','Toán học'),
	('psy','Tâm lý học'),
	('tg','Tôn Giáo'),
	('vh','Văn học'),
	('xh','Xã hội học');
 
-- Table sach

insert into Sach (maSach,tieuDe,tacGia,nhaXuatBan,soTrang,banSao,giaTien,ngayNhapKho,viTriDatSach, maLoai)
values 
	('SQL001','SQL sever','Herbert Schildt','NXB Ha Noi','30','4','500000', '2010-1-20','VT0001','cntt'),
	('IT002','Lap trinh huong doi tuong', 'Herbert Schildt','NXB Ha Noi','20', '4','400000','2017-1-30','VT0002','cntt'),
	('SQL003','Tin hoc co so','Herbert Schildt','NXB Ha Noi','15','4','200000','2018-5-6','VT0003','cntt'),
    ('PTS004','Photoshop','Herbert Schildt','NXB Ha Noi', '25','4','350000', '2016-7-5','VT0004','cntt'),
    ('IT005','Photoshop nang cao','Herbert Schildt','NXB Ha Noi','20','4','500000','2017-1-1','VT0005','cntt'),
    ('MAR201','Marketing trên internet','Robert Alberto','NXB HCM',120,30,122000,'2021-11-10','VT0008','ecom');

-- Table phieu muon
insert into PhieuMuon (maPhieuMuon,ngayMuon,ngayTra,soLuongSach,maSinhVien)
values 
	('1', '2017-2-2', '2017-2-15', '3', 'PD05394'),
	('2', '2016-1-2', '2016-1-15', '2', 'PD05021'),
	('3', '2021-2-28', null, '1', 'PD05364'),
	('4', '2020-12-2', null, '2', 'PD05396'),
	('5', '2019-2-2', '2019-2-8', '3', 'PD05395'),
    (6,'2019-03-11','2019-03-21',2,'PS20227'),
	(7,'2018-04-12','2019-06-13',2,'PS20228'),
	(8,'2021-05-13','2021-06-01',3,'PS20229');
    
-- Table phieu muon chi tiet
insert into PhieuMuonChiTiet(maPhieuMuonChiTiet,maPhieuMuon ,maSach, GhiChu,ngayTraSach)
values 
		('PMCT001','1', 'SQL001', 'no thing special','2017-2-15'),
		('PMCT002','2', 'IT002', 'no thing special','2016-1-15'),
		('PMCT003','3', 'SQL003', 'no thing special',null),
		('PMCT004','4', 'PTS004', 'no thing special',null),
		('PMCT005','5', 'IT005', 'no thing special','2019-2-8'),
		('PMCT006','6', 'SQL001','Đã trả sách',NULL),
		('PMCT007','3','SQL001','Đã trả sách',NULL);

-- Yeu cau 6: 
-- 6.1 Liệt kê tất cả thông tin của các đầu sách gồm tên sách, mã sách, giá tiền , tác giả
-- thuộc loại sách có mã “IT”.
select tieuDe as "tenSach", maSach, giaTien, tacGia from sach
where maLoai like "cntt";

-- 6.2 Liệt kê các phiếu mượn gồm các thông tin mã phiếu mượn, mã sách , ngày mượn, mã
-- sinh viên có ngày mượn trong tháng 01/2017
select * from phieumuon;
select * from phieumuonchitiet;
select * from sach;

select pm.maPhieuMuon,maSach, ngayMuon, maSinhVien from phieumuon pm
inner join phieumuonchitiet pmct on pmct.maPhieuMuon = pm.maPhieuMuon
where ngayMuon like "2017-02%";

-- 6.3 Liệt kê các phiếu mượn chưa trả sách cho thư viên theo thứ tự tăng dần của ngày
-- mượn sách

select pm.maPhieuMuon, ngayMuon, ghiChu from phieumuonchitiet pmct
inner join phieumuon pm on pm.maPhieuMuon = pmct.maPhieuMuon
group by pm.maPhieuMuon having ghiChu like "%chưa%" order by ngayMuon ;


-- 6.4 Liệt kê tổng số đầu sách của mỗi loại sách ( gồm mã loại sách, tên loại sách, tổng số
-- lượng sách mỗi loại)
select count(*) as"Tong so dau sach moi loai", ls.maLoai,tenLoaiSach from loaiSach ls
inner join sach on sach.maLoai = ls.maLoai
group by ls.maLoai;


-- 6.5 Đếm xem có bao nhiêu lượt sinh viên đã mượn sách.
select * from phieumuon;
select * from phieumuonchitiet;
select count(*) as "so luot sinh vien da muon sach" from phieumuon;

-- 6.6 Hiển thị tất cả các quyển sách có tiêu đề chứa từ khoá “SQL”.
select * from sach
where tieuDe like "%SQL%";

-- 6.7 Hiển thị thông tin mượn sách gồm các thông tin: mã sinh viên, tên sinh viên, mã
-- phiếu mượn, tiêu đề sách, ngày mượn, ngày trả. Sắp xếp thứ tự theo ngày mượn sách.

select sv.maSinhVien, tenSinhVien, pm.maPhieuMuon, tieuDe, ngayMuon, ngaytra 
from thesinhvien sv 
inner join phieumuon pm on pm.maSinhVien = sv.maSinhVien
inner join phieumuonchitiet pmct on pmct.maPhieuMuon = pm.maPhieuMuon
inner join sach s on s.maSach = pmct.maSach
order by ngayMuon;

-- 6.8 Liệt kê các đầu sách có lượt mượn lớn hơn 2 lần.

select count(s.maSach) "luot muon", s.maSach, tieuDe from sach s
inner join phieumuonchitiet pmct on pmct.maSach = s.maSach
group by s.maSach having count(s.maSach) > 2;

-- 6.9 Viết câu lệnh cập nhật lại giá tiền của các quyển sách có ngày nhập kho trước năm
-- 2014 giảm 30%
select * from sach;
update sach
set giaTien = giaTien * 0.7
where ngayNhapKho <= "2018-01-01";

-- 6.10: Viết câu lệnh cập nhật lại trạng thái đã trả sách cho phiếu mượn của sinh viên có mã
-- sinh viên PD12301 (ví dụ).

select * from phieumuon;
select * from phieumuonchitiet;
select * from thesinhvien;
select * from phieumuon;



select pm.maPhieuMuon from phieumuon pm 
inner join phieumuonchitiet pmct 
on pmct.maPhieuMuon = pm.maPhieuMuon
where maSinhVien = "PD05396";

update phieumuonchitiet
set ghiChu = "Đã trả sách"
where maPhieuMuon = (select pm.maPhieuMuon from phieumuon pm 
inner join phieumuonchitiet pmct 
on pmct.maPhieuMuon = pm.maPhieuMuon
where maSinhVien = "PD05396");

-- 6.11 Lập danh sách các phiếu mượn quá hạn chưa trả gồm các thông tin: mã phiếu mượn,
-- tên sinh viên, email, danh sách các sách đã mượn, ngày mượn.

select pm.maPhieuMuon, tenSinhVien, email, ngayMuon, ngayTra, ghiChu , datediff(curDate(),pm.ngayTra) as 'soNgayVuot'
from phieumuon pm inner join thesinhVien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet ct on ct.maPhieuMuon = pm.maPhieuMuon
where datediff(curDate(),pm.ngayTra) >= 0 and ghiChu like 'chưa trả sách' ; 


-- 6.12 Viết câu lệnh cập nhật lại số lượng bản sao tăng lên 5 đơn vị đối với các đầu sách có
-- lượt mượn lớn hơn 2
select * from sach;

update sach
set banSao = banSao + 5
where maSach = (select  s.maSach from sach s inner join phieumuonchitiet pmct
on pmct.maSach = s.maSach group by s.maSach having count(s.maSach) > 2 );


-- 6.13 Viết câu lệnh xoá các phiếu mượn có ngày mượn và ngày trả trước '21/1/2016';
select * from phieumuon;

SET FOREIGN_KEY_CHECKS=0;-- to disable them
delete from phieumuon
where (ngayMuon <= "2016-01-21" )
and (ngayTra <= "2016-01-21" );
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them


