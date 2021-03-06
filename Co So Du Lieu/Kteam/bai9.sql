use HowKteam
go

--Xuất ra thông tin giáo viên và giáo viên quản lý chủ nhiệm của người đó
select gv1.*
from GIAOVIEN AS gv1, GIAOVIEN AS gv2
where gv1.GVQLCM=gv2.MAGV



--Xuất ra số lượng giáo viên của khoa CNTT
select COUNT(*) as 'Số Lượng'
from GIAOVIEN, KHOA, BOMON
where GIAOVIEN.MABM=BOMON.MABM 
and BOMON.MAKHOA=KHOA.MAKHOA 
and KHOA.MAKHOA='CNTT'



--Xuất ra thông tin giáo viên và đề tài người đó tham gia khi mà kết quả là đạt
select GIAOVIEN.*, TENDT
from GIAOVIEN, (select GVCNDT,MADT,TENDT from DETAI) as DT, (select MADT, KETQUA from THAMGIADT) as TG
where GIAOVIEN.MAGV=DT.GVCNDT and DT.MADT=TG.MADT and TG.KETQUA=N'Đạt'