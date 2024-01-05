
-- 6.1 Liet ke 
select maSach, tieuDe as 'Ten Sach', tacGia, giaTien from sach where maLoaiSach like "TECH";

-- 6.2 Liet ke
select pm.maPhieuMuon, maSach, ngayMuon, maSinhvien from phieumuonsach pm
inner join phieumuonchitiet pmct
on pm.maPhieuMuon = pmct.maPhieuMuon;

-- 6.3 Liet ke
select *from phieumuonsach where trangThai like "Chưa Trả Sách"
order by ngayMuon asc;

-- 6.4 Liet ke tong so dau sach cua moi loai sach
select sach.maLoaiSach, tenLoaiSach, sum(soBanSao)'so luong' from loaisach
inner join sach
on sach.maLoaiSach = loaisach.maLoaiSach
group by maLoaiSach;

-- 6.5 Dem xem co bao nhieu luot sinh vien da muon sach.
select count(*) as 'so luot sinh vien da muon sach'from phieumuonsach;
-- 6.6 Hien thi tat ca cac quyen sach co tieu de chua tu khoa SQL = Blockchain
select *from sach
where tieuDe like "Blockchain%";

-- 6.7 Hien thi thong tin muon sach.
select sv.maSinhVien, tenSinhVien, pmct.maPhieuMuon, tieuDe, ngayMuon, ngayTra from phieumuonsach pm
inner join sinhvien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet pmct on pmct.maPhieuMuon = pm.maPhieuMuon
inner join sach on sach.maSach = pmct.maSach
order by ngayMuon asc;


-- 6.8 Liet ke cac dau sach co luot muon lon hon 20. 
select pmct.maSach,sach.tieuDe as tenSach, ngayMuon, pm.maPhieuMuon, nhaXuatBan, count(pm.maPhieuMuon) as soLuotMuon from phieumuonsach pm
inner join phieumuonchitiet pmct on pmct.maPhieuMuon = pm.maPhieuMuon
inner join sach on sach.maSach = pmct.maSach
group by pm.maPhieuMuon
having pm.maPhieuMuon>0; -- thay the maPhieuMuon nay bang >20

-- 6.9 cap nhat
update sach
set giaTien = giaTien*0.7
where year(ngayNhapKho) <=2018;

-- 6.10 

update phieumuonsach
set trangThai = "Đã Trả Sách"
where maSinhVien = 'ps20104';

-- 6.11 maPhieuMuon, tenSinhVien, Email, tieuDe, ngayMuon ( chua sua ).
select pm.maPhieuMuon, tenSinhVien, Email, tieuDe as 'ten Sach', ngayMuon, ngayTra from phieumuonsach pm
inner join sinhvien sv on sv.maSinhVien = pm.maSinhVien
inner join phieumuonchitiet pmct on pmct.maPhieuMuon = pm.maPhieuMuon
inner join sach on sach.maSach = pmct.maSach
where (day(ngayTra)-day(ngayMuon) >4 ) and (ngayTra is null);

-- 6.12 Viet cau lenh cap nhat lai so luong ban sao

update maSach 
set soBanSao = soBanSao + 5
where maSach in ( select maSach from phieumuonchitiet
group by maSach
having count(maSach) >20 );

-- 6.13 Viet cac cau lenh xoa cac phieu muon co ngay muon va ngay tra truoc ngay 1/1/2010

delete from phieumuonsach
where ngayMuon <='2021-2-1' and ngayTra <='2021-2-1'
