CREATE DATABASE QUANLY_CONGTRINH
GO
USE QUANLY_CONGTRINH
GO

--a. Cho biết họ tên các kiến trúc sư vừa thiết kế các công trình
--do Phòng Dịch vụ Sở Xây dựng thi công, 
--vừa thiết kế các công trình do chủ thầu Lê Văn Sơn thi công
select distinct tk.HOTEN_KTS as 'Tên Kiến Trúc Sư'
from THIETKE as tk, CGTRINH as cgt
where tk.STT_CTR=cgt.STT_CTR
	and cgt.TEN_THAU='phong dich vu so xd'
	and tk.HOTEN_KTS in
	(
		select tk1.HOTEN_KTS
		from THIETKE as tk1, CGTRINH as cgt1
		where tk1.STT_CTR=cgt1.STT_CTR
			and cgt1.TEN_THAU='le van son'
	)

--b. cho biết tên công trình có kinh phí cao nhất
select cgt.TEN_CTR
from CGTRINH as cgt
where cgt.KINH_PHI =
	(
		select MAX(KINH_PHI)
		from CGTRINH
	)

--c.Cho biết họ tên các công nhân có tham gia các công trình Cần Thơ,
--nhưng không có tham gia công trình Vĩnh Long
select distinct tg.HOTEN_CN, cgt.TINH_THANH
from THAMGIA as tg, CGTRINH as cgt
where tg.STT_CTR = cgt.STT_CTR
	and cgt.TINH_THANH='can tho'
	and tg.HOTEN_CN not in
		(
			select distinct tg.HOTEN_CN
			from THAMGIA as tg, CGTRINH as cgt
			where tg.STT_CTR = cgt.STT_CTR
				and cgt.TINH_THANH='vinh long'
		)
	
--d. Cho biết tên của các chủ thầu đã thi công các công trình có kinh phí
--lớn hơn tất cả các công trình do chủ thầu Phòng Dịch vụ Sở Xây dựng thi công

select TEN_THAU
from CGTRINH
where KINH_PHI > ALL
		(
			select KINH_PHI
			from CGTRINH
			where TEN_THAU='Phong dich vu so xd'
		)
		
--e.Cho biết họ tên các kiến trúc sư có thù lao thiết kế một công trình nào đó
--dưới giá trị trung bình thù lao thiết kế cho một công trình

select tk.HOTEN_KTS, tk.THU_LAO
from THIETKE as tk, CGTRINH as cgt
where tk.STT_CTR=cgt.STT_CTR
	and tk.THU_LAO <
	(
		select AVG(tk2.THU_LAO)
		from THIETKE as tk2
	)
	
--f.Tìm tên và địa chỉ những thầu đã trúng thầu công trình có kinh phí thấp nhất
select ct.TEN_THAU, ct.DCHI_THAU, cgt.KINH_PHI
from CHUTHAU as ct, CGTRINH as cgt
where ct.TEN_THAU=cgt.TEN_THAU
	and KINH_PHI = 
	( 
		select MIN(KINH_PHI)
		from CGTRINH
	)
	
--g.Tìm họ tên và chuyên môn của các công nhân 
--tham gia các công trình do kiến trúc sư Lê Thanh Tùng thiết kế
select cg.HOTEN_CN, cg.CH_MON
from CONGNHAN as cg, THAMGIA as tg, CGTRINH as cgt
where cg.HOTEN_CN=tg.HOTEN_CN
	and tg.STT_CTR=cgt.STT_CTR
	and tg.STT_CTR in
	(
		select STT_CTR
		from THIETKE
		where HOTEN_KTS='Le Thanh Tung'
	)