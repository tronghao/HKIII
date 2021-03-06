CREATE DATABASE QUANLY_CONGTRINH
GO
USE QUANLY_CONGTRINH
GO

--a.Tìm tổng kinh phí của tất cả các công trình theo từng chủ thầu
select TEN_THAU, SUM(KINH_PHI) as 'Tổng Kinh Phí'
from CGTRINH
group by TEN_THAU

--b. Cho biết họ tên các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
select HOTEN_KTS, SUM(THU_LAO) as 'Tổng Thù Lao'
from THIETKE
group by HOTEN_KTS
having SUM(THU_LAO)>25

--c. Cho biết số lượng các kiến trúc sư có tổng thù lao thiết kế các công trình lớn hơn 25 triệu
select COUNT(*) as 'Số Lượng Kiến Trúc Sư'
from (
		select HOTEN_KTS, SUM(THU_LAO) as 'Tổng Thù Lao'
		from THIETKE
		group by HOTEN_KTS
		having SUM(THU_LAO)>25
	 )as KTS
	 --cach2 : Tạo bảng mới
	 select HOTEN_KTS, SUM(THU_LAO) as TongTL into CAU3C
	 from THIETKE
	 group by HOTEN_KTS
	 having SUM(THU_LAO)>25
	 
	 select COUNT(*) as 'Số Lượng Kiến Trúc Sư' from CAU3C

--d.Tìm tổng số công nhân đã tham gia của mỗi công trình
select cgt.TEN_CTR as 'Tên Công Trình', TGCT.SL as 'Số Lượng CN'
from (
		select tg.STT_CTR, COUNT(*) as SL
		from THAMGIA as tg
		group by tg.STT_CTR
	)as TGCT, CGTRINH as cgt
where tgct.STT_CTR=cgt.STT_CTR

--e.Tìm tên và địa chỉ công trình có tổng số công nhân tham gia nhiều nhất
select cgt.TEN_CTR, cgt.DIACHI_CTR
from CGTRINH as cgt,
	(
		select tg.STT_CTR, COUNT(*) as SL
		from THAMGIA as tg
		group by tg.STT_CTR
	) as TSCN
where cgt.STT_CTR=TSCN.STT_CTR
	and TSCN.SL =
		(
			select MAX(TSCN.SL)
			from (
				select tg.STT_CTR, COUNT(*) as SL
				from THAMGIA as tg
				group by tg.STT_CTR
			) as TSCN
		)
		
--f. Cho biết tên các thành phố và kinh phí trung bình
--cho mỗi công trình của từng thành phố tương ứng
select cgt.TINH_THANH, AVG(cgt.KINH_PHI) as 'Kinh Phí Trung Bình'
from CGTRINH as cgt
group by cgt.TINH_THANH

--f2. Cho biết tên các công nhân có tổng số ngày tham gia vào các công trình
--lớn hơn tổng số ngày tham gia của công nhân Nguyễn Hồng Văn
select cn.HOTEN_CN
from 
	(
		select tg.HOTEN_CN, SUM(tg.SO_NGAY) as SN
		from THAMGIA as tg
		group by tg.HOTEN_CN
	) as SNTG, CONGNHAN as cn
where SNTG.HOTEN_CN=cn.HOTEN_CN
	and SNTG.SN >
	(
		select SUM(tg.SO_NGAY)
		from THAMGIA as tg, CONGNHAN as cn
		where tg.HOTEN_CN=cn.HOTEN_CN
			and cn.HOTEN_CN='nguyen hong van'
	)

	
--g. Cho biết tổng số công trình mà mỗi chủ thầu đã thi công tại mỗi thành phố
select TEN_THAU, TINH_THANH, COUNT(STT_CTR)as 'Tổng Số Công Trình'
from CGTRINH
group by TEN_THAU, TINH_THANH


--h. Cho biết họ tên công nhân có tham gia tất cả các công trình
select TGCT.HOTEN_CN
from
	(
		select tg.HOTEN_CN, COUNT(*) as SCT
		from THAMGIA as tg
		group by tg.HOTEN_CN
	) as TGCT
where TGCT.SCT = 
	(
		select COUNT(*)
		from CGTRINH
	)