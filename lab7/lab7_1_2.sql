


INSERT INTO hoadon ( maKhachHang, maHoaDon, ngayMuaHang, trangThai )
VALUES 
		("KH001", 120954, "2016-3-23", "đã thanh toán"),
		("KH002", 120955, "2016-2-04", "đã thanh toán"),
		("KH001", 120956, "2016-7-12", "chưa thanh toán"),
		("KH004", 120957, "2016-4-12", "chưa thanh toán");
		
INSERT INTO hoadonchitiet (maHoaDonChiTiet, maHoaDon, maSanPham, soLuong)
VALUES 
		(1,120954,3,40),
		(2,120954,1,20),
		(3,120955,2,100),
		(4,120956,4,6),
		(5,120956,2,60),
		(6,120956,1,10),
		(7,120957,2,50)
		
-- b. Tao 1 bang co ten khachang_daNang
CREATE TABLE `khachang_daNang` (
	`maKhachHang` VARCHAR(5) NOT NULL COLLATE 'utf8mb4_general_ci',
	`hoVaTenLot` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`Ten` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`diaChi` VARCHAR(255) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`Email` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`dienThoai` VARCHAR(13) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	PRIMARY KEY (`maKhachHang`) USING BTREE
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;

-- copy khach hang da nang tu bang khach hang into danang
INSERT INTO khachang_danang (maKhachHang, hoVaTenLot, Ten, diaChi, Email, dienThoai)
SELECT *FROM khachhang
WHERE diaChi LIKE "%Đà Nẵng%";
