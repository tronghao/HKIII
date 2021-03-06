create database QuanLy_NhanVien
go
use QuanLy_NhanVien
go

--Unique: duy nhất -> trong toàn bộ bảng. Trường nào có từ khóa Unique thì không có 2 giá trị trùng nhau
--NOT NULL: Trường đó không được phép null
--Default:  Giá trị mặc định của trường đó nếu không gán giá trị khi insert.



--Điều kiện tạo khóa ngoại:
--Tham Chiếu tới khóa chính
--Unique, not null
--Cùng kiểu dữ liệu
--Cùng số lượng trường có sắp xếp

--Lợi ích:
--Đảm bảo tính toàn vẹn dữ liệu. Không có trường hợp tham chiếu tới dữ liệu không tồn tại.

create table PHONGBAN
(
	MaPhong INT NOT NULL Unique,
	TenPhong NVARCHAR(30),
	TruongPhong CHAR(9),
	NgayNhanChuc DATETIME,
	CONSTRAINT PK_PHONGBAN PRIMARY KEY (MaPhong),
)
GO

create table NHANVIEN
(
	MaNV CHAR(9) NOT NULL Unique,
	HoNV NVARCHAR(10),
	TenLotNV NVARCHAR(20),
	TenNV NVARCHAR(10),
	NgaySinh DATETIME,
	Phai NCHAR(3),
	DiaChi NVARCHAR(50),
	HSLuong DECIMAL(3,2),
	MaNQL CHAR(9),
	MaPhong INT,
	CONSTRAINT PK_NHANVIEN PRIMARY KEY (MaNV),
	CONSTRAINT FK_NHANVIEN FOREIGN KEY(MaPhong) REFERENCES PHONGBAN(MaPhong)
)
GO


create table DIADIEMPHONG
(
	MaPhong INT NOT NULL,
	DiaDiem NVARCHAR(50) NOT NULL,
	CONSTRAINT PK_DIADIEMPHONG PRIMARY KEY (MaPhong, DiaDiem)
)
GO

create table DEAN
(
	MaDA INT NOT NULL Unique,
	TenDA NVARCHAR(50),
	DiaDiemDA NVARCHAR(50),
	MaPhong INT,
	CONSTRAINT PK_DEAN PRIMARY KEY (MaDA),
	CONSTRAINT FK_DEAN FOREIGN KEY(MaPhong) REFERENCES PHONGBAN(MaPhong)
)
GO
--ALTER TABLE DEAN ALTER COLUMN DiaDiemDA NVARCHAR(50)
create table PHANCONG
(
	MaNV CHAR(9) NOT NULL,
	MaDA INT NOT NULL,
	ThoiGian DECIMAL(3,1),
	CONSTRAINT PK_PHANCONG PRIMARY KEY (MaNV,MaDA)
)
GO
--ALTER TABLE PHANCONG ALTER COLUMN ThoiGian DECIMAL(3,1)




------------------------------------------------------------------	
--Thêm bảng PHONGBAN--
insert into PHONGBAN  values (1, N'Nghiên cứu', '888665555', '') 
insert into PHONGBAN  values (2, N'Quản lý', '999887777', '') 
insert into PHONGBAN  values (3, N'Kỹ Thuật', '987987988', '') 
insert into PHONGBAN  values (4, N'Tài Vụ', '888665555', '') 
insert into PHONGBAN  values (5, N'Hành Chính', '888665555', '') 

select *
from PHONGBAN


--Thêm Bảng NHANVIEN--
insert into NHANVIEN values ('333445555', N'Nguyễn', N'Thanh', N'Tùng', '19651208', N'Nam', N'Trà Vinh', 4.00, null, 5)
insert into NHANVIEN values ('987987988', N'Nguyễn', N'Mạnh', N'Hùng', '19620915', N'Nam', N'Vĩnh Long', 4.33, '333445555', 5)
insert into NHANVIEN values ('453453455', N'Trần', N'Thanh', N'Tâm', '19720731', N'Nữ', N'Vĩnh Long', 3.99, '333445555', 5)
insert into NHANVIEN values ('999887777', N'Bùi', N'Ngọc', N'Hằng', '19870719', N'Nữ', N'Cần Thơ', 2.68, '987654322', 4)
insert into NHANVIEN values ('987654322', N'Lê', N'Quỳnh', N'Như', '19710720', N'Nữ', N'Trà Vinh', 3.33, null, 4)
insert into NHANVIEN values ('123456789', N'Trần', N'Thị', N'Hương', '19751110', N'Nữ', N'Cần Thơ', 3.99, '888665555', 4)
insert into NHANVIEN values ('987987987', N'Trần', N'Hồng', N'Quang', '19790408', N'Nam', N'Trà Vinh', 3.66, '987654322', 1)
insert into NHANVIEN values ('888665555', N'Phạm', N'Văn', N'Vinh', '19851110', N'Nam', N'TP Hồ Chí Minh', 2.67, '999887777', 2)


