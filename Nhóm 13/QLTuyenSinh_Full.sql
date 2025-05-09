-- TẠO DATABASE
CREATE DATABASE QLTuyenSinhh;
GO

USE QLTuyenSinhh;
GO

-- 1. TRƯỜNG
CREATE TABLE TRUONG (
    MaTruong NVARCHAR(10) PRIMARY KEY,
    TenTruong NVARCHAR(200)
);

-- 2. HỘI ĐỒNG COI THI
CREATE TABLE HOIDONGCOITHI (
    MaHoiDong NVARCHAR(10) PRIMARY KEY,
    TenHoiDong NVARCHAR(200)
);

-- 3. ĐIỂM THI
CREATE TABLE DIEMTHI (
    DiemThiSo INT PRIMARY KEY,
    DiaChiDiemThi NVARCHAR(200),
    MaHoiDong NVARCHAR(10) FOREIGN KEY REFERENCES HOIDONGCOITHI(MaHoiDong),
    MaTruong NVARCHAR(10) FOREIGN KEY REFERENCES TRUONG(MaTruong)
);

-- 4. PHÒNG THI
CREATE TABLE PHONGTHI (
    SoPhong NVARCHAR(10) PRIMARY KEY,
    DiemThiSo INT FOREIGN KEY REFERENCES DIEMTHI(DiemThiSo),
    GhiChu NVARCHAR(200)
);

-- 5. NGÀNH
CREATE TABLE NGANH (
    MaNganh NVARCHAR(10) PRIMARY KEY,
    TenNganh NVARCHAR(100)
);

-- 6. ĐƠN VỊ
CREATE TABLE DONVI (
    MaDonVi NVARCHAR(10) PRIMARY KEY,
    TenDonVi NVARCHAR(100)
);

-- 7. CÁN BỘ THAM GIA
CREATE TABLE CANBOTHAMGIA (
    MaCanBo NVARCHAR(10) PRIMARY KEY,
    HoTenCB NVARCHAR(100),
    ChucVu NVARCHAR(50),
    MaDonVi NVARCHAR(10) FOREIGN KEY REFERENCES DONVI(MaDonVi),
    DiemThiSo INT FOREIGN KEY REFERENCES DIEMTHI(DiemThiSo)
);

-- 8. THÍ SINH
CREATE TABLE THISINH (
    SoBD NVARCHAR(10) PRIMARY KEY,
    HoTen NVARCHAR(100),
    NgaySinh DATE,
    Phai NVARCHAR(10),
    Tinh NVARCHAR(100),
    DoiTuong NVARCHAR(10),
    KhuVuc NVARCHAR(5),
    DiemThiSo INT FOREIGN KEY REFERENCES DIEMTHI(DiemThiSo),
    MaNganh NVARCHAR(10) FOREIGN KEY REFERENCES NGANH(MaNganh),
    SoPhong NVARCHAR(10) FOREIGN KEY REFERENCES PHONGTHI(SoPhong)
);

-- 9. MÔN THI
CREATE TABLE MONTHI (
    MaMT NVARCHAR(10) PRIMARY KEY,
    TenMT NVARCHAR(100),
    NgayThi DATE,
    BuoiThi NVARCHAR(10),
    Phut INT CHECK (Phut BETWEEN 90 AND 180)
);

-- 10. KẾT QUẢ THI
CREATE TABLE THI (
    SoBD NVARCHAR(10) FOREIGN KEY REFERENCES THISINH(SoBD),
    MaMT NVARCHAR(10) FOREIGN KEY REFERENCES MONTHI(MaMT),
    Diem FLOAT CHECK (Diem BETWEEN 0 AND 10),
    PRIMARY KEY (SoBD, MaMT)
);


-- CHÈN DỮ LIỆU

INSERT INTO TRUONG (MaTruong, TenTruong) VALUES (N'T01', N'Trường PTTH Nguyễn Thị Minh Khai');
INSERT INTO TRUONG (MaTruong, TenTruong) VALUES (N'T02', N'Trường PTTH Bùi Thị Xuân');
INSERT INTO TRUONG (MaTruong, TenTruong) VALUES (N'T03', N'Trường PTTH Lê Quý Đôn');
INSERT INTO TRUONG (MaTruong, TenTruong) VALUES (N'T04', N'Trường PTTH Trần Đại Nghĩa');
INSERT INTO TRUONG (MaTruong, TenTruong) VALUES (N'T05', N'Trường PTTH Gia Định');

