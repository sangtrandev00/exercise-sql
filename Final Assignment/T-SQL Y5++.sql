-- y5. Nhap du lieu cho cac ban it nhat 5 ban ghi tren moi bang.
alter table sinhvien
add column tenSinhVien varchar(50);

alter table phieumuonsach
alter ngayTra drop default;

alter table phieumuonsach
modify ngayTra timestamp
default current_timestamp
null;


insert into sinhvien(maSinhVien, tenSinhVien, ngayHetHan, chuyenNganhHoc, Email, soDienThoai)
values 
	('ps20100','Trần Ngọc Nhung','2024-5-1','Thương Mại Điện Tử','ngocnhung@fpt.edu.vn','0937988510'),
    ('ps20101','Trương Đoàn Nam','2024-6-1','Thiết Kế Đồ Họa','ngocnhung@fpt.edu.vn','0937988510'),
    ('ps20102','Trương Thị Phượng','2024-7-1','Ứng Dụng Phần Mềm','ngocnhung@fpt.edu.vn','0937988510'),
    ('ps20103','Trần Công Chứng','2024-8-1','Quản Trị Khách Sạn','ngocnhung@fpt.edu.vn','0937988510'),
    ('ps20104','Nguyễn Đức Phước','2024-9-1','Thiết Kế Web','ngocnhung@fpt.edu.vn','0937988510'),
    ('ps20105','Trần Nhật Sang','2024-10-1','Marketing và Bán Hàng','ngocnhung@fpt.edu.vn','0937988510');
    
insert into loaisach (maLoaiSach, tenLoaiSach)
values 
	('TECH','Công Nghệ Thông Tin'),
    ('ECONOMIC','Kinh Tế'),
    ('TRAVEL','Du Lịch'),
    ('CULTURE','Văn Học'),
    ('LANGUAGE','Ngoại Ngữ'),
    ('SKILL','Kỹ Năng'),
    ('RELIGION','Tâm Linh'),
    ('HEALTH','Sức Khỏe');
    
insert into sach (maSach, tieuDe, nhaXuatBan, tacGia, soTrang, soBanSao, giaTien, ngayNhapKho, viTriDatSach, maLoaiSach)
values
	-- ('KTLT001','Kỹ Thuật Lập Trình', 'Huy Hoàng Bookstore','Nguyễn Văn Thới','900','200','110000','2019-1-10','H0001','TECH'),
    ('BLOCK002','Blockchain Và Tương Lai Của Tiền Tệ', 'Tiki Store','Paul Vigna','256','100','97000','2020-3-12','H0002','TECH'),
    ('MKT003','Nhập Môn Marketing', 'NXB Nghệ Tĩnh','Philip Colter','356','150','200000','1999-1-10','H0003','ECONOMIC'),
    ('VHVN004','Bản Sắc Văn Hóa Việt Nam', 'Phan Ngọc','NXH Trí Việt','556','250','135000','2019-1-1','H0004','CULTURE'),
    ('NGUIT005','Ngủ Ít Vẫn Khỏe', 'Nhiều Tác Giả','NXB Thái Hà','250','300','155000','2016-12-10','H0005','HEALTH'),
    ('VONGA006','Vô Ngã Và Vô Luân', 'Dịch giả Thanh Huyền','NXB Thái Hà','439','290','99000','2020-11-10','H0006','RELIGION'),
    ('FLUENT007','Học Ngoại Ngữ và Không Bao Giờ Quên', 'Bryan Bryner','NXB Ngoại Ngữ Việt Nam','300','310','69000','2015-08-10','H0007','LANGUAGE'),
    ('TRAVEL009','Cẩm Nang Hướng Dẫn Du Lịch Việt Nam', 'Như Quỳnh, Như Hoa','TT Giới Thiệu Sách TP. HCM','387','450','120000','2017-06-09','H0008','TRAVEL'),
    ('SKIPASS010','Kỹ Năng Đi Trước Đam Mê', 'Cal Newport','TGM Books','199','90','189000','2019-03-10','H0010','SKILL');
    insert into sach (maSach, tieuDe, nhaXuatBan, tacGia, soTrang, soBanSao, giaTien, ngayNhapKho, viTriDatSach, maLoaiSach)
values
    ('DESIGN011','The Design Thinking Playbook', 'Michael Patrick Larry, Lewrick Link Leifer','Alphabooks','352','50','195000','2021-1-1','H0011','TECH');
    
-- Insert phieu muong sach

insert into phieumuonsach (maPhieuMuon, ngayMuon, ngayTra, maSinhVien, maLop, trangThai)
values 
	-- ('1','2021-10-3','2021-10-8','ps20100','EC17302','Đã Trả Sách'),
    ('2','2021-11-3','2021-11-8','ps20101','TKDH17302','Đã Trả Sách'),
    ('3','2021-1-3',null,'ps20102','UDPM17302','Chưa Trả Sách'),
    ('4','2021-1-3','2021-1-8','ps20103','QTKS17302','Đã Trả Sách'),
    ('5','2021-12-3',null,'ps20104','TKW17303','Chưa Trả Sách'),
    ('6','2021-10-3','2021-11-9','ps20100','MKT17302','Đã Trả Sách');

    -- insert phieu muon chi tiet
 insert into phieumuonchitiet (maPhieuMuon,maSach,ghiChu)
 values 
	('1','MKT003','Ông Tổ marketing nói về những lý thuyết và khái niệm marketing để giúp bạn làm giàu'),
    ('2','BLOCK002','Đây là loại sách công nghệ nói về blockchain là một từ khóa rất hót, và có thể nói là có thể thay đổi cả thế giới công nghệ'),
    ('3','BLOCK002','Đây là loại sách công nghệ nói về blockchain là một từ khóa rất hót, và có thể nói là có thể thay đổi cả thế giới công nghệ'),
    ('4','BLOCK002','Đây là loại sách công nghệ nói về blockchain là một từ khóa rất hót, và có thể nói là có thể thay đổi cả thế giới công nghệ'),
    ('5','BLOCK002','Đây là loại sách công nghệ nói về blockchain là một từ khóa rất hót, và có thể nói là có thể thay đổi cả thế giới công nghệ'),
    ('6','BLOCK002','Đây là loại sách công nghệ nói về blockchain là một từ khóa rất hót, và có thể nói là có thể thay đổi cả thế giới công nghệ')
