-- Bai 1: 
-- a).
select * from khachhang;
create unique index unique_index_dienThoai on khachhang(dienthoai);

-- b).

create unique index unique_index_email on khachhang(email);