INSERT INTO HOIDONGCOITHI (MaHoiDong, TenHoiDong) VALUES (N'HD01', N'Hội đồng A');
INSERT INTO HOIDONGCOITHI (MaHoiDong, TenHoiDong) VALUES (N'HD02', N'Hội đồng B');
INSERT INTO HOIDONGCOITHI (MaHoiDong, TenHoiDong) VALUES (N'HD03', N'Hội đồng C');
INSERT INTO HOIDONGCOITHI (MaHoiDong, TenHoiDong) VALUES (N'HD04', N'Hội đồng D');
INSERT INTO HOIDONGCOITHI (MaHoiDong, TenHoiDong) VALUES (N'HD05', N'Hội đồng E');

INSERT INTO DIEMTHI (DiemThiSo, DiaChiDiemThi, MaHoiDong, MaTruong) VALUES (1, N'Trường PTTH Nguyễn Thị Minh Khai', N'HD01', N'T01');
INSERT INTO DIEMTHI (DiemThiSo, DiaChiDiemThi, MaHoiDong, MaTruong) VALUES (2, N'Trường PTTH Bùi Thị Xuân', N'HD02', N'T02');
INSERT INTO DIEMTHI (DiemThiSo, DiaChiDiemThi, MaHoiDong, MaTruong) VALUES (3, N'Trường PTTH Lê Quý Đôn', N'HD03', N'T03');
INSERT INTO DIEMTHI (DiemThiSo, DiaChiDiemThi, MaHoiDong, MaTruong) VALUES (4, N'Trường PTTH Trần Đại Nghĩa', N'HD04', N'T04');
INSERT INTO DIEMTHI (DiemThiSo, DiaChiDiemThi, MaHoiDong, MaTruong) VALUES (5, N'Trường PTTH Gia Định', N'HD05', N'T05');

INSERT INTO PHONGTHI (SoPhong, DiemThiSo, GhiChu) VALUES (N'P001', 1, N'Dãy A lầu 1');
INSERT INTO PHONGTHI (SoPhong, DiemThiSo, GhiChu) VALUES (N'P002', 1, N'Dãy A lầu 2');
INSERT INTO PHONGTHI (SoPhong, DiemThiSo, GhiChu) VALUES (N'P003', 2, N'Dãy B lầu 1');
INSERT INTO PHONGTHI (SoPhong, DiemThiSo, GhiChu) VALUES (N'P004', 3, N'Dãy C lầu 3');
INSERT INTO PHONGTHI (SoPhong, DiemThiSo, GhiChu) VALUES (N'P005', 4, N'Dãy D lầu 2');

INSERT INTO NGANH (MaNganh, TenNganh) VALUES (N'01', N'Công nghệ thông tin');
INSERT INTO NGANH (MaNganh, TenNganh) VALUES (N'02', N'Công nghệ thực phẩm');
INSERT INTO NGANH (MaNganh, TenNganh) VALUES (N'03', N'Quản trị kinh doanh');
INSERT INTO NGANH (MaNganh, TenNganh) VALUES (N'04', N'Tài chính ngân hàng');
INSERT INTO NGANH (MaNganh, TenNganh) VALUES (N'05', N'Ngôn ngữ Anh');

INSERT INTO DONVI (MaDonVi, TenDonVi) VALUES (N'DV01', N'Khoa Công Nghệ Thông Tin');
INSERT INTO DONVI (MaDonVi, TenDonVi) VALUES (N'DV02', N'Phòng Đào Tạo');
INSERT INTO DONVI (MaDonVi, TenDonVi) VALUES (N'DV03', N'Trường PTTH Ngôi Sao');
INSERT INTO DONVI (MaDonVi, TenDonVi) VALUES (N'DV04', N'Phòng Tổ chức');
INSERT INTO DONVI (MaDonVi, TenDonVi) VALUES (N'DV05', N'Trường PTTH Marie Curie');

INSERT INTO CANBOTHAMGIA (MaCanBo, HoTenCB, ChucVu, MaDonVi, DiemThiSo) VALUES (N'CB01', N'Nguyễn Thanh Liêm', N'Điểm trưởng', N'DV01', 1);
INSERT INTO CANBOTHAMGIA (MaCanBo, HoTenCB, ChucVu, MaDonVi, DiemThiSo) VALUES (N'CB02', N'Nguyễn Thị Tuyết Mai', N'Cán bộ coi thi', N'DV03', 2);
INSERT INTO CANBOTHAMGIA (MaCanBo, HoTenCB, ChucVu, MaDonVi, DiemThiSo) VALUES (N'CB03', N'Trần Văn Tâm', N'Giám sát', N'DV02', 1);
INSERT INTO CANBOTHAMGIA (MaCanBo, HoTenCB, ChucVu, MaDonVi, DiemThiSo) VALUES (N'CB04', N'Lê Thị Nga', N'Thư ký', N'DV04', 3);
INSERT INTO CANBOTHAMGIA (MaCanBo, HoTenCB, ChucVu, MaDonVi, DiemThiSo) VALUES (N'CB05', N'Phạm Quốc Huy', N'Phục vụ', N'DV05', 4);

