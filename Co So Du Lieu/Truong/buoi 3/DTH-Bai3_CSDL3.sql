CREATE DATABASE QUANLY_HANGHOA
GO
USE QUANLY_HANGHOA
GO

--a.Tìm đơn giá mua trung bình của bia Sài Gòn tính trên tất cả các đại lý
select AVG(m.TRIGIA_MUA/m.SOLG_MUA) as 'Đơn giá mua trung bình'
from MUA as m, HANGHOA as hh
where m.MA_HANG=hh.MA_HANG
	and hh.TEN_HG='bia saigon'
	
--b.Tìm đơn giá mua trung bình của bia Sài Gòn tính trên từng các đại lý
select dl.TEN_DL as 'Tên Đại Lý', TBM.TB as 'Đơn giá mua trung bình'
from 
	(
		select m.STT_DL, AVG(m.TRIGIA_MUA/m.SOLG_MUA) as TB
		from MUA as m, HANGHOA as hh
		where m.MA_HANG=hh.MA_HANG
		and hh.TEN_HG='bia saigon'
		group by m.STT_DL
	) as TBM, DAILY as dl
where dl.STT_DL=TBM.STT_DL

--c.Hiển Thị số lượng tồn kho của từng mặt hàng theo từng đại lý

--doan lenh chung
select  SLB.STT_DL, SLB.MA_HANG, (SLM.SLM-SLB.SLB) as CON
from
	(
		select b.STT_DL, b.MA_HANG, SUM(b.SOLG_BAN) as SLB
		from BAN as b
		group by b.STT_DL, b.MA_HANG
	) as SLB,
	(
		select m.STT_DL, m.MA_HANG, SUM(m.SOLG_MUA) as SLM
		from MUA as m
		group by m.STT_DL, m.MA_HANG
	) as SLM
where slb.STT_DL=SLM.STT_DL
	and SLB.MA_HANG=SLM.MA_HANG
--het doan lenh chung

	
union 

select mg.STT_DL, mg.MA_HANG, SUM(mg.SOLG_MUA) as CON
from MUA as mg
where mg.MA_HANG not in
(
	--doan lenh chung
	select  SLB.MA_HANG
	from
		(
			select b.STT_DL, b.MA_HANG, SUM(b.SOLG_BAN) as SLB
			from BAN as b
			group by b.STT_DL, b.MA_HANG
		) as SLB,
		(
			select m.STT_DL, m.MA_HANG, SUM(m.SOLG_MUA) as SLM
			from MUA as m
			group by m.STT_DL, m.MA_HANG
		) as SLM
	where slb.STT_DL=SLM.STT_DL
	and SLB.MA_HANG=SLM.MA_HANG
	
	--het doan lenh chung
	
	and SLB.STT_DL=mg.STT_DL
)
group by mg.STT_DL, mg.MA_HANG


--d. Tìm tên, địa chỉ của đại lý có tổng giá trị mua trong một ngày lớn hơn 700000
select distinct dl.TEN_DL, dl.DCHI_DL
from DAILY as dl,
	(
		select m.STT_DL, m.NGAY_MUA, SUM(m.TRIGIA_MUA) as STGM
		from MUA as m
		group by m.STT_DL,m.NGAY_MUA
	) as TGM
where dl.STT_DL=TGM.STT_DL
	and TGM.STGM>700000
	
--e.Với mỗi đại lý, hãy cho biết ngày nào có số lượng mặt hàng bán ra là ít nhất
select dl.TEN_DL, SLMH.NGAY_BAN
from DAILY as dl,
	(		
		select b.STT_DL, b.NGAY_BAN, COUNT(*) as SLMH
		from BAN as b
		group by b.STT_DL, b.NGAY_BAN
	) as SLMH
where dl.STT_DL = SLMH.STT_DL
	and SLMH.SLMH =
	(
		select MIN(SLMH.SLMH)
		from
		(		
			select b.STT_DL,b.NGAY_BAN, COUNT(*) as SLMH
			from BAN as b
			group by b.STT_DL,b.NGAY_BAN
		) as SLMH
		where SLMH.STT_DL=dl.STT_DL
	)
	
