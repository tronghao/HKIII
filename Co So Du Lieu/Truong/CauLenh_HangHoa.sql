create database HANG_HOA
USE Hang_hoa

--create database TenSV_MaSV
--use TenSV_MaSV

------ tạo table HANGHOA

CREATE TABLE HANGHOA 
(
	MA_HANG nvarchar(4)NOT NULL PRIMARY KEY,
	TEN_HANG nvarchar (50), 
	DON_VI_TINH nvarchar(15)
);

------ tạo table DAILY

CREATE TABLE DAILY
(
	MA_DL nchar(4)NOT NULL PRIMARY KEY,
	TEN_DL nvarchar(40), 
	DCHI_DL nvarchar (50)
 );
 ------- tạo table MUA
 CREATE TABLE MUA
 (
	 MA_HANG nvarchar(4) NOT NULL, 
	 MA_DL nchar (4), 
	 NGAY_MUA nvarchar(10),
	 SOLUONG_MUA Int, 
	 TRIGIA_MUA Float
	 CONSTRAINT KHOACHINHMUA PRIMARY KEY (MA_HANG,MA_DL,NGAY_MUA)
	 
);

 ------- tạo table BAN
 CREATE TABLE BAN
 (
	 MA_HANG nvarchar(4) NOT NULL, 
	 MA_DL nchar (4), 
	 NGAY_BAN nvarchar(10),
	 SOLUONG_BAN Int, 
	 TRIGIA_BAN Float
	 CONSTRAINT KHOACHINHBAN PRIMARY KEY (MA_HANG,MA_DL,NGAY_ban)
	 
);


-- Các lệnh nhập dữ liệu
 -- Nhập dữ liệu cho bảng HANGHOA
 insert into HANGHOA values (N'b001', N'Nước uống đóng chai Lavie',N'Thùng') 
 insert into HANGHOA values (N'b002', N'Nước suôi Vĩnh Hòa',N'Thùng') 
 insert into HANGHOA values (N'b003', N'Nước uống đóng chai Tra Vi',N'Thùng')  
 ---------
 insert into HANGHOA values (N'c001', N'Nescafe',N'Hộp')  
 insert into HANGHOA values (N'c002', N'Cafe G7',N'Hộp') 
 insert into HANGHOA values (N'c003', N'Vinacafe',N'Hộp') 
 ---------
 insert into HANGHOA values (N'd001', N'Coca Cola',N'Thùng')  
 insert into HANGHOA values (N'd002', N'Pesi',N'Thùng') 
 insert into HANGHOA values (N'd003', N'7 Up',N'Thùng')  
 ---------
 insert into HANGHOA values (N'm001', N'Mì Hảo Hảo',N'Thùng')  
 insert into HANGHOA values (N'm002', N'Mì Tiến vua',N'Thùng') 
 insert into HANGHOA values (N'm003', N'Mì Đệ Nhất',N'Thùng') 
  ---------
 insert into HANGHOA values (N's001', N'Sửa hộp Ông Thọ',N'Hộp')  
 insert into HANGHOA values (N's002', N'Sửa hộp Cô Gái Hà Lan ',N'Hộp')   
 insert into HANGHOA values (N's003', N'Sửa hộp Ngôi sao Phương Nam',N'Hộp')  
 
 -- Xem dữ liệu bảng Hang hóa
 
 select * 
 from HANGHOA
 
 -- Nhập dữ liệu cho bảng DAILY
  insert into DAILY values (N'a001', N'Trung Tính', Null)
  insert into DAILY values (N'a002', N'Tiến Đạt', Null)
  insert into DAILY values (N'a003', N'Phát Đạt',Null)
  
 -- Xem dữ liệu bảng Đại lý
 Select *
 From DAILY
 
 -- Nhập dữ liệu cho bảng MUA
   
  insert into MUA  values (N'c001', N'a003','12/12/2012',2,50) 
  insert into MUA  values (N'c002', N'a003','10/12/2012',4,100) 
  ------
  insert into MUA  values (N'd001', N'a001','13/12/2012',5,200) 
  insert into MUA  values (N'd001', N'a002','15/12/2012',20,800) 
  --------
  insert into MUA  values (N'd002', N'a001','15/12/2012',20,300) 
  insert into MUA  values (N's002', N'a002','20/12/2012',30,300) 
  --- 
  insert into MUA  values (N's002', N'a002','22/12/2012',10,100) 
  
 Select *
 From mua 
   
 -- Nhập dữ liệu cho bảng BAN
 
  insert into BAN   values (N'b001', N'a002','12/12/2012',3,200) 
  insert into BAN  values (N'b001', N'a003','11/12/2012',5,300) 
  --update BAN set TRIGIA_BAN = 300 where MA_HANG=N'b001' and MA_DL= N'a003' and NGAY_BAN='11/12/2012'
  
  ------
  insert into BAN  values (N'b001', N'a003','14/12/2012',2,100) 
  insert into BAN  values (N'c003', N'a003','16/12/2012',4,300) 
  --------
  insert into BAN  values (N'd001', N'a001','18/12/2012',4,200) 
  insert into BAN values (N'd001', N'a002','25/12/2012',5,100) 
  --- 
  insert into BAN  values (N'd002', N'a001','20/12/2012',20,300) 
  insert into BAN  values (N'd003', N'a002','15/12/2012',5,250) 
  
 Select *
 From BAN 
 
 
 
 
 
 -- MINE
 
 