INSERT INTO THISINH (SoBD, HoTen, NgaySinh, Phai, Tinh, DoiTuong, KhuVuc, DiemThiSo, MaNganh, SoPhong) VALUES (N'00001', N'Vũ Mạnh Cường', N'1984-12-12', N'Nam', N'Tiền Giang', N'5B', N'KV1', 1, N'01', N'P001');
INSERT INTO THISINH (SoBD, HoTen, NgaySinh, Phai, Tinh, DoiTuong, KhuVuc, DiemThiSo, MaNganh, SoPhong) VALUES (N'00002', N'Lê Thị Hương', N'2002-03-21', N'Nữ', N'Hà Nội', N'1A', N'KV2', 1, N'02', N'P001');
INSERT INTO THISINH (SoBD, HoTen, NgaySinh, Phai, Tinh, DoiTuong, KhuVuc, DiemThiSo, MaNganh, SoPhong) VALUES (N'00003', N'Nguyễn Văn A', N'2001-05-30', N'Nam', N'Bình Dương', N'3C', N'KV2', 2, N'03', N'P002');
INSERT INTO THISINH (SoBD, HoTen, NgaySinh, Phai, Tinh, DoiTuong, KhuVuc, DiemThiSo, MaNganh, SoPhong) VALUES (N'00004', N'Trần Thị B', N'2002-06-15', N'Nữ', N'Đà Nẵng', N'2B', N'KV1', 3, N'04', N'P003');
INSERT INTO THISINH (SoBD, HoTen, NgaySinh, Phai, Tinh, DoiTuong, KhuVuc, DiemThiSo, MaNganh, SoPhong) VALUES (N'00005', N'Hồ Văn C', N'2000-07-10', N'Nam', N'TPHCM', N'4A', N'KV3', 4, N'01', N'P005');

INSERT INTO MONTHI (MaMT, TenMT, NgayThi, BuoiThi, Phut) VALUES (N'M01', N'Toán', N'2025-06-01', N'Sáng', 120);
INSERT INTO MONTHI (MaMT, TenMT, NgayThi, BuoiThi, Phut) VALUES (N'M02', N'Văn', N'2025-06-02', N'Chiều', 150);
INSERT INTO MONTHI (MaMT, TenMT, NgayThi, BuoiThi, Phut) VALUES (N'M03', N'Anh', N'2025-06-03', N'Sáng', 90);
INSERT INTO MONTHI (MaMT, TenMT, NgayThi, BuoiThi, Phut) VALUES (N'M04', N'Hóa học', N'2025-06-04', N'Sáng', 180);
INSERT INTO MONTHI (MaMT, TenMT, NgayThi, BuoiThi, Phut) VALUES (N'M05', N'Sinh học', N'2025-06-05', N'Chiều', 135);

INSERT INTO THI (SoBD, MaMT, Diem) VALUES (N'00001', N'M01', 8.5);
INSERT INTO THI (SoBD, MaMT, Diem) VALUES (N'00001', N'M02', 7.0);
INSERT INTO THI (SoBD, MaMT, Diem) VALUES (N'00002', N'M01', 9.0);
INSERT INTO THI (SoBD, MaMT, Diem) VALUES (N'00003', N'M03', 6.5);
INSERT INTO THI (SoBD, MaMT, Diem) VALUES (N'00004', N'M04', 8.0);