select *
from NHANVIEN

--Thêm Bảng DIADIEMPHONG--
insert into DIADIEMPHONG values (1, N'123, Trần Bình Trọng, Phường 4, TP Trà Vinh')
insert into DIADIEMPHONG values (2, N'145, Đinh Tiên Hoàng, Phường 2, TP Trà Vinh')
insert into DIADIEMPHONG values (3, N'120, Đinh Tiên Hoàng, Phường 2, TP Trà Vinh')
insert into DIADIEMPHONG values (4, N'123, Trần Bình Trọng, Phường 4, TP Trà Vinh')
insert into DIADIEMPHONG values (5, N'123, Trần Bình Trọng, Phường 4, TP Trà Vinh')

select *
from DIADIEMPHONG

--Thêm bảng DEAN
insert into DEAN values(1, N'Sản xuất rượu quách', N'Mỹ Chánh - Châu Thành', 3)
insert into DEAN values(2, N'Cấp thoát nước huyện', N'Khóm 8 TT Càng Long', 2)
insert into DEAN values(3, N'Xây bờ kè Long Bình', N'Khóm 4 Phường 5 TP TV', 3)
insert into DEAN values(5, N'Xây dựng TT khuyến nông', N'TT Trà Cú', 3)
insert into DEAN values(10, N'Trạm phân phối tôm Giống', N'TT Cầu Ngang', 5)
insert into DEAN values(15, N'Xây dựng khu nhà CNTT', N'126 Đường tránh QL 53, TP TV', 3)
insert into DEAN values(20, N'Khu công nghiệp Long Đức', N'Long Đức TP TV', 4)


select *
from DEAN

--Thêm Bảng PHANCONG
insert into PHANCONG values('123456789',1,32.5)
insert into PHANCONG values('123456789',2,7.5)
insert into PHANCONG values('333445555',2,40.0)
insert into PHANCONG values('333445555',3,40.0)
insert into PHANCONG values('333445555',10,20.0)
insert into PHANCONG values('888665555',20,20.0)
insert into PHANCONG values('987987988',20,30.0)
insert into PHANCONG values('987987988',15,50.0)
insert into PHANCONG values('987654322',15,20.0)

select *
from PHANCONG




------------------------------------------------------------------	
--3.1 Cho biết MANV và TENNV làm việc ở phòng 'Nghiên cứu'
select nv.MaNV, nv.TenNV
from NHANVIEN as nv, PHONGBAN as p
where nv.MaPhong=p.MaPhong
	and p.TenPhong=N'Nghiên cứu'



------------------------------------------------------------------	
--3.2 Với những đề án ở 'TP TV', cho biết mã đề án, mã phòng ban chủ trì đề án
select da.MaDA, da.MaPhong
from DEAN as da
where da.DiaDiemDA like '%TP TV'




------------------------------------------------------------------	
--3.3 Tìm  họ tên của nhân viên phòng số 5 có tham gia vào đề án "sản xuất rượu quách" với số giờ làm việc trên 10 giờ.
	--Kiểm Tra--
select *
from NHANVIEN

	--nhân viên ở phòng số 5--
select *
from NHANVIEN as nv
where nv.MaPhong=5

	--nhung nhan vien tham de an "sản xuất rượu quách" va thoi gian lớn hơn 10--
select *
from PHANCONG as pc, DEAN as da
where pc.MaDA=da.MaDA
	and da.TenDA=N'Sản xuất rượu quách'
	and pc.ThoiGian > 10
	
	--hoàn chỉnh--