DELETE FROM BAN WHERE MA_HANG='d001'


UPDATE DAILY SET DCHI_DL = N'123, Trần Bình Trọng, TP Trà Vinh' WHERE MA_DL = 'a001'
UPDATE DAILY SET DCHI_DL = N'145, Trần Hưng Đạo, TP Trà Vinh' WHERE MA_DL = 'a002'
UPDATE DAILY SET DCHI_DL = N'012m, K4, P5, Đinh Tiên Hoàng, TP Trà Vinh' WHERE MA_DL = 'a003'

 Select *
 From DAILY 
 
 -- Hiển THị Tên Và Địa chí có mã a002 or a003
  Select TEN_DL,DCHI_DL
 From DAILY 
 where MA_DL='a002' OR MA_DL='a003'


 Select *
 From MUA
 --Hiển thị ngày mua, số lượng mua và trị giá mua của ngày '10/10/2012'
 Select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 From MUA 
 where NGAY_MUA='10/10/2012'
 
 --HIỂN THỊ NGÀY MUA, SỐ LƯỢNG MUA VÀ GIÁ TRỊ MUA CỦA ĐẠI LÝ 'Tiến Đạt'
 select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 from DAILY, MUA
 where TEN_DL=N'Tiến Đạt' AND MUA.MA_DL=DAILY.MA_DL
 
 --HIỂN THỊ NGÀY MUA, SỐ LƯỢNG MUA VÀ GIÁ TRỊ MUA CỦA ĐẠI LÝ 'Tiến Đạt' VÀ NGÀY MUA "12/12/2012"
 select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 from DAILY, MUA
 where TEN_DL=N'Tiến Đạt' AND MUA.MA_DL=DAILY.MA_DL AND NGAY_MUA='12/12/2012'
 
 select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 from DAILY, MUA
 where TEN_DL=N'Tiến Đạt' AND MUA.MA_DL=DAILY.MA_DL AND NGAY_MUA='15/12/2012'
 
 select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 from DAILY, MUA
 where TEN_DL=N'Tiến Đạt' AND MUA.MA_DL=DAILY.MA_DL AND NGAY_MUA='20/12/2012'
 
 select NGAY_MUA, SOLUONG_MUA, TRIGIA_MUA
 from DAILY, MUA
 where TEN_DL=N'Tiến Đạt' AND MUA.MA_DL=DAILY.MA_DL AND NGAY_MUA='22/12/2012'
 
 
 --Hiển thị số lượng bán, trị giá bán các mặt hàng có tên là 'Pesi' or 'Coca Cola'
 
 select SOLUONG_BAN, TRIGIA_BAN
 from BAN, HANGHOA
 where BAN.MA_HANG=HANGHOA.MA_HANG AND ( TEN_HANG='Pesi' OR TEN_HANG='Coca Cola' )
 
 select * from BAN
  select * from HANGHOA
  
  
  USE Hang_hoa
  GO
  
  -- 1. Hiển thị số lượng bán theo thứ tự tăng dần và trị giá bán
  
  SELECT SOLUONG_BAN, TRIGIA_BAN
  FROM BAN
  ORDER BY SOLUONG_BAN ASC
  
   -- 2. Hiển thị số lượng bán theo thứ tự tăng dần và trị giá bán theo thứ tự giảm dần
  
  SELECT SOLUONG_BAN, TRIGIA_BAN
  FROM BAN
  ORDER BY SOLUONG_BAN ASC, TRIGIA_BAN DESC