-- Câu 1: Liệt kê họ tên thí sinh, tên môn thi, ngày thi, buổi thi và địa chỉ điểm thi mà thí sinh tham gia môn thi đó
SELECT TS.HoTen, MT.TenMT, MT.NgayThi, MT.BuoiThi, DT.DiaChiDiemThi
FROM THISINH TS
JOIN THI T ON TS.SoBD = T.SoBD
JOIN MONTHI MT ON T.MaMT = MT.MaMT
JOIN PHONGTHI PT ON TS.SoPhong = PT.SoPhong
JOIN DIEMTHI DT ON PT.DiemThiSo = DT.DiemThiSo
GO
--KQ: 5 rows
-- Câu 2: Liệt kê họ tên cán bộ coi thi, tên đơn vị công tác và danh sách thí sinh thi tại điểm thi nơi cán bộ đó làm nhiệm vụ
SELECT CB.HoTenCB AS HO_TEN_CAN_BO, DV.TenDonVi, TS.HoTen AS HO_TEN_THI_SINH, DT.DiaChiDiemThi
FROM CANBOTHAMGIA CB
JOIN DONVI DV ON CB.MaDonVi = DV.MaDonVi
JOIN DIEMTHI DT ON CB.DiemThiSo = DT.DiemThiSo
JOIN PHONGTHI PT ON DT.DiemThiSo = PT.DiemThiSo
JOIN THISINH TS ON TS.SoPhong = PT.SoPhong
ORDER BY CB.HoTenCB, TS.HoTen
GO
--KQ: 8 rows
--Câu 3. Cập nhật giới tính của thí sinh có số báo danh 03567 thành “Nữ”.
UPDATE THISINH
SET PHAI = 'Nữ'
WHERE SOBD = '03567'
GO

--Câu 4. Chuyển tất cả các cán bộ đang làm việc tại điểm thi số 2 có chức vụ là "giám sát" sang điểm thi số 3.
UPDATE CANBOTHAMGIA
SET DIEMTHISO = 3
WHERE DIEMTHISO = 2 AND CHUCVU = 'giám sát'
GO
-- Câu 5. Xóa tất cả thí sinh thuộc ngành chưa có tên trong bảng NGANH
DELETE FROM THISINH
WHERE MaNganh NOT IN (SELECT MaNganh FROM NGANH)
GO
-- Câu 6. Xóa tất cả cán bộ làm việc tại các điểm thi không còn tồn tại trong bảng DIEMTHI.
DELETE FROM CANBOTHAMGIA
WHERE NOT EXISTS (
    SELECT 1 
    FROM DIEMTHI 
    WHERE DIEMTHI.DiemThiSo = CANBOTHAMGIA.DiemThiSo)
GO
--Câu 7: Tính điểm trung bình của thí sinh theo từng ngành.
SELECT N.TenNganh, AVG(T.Diem) AS DiemTrungBinh
FROM NGANH N
JOIN THISINH TS ON N.MaNganh = TS.MaNganh
JOIN THI T ON TS.SoBD = T.SoBD
GROUP BY N.TenNganh
GO
--KQ: 4 rows
--Câu 8: Đếm số lượng thí sinh theo từng địa điểm thi.
SELECT D.DiaChiDiemThi, COUNT(TS.SoBD) AS SoLuongThiSinh
FROM DIEMTHI D
JOIN THISINH TS ON D.DiemThiSo = TS.DiemThiSo
GROUP BY D.DiaChiDiemThi
GO
--KQ: 4 rows
--Câu 9: Tìm thí sinh có điểm thi cao nhất trong tất cả các môn thi.
SELECT TS.SoBD, TS.HoTen, MAX(T.Diem) AS DiemCaoNhat
FROM THISINH TS
JOIN THI T ON TS.SoBD = T.SoBD
GROUP BY TS.SoBD, TS.HoTen
HAVING MAX(T.Diem) = ( SELECT MAX(Diem) 
FROM THI)
GO
--KQ: Lê Thị Hương
--Câu 10: Tìm các môn thi có điểm trung bình lớn hơn 7.0
SELECT M.TenMT
FROM MONTHI M
WHERE (SELECT AVG(T.Diem) 
FROM THI T 
WHERE T.MaMT = M.MaMT) > 7.0
GO
--KQ: 4 rows
--Câu 11: Liệt kê mỗi phòng thi có bao nhiêu thí sinh, sắp xếp theo số lượng thí sinh giảm dần
SELECT PT.SoPhong, COUNT(TS.SoBD) AS SoLuongThiSinh
FROM PHONGTHI PT
JOIN THISINH TS ON PT.SoPhong = TS.SoPhong
GROUP BY PT.SoPhong
ORDER BY SoLuongThiSinh DESC
GO
--KQ: 4 rows
--Câu 12: Tìm tên các trường có ít nhất một thí sinh dự thi ngành "Quản trị Kinh doanh"
SELECT DISTINCT T.TenTruong
FROM TRUONG T
JOIN DIEMTHI D ON T.MaTruong = D.MaTruong
JOIN THISINH TS ON D.DiemThiSo = TS.DiemThiSo
JOIN NGANH N ON TS.MaNganh = N.MaNganh
WHERE N.TenNganh = N'Quản trị Kinh doanh'
--KQ: Trường PTTH Bùi Thị Xuân