select (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as TenNV
from NHANVIEN as nv
where nv.MaPhong=5
	and nv.MaNV in
	(
		select pc.MaNV
		from PHANCONG as pc, DEAN as da
		where pc.MaDA=da.MaDA
			and da.TenDA=N'Sản xuất rượu quách'
			and pc.ThoiGian > 10
	)
	
	
	
	
------------------------------------------------------------------	
--3.4 Tìm họ tên của từng nhân viên và người phụ trách trực tiếp nhân viên đó

	--Kiểm Tra--
select *
from NHANVIEN as nv

	--hoàn chỉnh--
select (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV)as Ho_Ten_NV, (nv1.HoNV+' '+nv1.TenLotNV+' '+nv1.TenNV)as Ho_Ten_NQL
from NHANVIEN as nv, NHANVIEN as nv1
where nv.MaNQL=nv1.MaNV




------------------------------------------------------------------	
--3.6 Cho biết các mã đề án có:
--Nhân viên với họ là Nguyen tham gia hoặc,
--trưởng phòng chủ trì đề án đó với họ là Nguyen

	--Nhân Viên có họ Nguyen--
select *
from NHANVIEN as nv
where nv.HoNV=N'Nguyễn'

	--Trưởng phòng có họ Nguyen--
select *
from DEAN as da, PHONGBAN as p, NHANVIEN as nv
where da.MaPhong=p.MaPhong
	and p.TruongPhong=nv.MaNV
	and nv.HoNV =N'Nguyễn'
	
	--Những mã đề án mà nhân viên có họ Nguyễn  tham gia 
select *
from PHANCONG as pc, NHANVIEN as nv
where pc.MaNV=nv.MaNV
	and nv.HoNV=N'Nguyễn'	
	
	
	--Những trưởng phòng có chủ trì đề án
select *
from DEAN as da, PHONGBAN as p, NHANVIEN as nv
where da.MaPhong=p.MaPhong
	and p.TruongPhong=nv.MaNV
	and nv.HoNV =N'Nguyễn'
	and da.MaDA in
	(
		select distinct pc.MaDA
		from PHANCONG as pc
	)
	
	--Hoàn Chỉnh--
select pc.MaDA
from PHANCONG as pc, NHANVIEN as nv
where pc.MaNV=nv.MaNV
	and nv.HoNV=N'Nguyễn'
union
select da.MaDA
from DEAN as da, PHONGBAN as p, NHANVIEN as nv
where da.MaPhong=p.MaPhong
	and p.TruongPhong=nv.MaNV
	and nv.HoNV =N'Nguyễn'
	and da.MaDA in
	(
		select distinct pc.MaDA
		from PHANCONG as pc
	)





------------------------------------------------------------------			
--3.7 Cho biết họ tên các nhân viên đã đến tuổi về hưu(nam 60 tuổi, nữ 55 tuổi)
	--Nhân Viên Nam đến tuổi về hưu--
select *
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 60
	and nv.Phai='Nam'
	
		--Nhân Viên Nữ đến tuổi về hưu--
select *
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 55
	and nv.Phai=N'Nữ'
	
	--Hoàn Chỉnh--
select (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 60
	and nv.Phai='Nam'
union
select (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 55
	and nv.Phai=N'Nữ'
	
	
	
	
	
	--Cach 2--
--Nhân Viên Nam đến tuổi về hưu--
CREATE VIEW NamVH as
select *
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 60
	and nv.Phai='Nam'
	
		--Nhân Viên Nữ đến tuổi về hưu--
CREATE VIEW NuVH as
select *
from NHANVIEN as nv
where YEAR(GETDATE()) - YEAR(nv.NgaySinh) >= 55
	and nv.Phai=N'Nữ'
	
	--Hoàn Chỉnh--
select (NamVH.HoNV+' '+NamVH.TenLotNV+' '+NamVH.TenNV) as Ho_Ten_NV
from NamVH
union
select (NuVH.HoNV+' '+NuVH.TenLotNV+' '+NuVH.TenNV) as Ho_Ten_NV
from NuVH
	
	
	
------------------------------------------------------------------	
--3.8 Tìm những phòng ban có lương trung bình cao nhất. Với (Luong=HSLuong*1.390.000)

	--Tên Phòng và số lương trung bình--
select p.TenPhong, AVG(nv.HSLuong*1390000)
from NHANVIEN as nv, PHONGBAN as p
where nv.MaPhong=p.MaPhong
group by p.TenPhong

	--Hoàn Chỉnh--
select TB.TenPhong
from
(
		select p.TenPhong, AVG(nv.HSLuong*1390000) as TB
		from NHANVIEN as nv, PHONGBAN as p
		where nv.MaPhong=p.MaPhong
		group by p.TenPhong
) as TB
where TB.TB = 
(
	select MAX(TB.TB)
	from
	(
			select p.TenPhong, AVG(nv.HSLuong*1390000) as TB
			from NHANVIEN as nv, PHONGBAN as p
			where nv.MaPhong=p.MaPhong
			group by p.TenPhong
	) as TB
)




------------------------------------------------------------------	
--3.13 Tìm tên các nhân viên được phân công tham gia nhiều đề án nhất
	--Kiểm Tra--
select *
from PHANCONG

	--Gom Nhóm theo MaNV, MaDEAN--
select pc.MaNV, pc.MaDA
from PHANCONG as pc
group by pc.MaNV, pc.MaDA

	--Dem so luong dòng là số đề án--
select SLDA.MaNV, COUNT(*)
from
	(
		select pc.MaNV, pc.MaDA
		from PHANCONG as pc
		group by pc.MaNV, pc.MaDA
	)as SLDA
group by SLDA.MaNV

	--Hoàn Chỉnh--
select nv.TenNV
from
	(
		select SLDA.MaNV, COUNT(*) as SL
		from
			(
				select pc.MaNV, pc.MaDA
				from PHANCONG as pc
				group by pc.MaNV, pc.MaDA
			)as SLDA
		group by SLDA.MaNV
	)KQ, NHANVIEN as nv
where KQ.MaNV=nv.MaNV
	and KQ.SL =
	(
		select MAX(KQ.SL)
		from 
		(
			select SLDA.MaNV, COUNT(*) as SL
			from
				(
					select pc.MaNV, pc.MaDA
					from PHANCONG as pc
					group by pc.MaNV, pc.MaDA
				)as SLDA
			group by SLDA.MaNV
		)KQ
	)
	
	
	
	
------------------------------------------------------------------	
--3.14 Tìm tổng lương, lương cao nhất, lương thấp nhất và lương trung bình của các nhân viên.
--Với(Lương = HSLuong *1.390.000)
	--Kiểm Tra--
select *
from NHANVIEN

	--Tổng Lương--
select SUM(nv.HSLuong*1390000) as TongL
from NHANVIEN as nv

	--Lương tung nhan vien--
select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
from NHANVIEN as nv
group by nv.MaNV
	
	--Luong thap nhất--
select *
from
(
	select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
	from NHANVIEN as nv
	group by nv.MaNV
)as KQ1
where KQ1.L =
	(
		select MIN(KQ1.L)
		from
		(
			select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
			from NHANVIEN as nv
			group by nv.MaNV
		)as KQ1
	)
	
	--Luong cao nhất--
select *
from
(
	select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
	from NHANVIEN as nv
	group by nv.MaNV
)as KQ1
where KQ1.L =
	(
		select MAX(KQ1.L)
		from
		(
			select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
			from NHANVIEN as nv
			group by nv.MaNV
		)as KQ1
	)
	
	--Trung Bình Lương--
select AVG(nv.HSLuong*1390000) as TBL
from NHANVIEN as nv

	--Hoàn Chỉnh--
select TL.TongL as 'Tổng Lương', LTN.L as 'Lương Thấp Nhất', LCN.L as 'Lương Cao Nhất', TBL.TBL as 'Trung Bình Lương'
from
	(
		select SUM(nv.HSLuong*1390000) as TongL
		from NHANVIEN as nv	
	) as TL,
	(
		select KQ1.L
		from
		(
			select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
			from NHANVIEN as nv
			group by nv.MaNV
		)as KQ1
		where KQ1.L =
			(
				select MIN(KQ1.L)
				from
				(
					select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
					from NHANVIEN as nv
					group by nv.MaNV
				)as KQ1
			)
	)as LTN,
	(
		select KQ1.L
		from
		(
			select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
			from NHANVIEN as nv
			group by nv.MaNV
		)as KQ1
		where KQ1.L =
			(
				select MAX(KQ1.L)
				from
				(
					select nv.MaNV, SUM(nv.HSLuong * 1390000) as L
					from NHANVIEN as nv
					group by nv.MaNV
				)as KQ1
			)
	)as LCN,
	(
		select AVG(nv.HSLuong*1390000) as TBL
		from NHANVIEN as nv	
	) as TBL




------------------------------------------------------------------	
--3.15 Cho biết số lượng nhân viên của phòng 'Nghiên cứu'
select COUNT(*) as 'Số Lượng Nhân Viên'
from NHANVIEN as nv, PHONGBAN as p
where nv.MaPhong=p.MaPhong
	and p.TenPhong=N'Nghiên cứu'
	
	
	
	
------------------------------------------------------------------	
--3.16 Cho biết số lượng nhân viên của từng phòng ban

	--phòng có nhân viên--
select p.TenPhong, count(*) as SLNV
from NHANVIEN as nv, PHONGBAN as p
where nv.MaPhong=p.MaPhong
group by p.TenPhong

	--Phòng không có nhân viên--
select p.TenPhong, 0 as SLNV
from PHONGBAN as p
where p.TenPhong not in
(
		select distinct p.TenPhong
		from NHANVIEN as nv, PHONGBAN as p
		where nv.MaPhong=p.MaPhong
		group by p.TenPhong
)

	--Hoàn chỉnh--
select p.TenPhong, count(*) as SLNV
from NHANVIEN as nv, PHONGBAN as p
where nv.MaPhong=p.MaPhong
group by p.TenPhong

union

select p.TenPhong, 0 as SLNV
from PHONGBAN as p
where p.TenPhong not in
(
		select distinct p.TenPhong
		from NHANVIEN as nv, PHONGBAN as p
		where nv.MaPhong=p.MaPhong
		group by p.TenPhong
)




------------------------------------------------------------------	
--3.17 Với mỗi nhân viên cho biết mã số, họ tên, số lượng đề án và tổng time mà họ tham gia

	--Những nhân viên có tham gia đề án--
select pc.MaNV, COUNT(*) as SLDA, SUM(pc.ThoiGian) as TG
from PHANCONG as pc
group by pc.MaNV

	--Tạm Hoàn Chỉnh--
select nv.MaNV, (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV, KQ1.SLDA, KQ1.TG as Tong_Thoi_Gian
from
	(
		select pc.MaNV, COUNT(*) as SLDA, SUM(pc.ThoiGian) as TG
		from PHANCONG as pc
		group by pc.MaNV
	) as KQ1, NHANVIEN as nv
where KQ1.MaNV=nv.MaNV

	--Những nhân viên không tham gia--
select nv.MaNV, (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV, 0 as SLDA, 0 as Tong_Thoi_Gian
from NHANVIEN as nv
where nv.MaNV not in
	(
		select pc.MaNV
		from PHANCONG as pc
		group by pc.MaNV	
	)

	--Hoàn Chỉnh---
select nv.MaNV, (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV, KQ1.SLDA, KQ1.TG as Tong_Thoi_Gian
from
	(
		select pc.MaNV, COUNT(*) as SLDA, SUM(pc.ThoiGian) as TG
		from PHANCONG as pc
		group by pc.MaNV
	) as KQ1, NHANVIEN as nv
where KQ1.MaNV=nv.MaNV

union

select nv.MaNV, (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV, 0 as SLDA, 0 as Tong_Thoi_Gian
from NHANVIEN as nv
where nv.MaNV not in
	(
		select pc.MaNV
		from PHANCONG as pc
		group by pc.MaNV	
	)



------------------------------------------------------------------	
--3.18. Cho biết những nhân viên tham gia từ 2 đề án trở lên

	--Gom nhóm nhân viên va co 2 de an tro len--
select pc.MaNV, COUNT(*) as SLDA
from PHANCONG as pc
group by pc.MaNV
having COUNT(*) >=2

	--Hoàn chỉnh--
select (nv.HoNV+' '+nv.TenLotNV+' '+nv.TenNV) as Ho_Ten_NV
from NHANVIEN as nv,
	(
		select pc.MaNV, COUNT(*) as SLDA
		from PHANCONG as pc
		group by pc.MaNV
		having COUNT(*) >=2	
	) as KQ
where nv.MaNV=KQ.MaNV
