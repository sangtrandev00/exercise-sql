SELECT *FROM monhoc;
SELECT *FROM nguoidung;
SELECT *FROM nhanvien;
SELECT *FROM thamgiahoc;
SELECT *FROM lophocphan;


SELECT nv.maNhanVien, ten, nv.theLoai,ngaySinh, hp.ngonNguGiangDay,hp.gioiHangSoLuongSinhVien, mh.soTinChi
FROM nhanvien nv
INNER JOIN lophocphan hp
ON nv.maNhanVien = hp.maNhanVien
INNER JOIN monhoc mh
ON mh.maMonHoc = hp.maMonHoc
WHERE hp.ngonNguGiangDay LIKE "Tiếng Việt";