--f. Tìm tên và địa chỉ của những đại lý có tổng trị giá bán cao nhất
select dl.TEN_DL, dl.DCHI_DL
from DAILY as dl,
	(
		select b.STT_DL, SUM(b.TRIGIA_BAN) as TGB
		from BAN as b
		group by b.STT_DL
	)as TGB
where dl.STT_DL=TGB.STT_DL
	and TGB.TGB = 
	(
		select MAX(TGB.TGB)
		from
		(
			select b.STT_DL, SUM(b.TRIGIA_BAN) as TGB
			from BAN as b
			group by b.STT_DL
		) as TGB
		where TGB.STT_DL=dl.STT_DL
	)

--g.Tìm tổng số tiền mà mỗi đại lý đã chi để mua hàng theo từng tháng
select dl.TEN_DL, TST.THANG, TST.TTGM
from DAILY as dl,
	(
		select m.STT_DL, MONTH(m.NGAY_MUA) as THANG, SUM(m.TRIGIA_MUA) as TTGM
		from MUA as m
		group by m.STT_DL, MONTH(m.NGAY_MUA)
	) as TST
where dl.STT_DL = TST.STT_DL
order by dl.TEN_DL

--h.Tìm tên và tổng số lượng bán ra của các mặt hàng đã bán được
--với số lượng nhiều nhất của từng đại lý
select dl.TEN_DL as 'Tên Đại Lý',hh.TEN_HG as 'Tên Hàng Hóa', SLB.SLB as 'Tổng Số Lượng Bán Ra'
from DAILY as dl,
	(
		select b.MA_HANG, b.STT_DL, SUM(b.SOLG_BAN) as SLB
		from BAN as b
		group by b.MA_HANG, b.STT_DL
	) as SLB,
	HANGHOA as hh
where dl.STT_DL=SLB.STT_DL
	and hh.MA_HANG=SLB.MA_HANG
	and SLB.SLB =
	(
		select MAX(SLB.SLB)
		from
		(
			select b.MA_HANG, b.STT_DL, SUM(b.SOLG_BAN) as SLB
			from BAN as b
			where dl.STT_DL=b.STT_DL
			group by b.MA_HANG, b.STT_DL
		) as SLB
	) 

--i.Cho biết tổng số món hàng mà mỗi đại lý kinh doanh(mua và bán)

select dl.TEN_DL as 'Tên Đại Lý', SMH2.SMH2 as 'Tổng Số Món Hàng Kinh Doanh'
from DAILY as dl,
(
		select SMH.STT_DL , COUNT(*) as SMH2
		from 
			(
				select m.STT_DL,m.MA_HANG, COUNT(*) as SMH
				from MUA as m
				group by m.STT_DL,m.MA_HANG
			) as SMH
		group by SMH.STT_DL
) as SMH2
where dl.STT_DL=SMH2.STT_DL


--Bảng Bán
select *
from DAILY as dl,
(
		select SMH.STT_DL , COUNT(*) as SMH2
		from
		(
			select b.STT_DL,b.MA_HANG, COUNT(*) as SMH
			from BAN as b
			group by b.STT_DL, b.MA_HANG
		)as SMH
		group by SMH.STT_DL
) as SMH2
where dl.STT_DL=SMH2.STT_DL



--j.Tìm tên đại lý đã mua vào mặt hàng bia Heineken với đơn giá mua là cao nhất
select dl.TEN_DL
from DAILY as dl,
	(
		select m.STT_DL,m.MA_HANG, (m.TRIGIA_MUA/SOLG_MUA) as DGM
		from MUA as m, HANGHOA as hh
		where m.MA_HANG=hh.MA_HANG
			and hh.TEN_HG='bia heineken'
	) as DGM
where dl.STT_DL=DGM.STT_DL
	and DGM.DGM =
	(
		select MAX(DGM.DGM)
		from
		(
			select m.STT_DL,m.MA_HANG, (m.TRIGIA_MUA/SOLG_MUA) as DGM
			from MUA as m, HANGHOA as hh
			where m.MA_HANG=hh.MA_HANG
				and hh.TEN_HG='bia heineken'
		) as DGM
		where dl.STT_DL=DGM.STT_DL
	)

