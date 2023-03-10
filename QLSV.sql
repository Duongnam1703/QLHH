
---create database QLSV

 GO 
	
CREATE DATABASE QLSV on primary

(
NAME='QLSV_DATA',
	FILENAME='D:\DOANKHACNAM\QLSV_Data.mdf',
	SIZE=20MB,
	MAXSIZE=40MB,
	FILEGROWTH=1MB
)

LOG ON(
NAME='QLSV_log',
	FILENAME='D:\DOANKHACNAM\QLSV_Log.ldf',
	SIZE=6MB,
	MAXSIZE=8MB,
	FILEGROWTH=1MB
)
 use QLSV
--
CREATE TABLE KETQUA
(
MASV CHAR(3) NOT NULL,
MAMH CHAR(2) NOT NULL,
LANTHI TINYINT NOT NULL,
DIEM DECIMAL (20)
)
GO
CREATE TABLE  DMKHOA
(
	MAKHOA CHAR(2) NOT NULL ,
	TENKHOA NVARCHAR(20) 
)
GO
CREATE TABLE DMMH 
(
	MAMH CHAR (2) NOT NULL,
	TENMH NVARCHAR (30) NOT NULL,
	SOTIET TINYINT 
)
GO
CREATE TABLE DMSV
(
MASV CHAR(3) NOT NULL,
HOSV NVARCHAR(30) ,
TENSV NVARCHAR (10) NOT NULL,
PHAI BIT NOT NULL ,
NGAYSINH DATETIME,
NOISINH NVARCHAR (25) ,
MAKH  CHAR (2) ,
HOCBONG FLOAT 
)
--TAO KHÓA CHÍNH
ALTER TABLE KETQUA ADD CONSTRAINT PKEY_KETQUA PRIMARY KEY (MASV,MAMH,LANTHI)
ALTER TABLE DMMH ADD CONSTRAINT PKEY_DMMH PRIMARY KEY (MAMH)
ALTER TABLE KDMSV ADD CONSTRAINT PKEY_DMSV PRIMARY KEY (MASV)
ALTER TABLE DMKHOA ADD CONSTRAINT PKEY_DMKHOA PRIMARY KEY (MAKHOA)

--TAO KHOA NGOAI 
ALTER TABLE KETQUA ADD CONSTRAINT FK_DMMHKQ FOREIGN KEY (MAMH) REFERENCES DMMH(MAMH)
ALTER TABLE KETQUA ADD CONSTRAINT FK_DMSVKQ FOREIGN KEY (MASV) REFERENCES DMSV(MASV)
ALTER TABLE DMSV ADD CONSTRAINT FK_DMKHOASV FOREIGN KEY (MAKHOA) REFERENCES DMKHOA(MAKHOA)
-- NHAP DU LIEU
go
SET DATEFORMAT MDY
	go
	-- BANG DMMH
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'01', N'CƠ SỞ DỮ LIỆU',N'45')
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'02', N'TRÍ TUỆ NHÂN TẠO',N'45')
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'03', N'TRUYEN TIN',N'45')
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'04', N'ĐỒ HỌA',N'60')
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'05', N'VĂN PHẠM',N'60')
INSERT INTO DMMH (MAMH,TENMH,SOTIET) VALUES (N'06', N'KỸ THUẬT LẬP TRÌNH',N'45')
SELECT *
FROM DMMH
	-- BANG DMSV
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'A01', N'NGUYỄN THI', 'HAI', '1', N'2/23/1993',N'HANOI' ,N'TH',N'13000')
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'A02', N'TRẦN VĂN ', 'CHÍNH ', '0', N'12/24/1992',N'BÌNH ĐỊNH ' ,N'VL',N'15000')
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'A03', N'LÊ THU BẠCH  ', 'YẾN ', '1', N'2/21/1993',N'TP HCM' ,N'TH',N'17000')
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'A04', N'TRẦN ANH ', 'TUẤN', '0', N'12/20/1994',N'HANOI' ,N'TH','AV','80000')
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'B01', N'TRẦN THANH ', 'MAI', '1', N'08/12/1993',N'HAI PHÒNG' ,N'TR',N'0')
INSERT INTO DMSV(MASV, HOSV, TENSV, PHAI, NGAYSINH, NOISINH, MAKH , HOCBONG)
	   VALUES (N'B01', N'TRẦN THỊ THU', 'THỦY', '1', N'01/02/1994',N'TP HCM' ,N'AV',N'0')
SELECT *FROM DMSV
	-- BANG DMKHOA
INSERT INTO DMKHOA(MAKHOA, TENKHOA)VALUES (N'AV', N'ANH VĂN')
INSERT INTO DMKHOA(MAKHOA, TENKHOA)VALUES (N'TH', N'TIN HOC')
INSERT INTO DMKHOA(MAKHOA, TENKHOA)VALUES (N'TR', N'TRIÉT')
INSERT INTO DMKHOA(MAKHOA, TENKHOA)VALUES (N'VL', N'VẠT LÝ')

SELECT *FROM DMKHOA
	-- BANG KET QUA
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)
		VALUES (N'A01', N'01', N'1', '3')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A01', N'01', N'1', '3')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A01', N'01', N'2', '6')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A01', N'02', N'2', '6')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A01', N'03', N'1', '5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A02', N'01', N'1', '4.5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A02', N'01', N'2', '7')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A02', N'03', N'1', '10')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A02', N'05', N'1', '9')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A03', N'01', N'1', '2')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A03', N'01', N'2', '5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A03', N'03', N'1', '2.5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A03', N'03', N'2', '4')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'A04', N'05', N'2', '10')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'B01', N'01', N'1', '7')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'B01', N'03', N'1', '2.5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'B01', N'03', N'2', '5')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'B02', N'02', N'1', '6')
INSERT INTO  KETQUA(MASV, MAMH, LANTHI, DIEM)VALUES (N'B02', N'04', N'1', '10')

SELECT *FROM KETQUA


