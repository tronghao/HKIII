CREATE DATABASE QUANLY_HANGHOA
GO
USE QUANLY_HANGHOA
GO
--1.Tìm tên những đại lý vừa có bán cocacola vừa bán pepsi cola
select distinct dl.TEN_DL as 'Tên Đại Lý'
from DAILY as dl, HANGHOA as hh, BAN as b
where hh.MA_HANG = b.MA_HANG
	and dl.STT_DL=b.STT_DL
	and hh.TEN_HG='coca cola'
	and dl.STT_DL in
	(
		select dl.STT_DL
		from DAILY as dl, HANGHOA as hh, BAN as b
		where hh.MA_HANG = b.MA_HANG
			and dl.STT_DL=b.STT_DL
			and hh.TEN_HG='pepsi cola'
	)
	
--2.TÌm tên những mặt hàng được mua nhưng chưa được bán
select distinct hh.TEN_HG
from HANGHOA as hh, MUA AS m
where hh.MA_HANG=m.MA_HANG
	and hh.MA_HANG not in
	(
		select distinct hh.MA_HANG
		from HANGHOA as hh, BAN as b
		where hh.MA_HANG=b.MA_HANG
	)
	
	
--3.Tìm tên và địa chỉ những đại lý có mua cùng mặt hàng với Vạn Lợi mua
select distinct dl.TEN_DL as 'Tên Đại Lý', dl.DCHI_DL as 'Địa Chỉ Đại Lý'
from DAILY as dl, MUA as m
where dl.STT_DL=m.STT_DL
	and dl.TEN_DL != 'van loi'
	and m.MA_HANG in
	(
		select distinct m.MA_HANG
		from DAILY as dl, MUA as m
		where dl.STT_DL=m.STT_DL
		and dl.TEN_DL='van loi'
	)
	
--4.Cho biết tên các mặt hàng được ít nhất hai đại lý mua với số lượng trên 50
select hh.TEN_HG
from HANGHOA as hh
where 2 <=
(
	select  COUNT(*)
	from  MUA as m
	where hh.MA_HANG=m.MA_HANG
		and m.SOLG_MUA>50
	
)

--5.Tìm tổng giá trị mua Coca Cola ở đại lý Tân Hiệp Hưng
select SUM(m.TRIGIA_MUA)
from MUA as m, HANGHOA as hh
where m.MA_HANG=hh.MA_HANG
	and hh.TEN_HG='coca cola'
	and m.STT_DL in
	(
		select dl.STT_DL
		from DAILY as dl
		where dl.TEN_DL='tan hiep hung'
	)

--6.Tìm tổng giá trị bán Coca Cola ở đại lý Tân Hiệp Hưng
select SUM(b.TRIGIA_BAN)
from BAN as b, HANGHOA as hh
where b.MA_HANG=hh.MA_HANG
	and hh.TEN_HG='coca cola'
	and b.STT_DL in
	(
		select distinct dl.STT_DL
		from DAILY as dl
		where dl.TEN_DL='tan hiep hung'
	)
	
--7. Tìm tên những mặt hàng được bán ở đại lý Tân Hiệp Hưng vào cả 2 ngày 15/12/94 va 31/12/94
select distinct hh.TEN_HG as 'Tên Hàng Hóa'
from BAN as b, DAILY as dl, HANGHOA as hh
where b.STT_DL=dl.STT_DL
	and hh.MA_HANG=b.MA_HANG
	and dl.TEN_DL='tan hiep hung'
	and  convert(varchar, b.NGAY_BAN , 103)='15/12/1994'
	and b.MA_HANG in 
	(
		select distinct b.MA_HANG
		from BAN as b, DAILY as dl
		where b.STT_DL=dl.STT_DL
			and dl.TEN_DL='tan hiep hung'
			and  convert(varchar, b.NGAY_BAN , 103)='31/12/1994'
	)
	
--8.Có bao nhiêu mặt hàng được mua nhưng chưa được bán ra ở đại lý Tân Hiệp Hưng
--trong tháng 12 năm 1994
select COUNT(*) as 'Số Lượng Mua Chưa Bán'
from MUA as m, DAILY as dl
where	m.STT_DL = dl.STT_DL
	and dl.TEN_DL='tan hiep hung'
	and MONTH(m.NGAY_MUA)=12
	and YEAR(m.NGAY_MUA)=1994
	and m.MA_HANG not in
	(
		select distinct b.MA_HANG
		from BAN as b, DAILY as dl
		where b.STT_DL=dl.STT_DL
			and dl.TEN_DL='tan hiep hung'
			and MONTH(b.NGAY_BAN)=12
			and YEAR(b.NGAY_BAN)=1994
	)

--9. Tìm tên các mặt hàng có mua và bán trong cùng một ngày ở cùng một đại lý
select distinct *
from HANGHOA as hh, MUA as m
where hh.MA_HANG = m.MA_HANG
	and m.MA_HANG in
	(
		select m.MA_HANG
		from BAN as b
		where b.MA_HANG=hh.MA_HANG
			and m.NGAY_MUA = b.NGAY_BAN
			and m.STT_DL=b.STT_DL
	)
	
--10.Tìm tên và địa chỉ của các đại lý và những mặt hàng
--có số lượng mua và bán bằng nhau trong cùng một ngày
select dl.TEN_DL, dl.DCHI_DL, hh.TEN_HG, m.SOLG_MUA, b.SOLG_BAN, m.NGAY_MUA, b.NGAY_BAN
from DAILY as dl, HANGHOA as hh, MUA as m, BAN as b
where b.MA_HANG=hh.MA_HANG
	and b.STT_DL=dl.STT_DL
	and m.STT_DL=dl.STT_DL
	and m.SOLG_MUA=b.SOLG_BAN
	and m.NGAY_MUA=b.NGAY_BAN
	
	
--11.Tìm tên đại lý đã mua coca cola với số lượng nhiều hơn tất cả các đại lý khác
select *
from DAILY as dl, MUA as m, HANGHOA as hh
where dl.STT_DL=m.STT_DL
	and m.MA_HANG=hh.MA_HANG
	and hh.TEN_HG='coca cola'
	and m.SOLG_MUA > ALL
	(
		select m.SOLG_MUA
		from MUA as m, DAILY as dl1
		where hh.MA_HANG=m.MA_HANG
			and dl1.STT_DL=m.STT_DL
			and hh.TEN_HG='coca cola'
			and dl.STT_DL!=dl1.STT_DL
	)