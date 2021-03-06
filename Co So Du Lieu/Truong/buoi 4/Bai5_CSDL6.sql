create database QuanLy_DuAn
go
use QuanLy_DuAn
go

--1. Tìm thông tin đầy đủ gồm mã, tên và thành phố của mỗi dự án ở TP HCM
select da.MA_DU_AN, da.TEN_DU_AN, da.TH_PHO
from DU_AN as da
where da.TH_PHO='tp ho chi minh'

--2. Tìm mã và tên các mặt hàng được cung ứng cho dự án Tân An
select distinct hh.MA_HANG, hh.TEN_HANG
from HANG_HOA as hh, CUNG_UNG as c, DU_AN as da
where hh.MA_HANG=c.MA_HANG
	and c.MA_DU_AN=da.MA_DU_AN
	and da.TEN_DU_AN='tan an'
	
--3. Tìm tên và vốn của các nhà cung cấp đã cung ứng mặt hàng Sơn Bạch Tuyết
--cho dự án Tân Phú. Cột vốn cần ghi thêm đơn vị tiền tệ đi kèm
select distinct ncc.TEN_NCC, ncc.VON as 'Vốn (Triệu Đồng)'
from HANG_HOA as hh, CUNG_UNG as c, DU_AN as da, NHA_CCAP as ncc
where hh.MA_HANG=c.MA_HANG
	and c.MA_DU_AN=da.MA_DU_AN
	and c.MA_NCC=ncc.MA_NCC
	and hh.TEN_HANG='son bach tuyet'
	and da.TEN_DU_AN='tan phu'

--4. Tìm tên các dự án do nhà cung cấp S1 cung ứng
select distinct da.TEN_DU_AN
from CUNG_UNG as c, DU_AN as da, NHA_CCAP as ncc
where c.MA_DU_AN=da.MA_DU_AN
	and c.MA_NCC=ncc.MA_NCC
	and ncc.MA_NCC='s1'
	
--5.Tìm tên nhà cung cấp đã cung ứng các mặt hàng màu đỏ cho dự án J1
select distinct ncc.TEN_NCC
from HANG_HOA as hh, CUNG_UNG as c, NHA_CCAP as ncc
where hh.MA_HANG=c.MA_HANG
	and c.MA_NCC=ncc.MA_NCC
	and hh.MAU='do'
	and c.MA_DU_AN='j1'
	
--6.Tìm tên của các mặt hàng mà không có mặt hàng nào có trọng lượng nhỏ hơn.
select hh.TEN_HANG
from HANG_HOA as hh
where hh.TR_LUONG > 10


--7. Tìm tên nhà cung cấp đã cung ứng cho cả hai dự án J1 và J2
select distinct ncc.TEN_NCC
from CUNG_UNG as c, NHA_CCAP as ncc
where c.MA_NCC=ncc.MA_NCC
	and c.MA_DU_AN='j1'
	and ncc.MA_NCC in
	(
		select distinct c.MA_NCC
		from CUNG_UNG as c
		where c.MA_DU_AN='j2'
	)
	
--8. Hiển thị số mặt hàng mà mỗi nhà cung cấp đã cung ứng cho các dự án
select distinct ncc.MA_NCC, COUNT(*) as 'Số Lượng Mặt Hàng'
from HANG_HOA as hh, CUNG_UNG as c, NHA_CCAP as ncc, DU_AN as da
where hh.MA_HANG=c.MA_HANG
	and c.MA_NCC=ncc.MA_NCC
	and c.MA_DU_AN=da.MA_DU_AN
group by ncc.MA_NCC

--9.Tìm số lượng trung bình các mặt hàng mà mỗi nhà cung cấp có thể cung ứng
select AVG(SLMH.SLMH) as 'Số Lượng Trung Bình Các Mặt Hàng'
from
	(
		select distinct ncc.MA_NCC, COUNT(*) as SLMH 
		from HANG_HOA as hh, CUNG_UNG as c, NHA_CCAP as ncc, DU_AN as da
		where hh.MA_HANG=c.MA_HANG
		and c.MA_NCC=ncc.MA_NCC
		and c.MA_DU_AN=da.MA_DU_AN
		group by ncc.MA_NCC
	) as SLMH
	
--10. Với mỗi mặt hàng, hãy hiển thị số lượng cung ứng
--mà mỗi nhà cung cấp đã cung ứng cho các dự án
select hh.TEN_HANG,ncc.TEN_NCC, SUM(c.SO_LUONG) as 'Số Lượng Cung Ứng'
from HANG_HOA as hh, CUNG_UNG as c, NHA_CCAP as ncc
where c.MA_HANG=hh.MA_HANG
	and c.MA_NCC=ncc.MA_NCC
group by hh.TEN_HANG, ncc.TEN_NCC

--11. Đối với mỗi mặt hàng cung ứng cho một dự án, 
--tìm mã hàng, tên dự án và tổng số lượng hàng tương ứng
select c.MA_HANG, da.TEN_DU_AN, SUM(c.SO_LUONG) as 'Tổng Số Lượng Hàng'
from CUNG_UNG as c, DU_AN as da
where c.MA_DU_AN=da.MA_DU_AN
group by c.MA_HANG, da.TEN_DU_AN

--12.Đối với mỗi mặt hàng cung ứng cho một dự án,
--tìm mã hàng, tên dự án và tổng số lượng hàng tương ứng
select hh.TEN_HANG, da.TEN_DU_AN, SUM(c.SO_LUONG) as 'Tổng Số Lượng Hàng'
from CUNG_UNG as c, DU_AN as da, HANG_HOA as hh
where c.MA_DU_AN=da.MA_DU_AN
	and c.MA_HANG=hh.MA_HANG
group by hh.TEN_HANG, da.TEN_DU_AN

--13.Tìm tên nhà cung cấp có vốn đầu tư cao nhất
select ncc.TEN_NCC
from NHA_CCAP as ncc
where ncc.VON = 
	(
		select MAX(ncc.VON)
		from NHA_CCAP as ncc
	)
	
--14. Tìm tên các nhà cung cấp đã cung ứng cho một dự án bất kỳ ở thành phố Hồ Chí Minh
select distinct ncc.TEN_NCC
from CUNG_UNG as c, NHA_CCAP as ncc, DU_AN as da
where c.MA_NCC=ncc.MA_NCC
	and c.MA_DU_AN=da.MA_DU_AN
	and da.TH_PHO='tp ho chi minh'
	
	
--15.Tìm mã của các nhà cung cấp đã cung ứng cho ít nhất hai dự án
--có cùng thành phố với nhà cung cấp đó
select SLDA.MA_NCC
from 
	(
		select c.MA_NCC, COUNT(*) as SLDA 
		from CUNG_UNG as c, NHA_CCAP as ncc, DU_AN as da
		where c.MA_NCC=ncc.MA_NCC
			and c.MA_DU_AN=da.MA_DU_AN
			and ncc.TH_PHO = da.TH_PHO
		group by c.MA_NCC
		Having COUNT(*) >= 2
	) as SLDA
	
	
--16. Tìm tên các dự án không được cung ứng bất cứ mặt hàng màu đỏ nào bởi một hãng ở tp HCM
select distinct da.TEN_DU_AN
from DU_AN as da
where da.MA_DU_AN not in
		(

				select c.MA_DU_AN
				from NHA_CCAP as ncc, HANG_HOA as hh, CUNG_UNG as c
				where ncc.MA_NCC=c.MA_NCC
					and hh.MA_HANG=c.MA_HANG
					and hh.MAU='do'
					and ncc.TH_PHO='tp ho chi minh'
		)


--17. Tìm mã của các nhà cung cấp cung ứng ít nhất là một mặt hàng,
--các mặt hàng này được cung ứng ít nhất bởi một nhà cung cấp,
--nhà cung cấp này cung cấp ít nhất là một mặt hàng màu đỏ
select distinct CCap.MA_NCC
from				
	(
		select c.MA_NCC, c.MA_HANG
		from CUNG_UNG as c
		where c.MA_HANG in
			(
				select HHM.MA_HANG
				from
				(
					select distinct c.MA_HANG, c.MA_NCC
					from CUNG_UNG as c
					where c.MA_NCC in
					(
						select distinct ncc.MA_NCC
						from NHA_CCAP as ncc, CUNG_UNG as c, HANG_HOA as hh
						where ncc.MA_NCC=c.MA_NCC
						and c.MA_HANG=hh.MA_HANG
						and hh.MAU='do'
						group by ncc.MA_NCC
						
					)
								
					group by c.MA_HANG, c.MA_NCC
								
				) as HHM
			)
		group by c.MA_NCC, c.MA_HANG
	)	as CCap
			
--18. Tìm mã của các dự án đang sử dụng ít nhất là một mặt hàng mà S1 có khả năng cung ứng
select distinct c.MA_DU_AN
from CUNG_UNG as c
where c.MA_NCC ='s1'

--19. Tìm tên dự án đã được cung ứng mặt hàng Xi Măng Hoàng Thạch với số lượng lớn nhất
select da.TEN_DU_AN
from		
	(	
		select c.MA_DU_AN, SUM(c.SO_LUONG) as SLCU
		from CUNG_UNG as c, HANG_HOA as hh
		where c.MA_HANG=hh.MA_HANG
			and hh.TEN_HANG='xi mang hoang t'
		group by c.MA_DU_AN
	) as CUMH, DU_AN as da
where da.MA_DU_AN=CUMH.MA_DU_AN
	and CUMH.SLCU =
	(	select MAX(CUMH.SLCU)
		from
			(
				select c.MA_DU_AN, SUM(c.SO_LUONG) as SLCU
				from CUNG_UNG as c, HANG_HOA as hh
				where c.MA_HANG=hh.MA_HANG
					and hh.TEN_HANG='xi mang hoang t'
				group by c.MA_DU_AN
			) as CUMH
	)
	
--20. Tìm mã các dự án được cung ứng hoàn toàn bởi hãng S2
select c.MA_DU_AN
from CUNG_UNG as c
where c.MA_NCC='s2'
	and c.MA_DU_AN in
	(
			select distinct c.MA_DU_AN
			from CUNG_UNG as c
			where  2 >
			(
				select COUNT(*)
				from CUNG_UNG as c1
				where c.MA_DU_AN=c1.MA_DU_AN
				group by c.MA_DU_AN
			)
	)
	
			--Kiem Tra--
select *
from CUNG_UNG
order by CUNG_UNG.MA_DU_AN

--21. Tìm mã các dự án chỉ sử dụng những mặt hàng có mà hãng S1 có khả nảng cung ứng
select distinct c.MA_DU_AN
from CUNG_UNG as c
where c.MA_NCC ='s1'
	and c.MA_DU_AN not in
	(
		select c1.MA_DU_AN
		from CUNG_UNG as c1
		where 0 < 
			(
				select COUNT(*)
				from CUNG_UNG as c1
				where c1.MA_NCC != 's1'
					and c.MA_DU_AN=c1.MA_DU_AN
			)
	)

--22. Tìm tổng số lượng của mỗi mặt hàng mà mỗi dự án được cung cấp
select hh.TEN_HANG, da.TEN_DU_AN, SUM(c.SO_LUONG) as 'Tổng Số Lượng'
from CUNG_UNG as c, DU_AN as da, HANG_HOA as hh
where c.MA_DU_AN=da.MA_DU_AN
	and c.MA_HANG=hh.MA_HANG
group by hh.TEN_HANG, da.TEN_DU_AN

--23. Tìm tổng số dự án dược hãng S3 cung ứng
select COUNT (*) as 'Tổng Số Dự Án'
from CUNG_UNG as c
where c.MA_NCC='s3'


--24. Tìm tổng số dự án mà mỗi nhà cung cấp đã cung ứng
select ncc.TEN_NCC, count(*) as 'Tổng Số Dự Án'
from CUNG_UNG as c, NHA_CCAP as ncc
where c.MA_NCC=ncc.MA_NCC
group by ncc.TEN_NCC



-------------------------------------------------------------------------
--25. Tìm tổng số lượng mặt hàng P1 do hãng S1 cung ứng
	--Kiem Tra--
select *
from CUNG_UNG

	--lay S1 va P1--
select *
from CUNG_UNG as c
where c.MA_NCC='s1'
	and c.MA_HANG='p1'

	--Hoan Chinh--
select c.MA_NCC, c.MA_HANG , SUM(c.SO_LUONG) as 'Số Lượng Cung Ứng'
from CUNG_UNG as c
where c.MA_NCC='s1'
	and c.MA_HANG='p1'
group by c.MA_NCC, c.MA_HANG





-------------------------------------------------------------------------
--26. Tìm Trung Bình số lượng cho mặt hàng P1 được cung ứng cho một dự án
	--Kiem Tra--
select *
from CUNG_UNG

	--Tìm P1--
select *
from CUNG_UNG as c
where c.MA_HANG='p1'

	--Tìm ra tổng mỗi dự án--
select c.MA_HANG, c.MA_DU_AN, SUM(c.SO_LUONG) as SL
from CUNG_UNG as c
where c.MA_HANG='p1'
group by c.MA_HANG, c.MA_DU_AN

	--Hoàn Chỉnh--
select SLMH.MA_HANG, AVG(SLMH.SL) as 'Trung Bình Số Lượng'
from 
	(
		select c.MA_HANG, c.MA_DU_AN, SUM(c.SO_LUONG) as SL
		from CUNG_UNG as c
		where c.MA_HANG='p1'
		group by c.MA_HANG, c.MA_DU_AN
	) as SLMH
group by SLMH.MA_HANG




-------------------------------------------------------------------------
--27. Tìm Trung Bình số lượng cho mặt hàng P1 được cung ứng bởi 1 hãng
	--Kiem Tra--
select *
from CUNG_UNG

	--Tìm P1--
select *
from CUNG_UNG as c
where c.MA_HANG='p1'

	--Tìm ra tổng mỗi dự án--
select c.MA_HANG, c.MA_NCC, SUM(c.SO_LUONG) as SL
from CUNG_UNG as c
where c.MA_HANG='p1'
group by c.MA_HANG, c.MA_NCC

	--Hoàn Chỉnh--
select SLMH.MA_HANG, AVG(SLMH.SL) as 'Trung Bình Số Lượng'
from 
	(
		select c.MA_HANG, c.MA_NCC, SUM(c.SO_LUONG) as SL
		from CUNG_UNG as c
		where c.MA_HANG='p1'
		group by c.MA_HANG, c.MA_NCC
	) as SLMH
group by SLMH.MA_HANG





-------------------------------------------------------------------------
--28. Tìm trung bình số lượng cho mặt hàng P1 được cung ứng cho một dự án bởi một hãng
	--Kiem Tra--
select *
from CUNG_UNG

	--Tìm P1--
select *
from CUNG_UNG as c
where c.MA_HANG='p1'

	--Tìm ra tổng mỗi dự án--
select c.MA_HANG, c.MA_NCC, c.MA_DU_AN, SUM(c.SO_LUONG) as SL
from CUNG_UNG as c
where c.MA_HANG='p1'
group by c.MA_HANG, c.MA_NCC, c.MA_DU_AN

	--Hoàn Chỉnh--
select SLMH.MA_HANG, AVG(SLMH.SL) as 'Trung Bình Số Lượng'
from 
	(
		select c.MA_HANG, c.MA_NCC, c.MA_DU_AN, SUM(c.SO_LUONG) as SL
		from CUNG_UNG as c
		where c.MA_HANG='p1'
		group by c.MA_HANG, c.MA_NCC, c.MA_DU_AN
	) as SLMH
group by SLMH.MA_HANG





-------------------------------------------------------------------------
--29. Tìm tên nhà cung cấp đã cung ứng cho ít nhất là 3 dự án
	--Kiem Tra--
select *
from CUNG_UNG

	-- Tim ten ncc va du an--
select c.MA_NCC, c.MA_DU_AN
from CUNG_UNG as c
group by c.MA_NCC, c.MA_DU_AN

	--Dem co bao nhieu du an--
select Gom_Nhom.MA_NCC, COUNT(*) as SL
from
	(
		select c.MA_NCC, c.MA_DU_AN
		from CUNG_UNG as c
		group by c.MA_NCC, c.MA_DU_AN
	) as Gom_Nhom
group by Gom_Nhom.MA_NCC

	--Chi lay 3 du an tro len--
select Gom_Nhom.MA_NCC, COUNT(*) as SL
from
	(
		select c.MA_NCC, c.MA_DU_AN
		from CUNG_UNG as c
		group by c.MA_NCC, c.MA_DU_AN
	) as Gom_Nhom
group by Gom_Nhom.MA_NCC
having COUNT(*) >= 3

	--Hoàn Chỉnh--
select distinct ncc.TEN_NCC
from 
	(
		select Gom_Nhom.MA_NCC, COUNT(*) as SL
		from
			(
				select c.MA_NCC, c.MA_DU_AN
				from CUNG_UNG as c
				group by c.MA_NCC, c.MA_DU_AN
			) as Gom_Nhom
		group by Gom_Nhom.MA_NCC
		having COUNT(*) >= 3
	)as KQ, NHA_CCAP as ncc
where KQ.MA_NCC=ncc.MA_NCC




-------------------------------------------------------------------------
--30. TÌm số lượng các nhà cung cấp đã cung ứng cho các dự án tại ít nhất 3 thành phố

	--Kiểm Tra--
select *
from CUNG_UNG as c

select *
from DU_AN as da

	--Ghep cung ứng và dự án để có thành phố
select *
from CUNG_UNG as c, DU_AN as da
where c.MA_DU_AN=da.MA_DU_AN

	--Gom nhóm ncc và thành phố--
select c.MA_NCC, da.TH_PHO
from CUNG_UNG as c, DU_AN as da
where c.MA_DU_AN=da.MA_DU_AN
group by c.MA_NCC, da.TH_PHO

	--Đếm số lượng thành phố của mỗi nhà cung cấp--
select Gom_Nhom.MA_NCC , COUNT(*) as SL
from
	(
		select c.MA_NCC, da.TH_PHO
		from CUNG_UNG as c, DU_AN as da
		where c.MA_DU_AN=da.MA_DU_AN
		group by c.MA_NCC, da.TH_PHO
	)as Gom_Nhom
group by Gom_Nhom.MA_NCC

	--Chỉ lấy ncc cung ung 3 thành phố trở lên--
select Gom_Nhom.MA_NCC , COUNT(*) as SL
from
	(
		select c.MA_NCC, da.TH_PHO
		from CUNG_UNG as c, DU_AN as da
		where c.MA_DU_AN=da.MA_DU_AN
		group by c.MA_NCC, da.TH_PHO
	)as Gom_Nhom
group by Gom_Nhom.MA_NCC
having COUNT(*) >= 3

	--Hoàn Chỉnh --
select COUNT(*) as 'Số Lượng NCC'
from 
	(
		select Gom_Nhom.MA_NCC , COUNT(*) as SL
		from
			(
				select c.MA_NCC, da.TH_PHO
				from CUNG_UNG as c, DU_AN as da
				where c.MA_DU_AN=da.MA_DU_AN
				group by c.MA_NCC, da.TH_PHO
			)as Gom_Nhom
		group by Gom_Nhom.MA_NCC
		having COUNT(*) >= 3
	)as KQ
	
	
	
-------------------------------------------------------------------------
--31.Tìm số lượng trung bình các bao xi măng(bất kể hiệu gì, màu gì) mà mỗi dự án đã tiêu thụ

	--Kiểm Tra--
select *
from HANG_HOA

select *
from CUNG_UNG

	--Lay ra xi mang--
select *
from HANG_HOA as hh
where hh.TEN_HANG like 'xi mang%'

	--Lấy ra dự án có sử dụng xi măng--
select *
from CUNG_UNG as c
where c.MA_HANG in
	(
		select hh.MA_HANG
		from HANG_HOA as hh
		where hh.TEN_HANG like 'xi mang%'
	)

	--Hoàn chỉnh--
select c.MA_DU_AN, AVG(c.SO_LUONG) as 'Số Lượng Trung Bình'
from CUNG_UNG as c
where c.MA_HANG in
	(
		select hh.MA_HANG
		from HANG_HOA as hh
		where hh.TEN_HANG like 'xi mang%'
	)	
group by c.MA_DU_AN
	








-------------------------------------------------------------------------
--32. Tìm tên dự án đã được cung ứng mặt hàng sơn(bất kể hiệu gì, màu gì)
--và tổng số lượng cao nhất

	--Kiểm Tra--
select *
from HANG_HOA

select *
from CUNG_UNG
	--Lay ra son--
select *
from HANG_HOA as hh
where hh.TEN_HANG like 'son%'

	--Lấy ra dự án có sử dụng xi măng--
select *
from CUNG_UNG as c
where c.MA_HANG in
	(
		select hh.MA_HANG
		from HANG_HOA as hh
		where hh.TEN_HANG like 'son%'
	)

	--Tổng số Lượng Mỗi dự án--
select c.MA_DU_AN, SUM(c.SO_LUONG) as Tong
from CUNG_UNG as c
where c.MA_HANG in
	(
		select hh.MA_HANG
		from HANG_HOA as hh
		where hh.TEN_HANG like 'xi mang%'
	)	
group by c.MA_DU_AN

	--Hoàn Chỉnh--
select da.TEN_DU_AN
from
	(
		select c.MA_DU_AN, SUM(c.SO_LUONG) as Tong
		from CUNG_UNG as c
		where c.MA_HANG in
			(
				select hh.MA_HANG
				from HANG_HOA as hh
				where hh.TEN_HANG like 'xi mang%'
			)	
		group by c.MA_DU_AN
	) as KQ, DU_AN as da
where KQ.MA_DU_AN=da.MA_DU_AN
	and KQ.Tong = 
	(
		select MAX(KQ.Tong)
		from
		(
			select c.MA_DU_AN, SUM(c.SO_LUONG) as Tong
			from CUNG_UNG as c
			where c.MA_HANG in
				(
					select hh.MA_HANG
					from HANG_HOA as hh
					where hh.TEN_HANG like 'xi mang%'
				)	
			group by c.MA_DU_AN
		) as KQ
	)

-------------------------------------------------------------------------
--33.Tìm mã của những hãng nào cung ứng cùng một mặt hàng cho tất cả các dự án

	--Kiểm Tra--
select *
from CUNG_UNG

	--Gom nhóm maNCC và MaHang--
select c.MA_NCC, c.MA_HANG, COUNT(*) as SLDA
from CUNG_UNG as c
group by c.MA_NCC, c.MA_HANG

	--Hoàn chỉnh--
select KQ.MA_NCC
from
	(
		select c.MA_NCC, c.MA_HANG, COUNT(*) as SLDA
		from CUNG_UNG as c
		group by c.MA_NCC, c.MA_HANG	
	)KQ
group by KQ.MA_NCC
having COUNT(*)=1



-------------------------------------------------------------------------
--34. Tìm mã các dự án được hãng S1 cung ứng cho tất cả các mặt hàng
--mà hãng S1 có khả năng cung ứng





-------------------------------------------------------------------------
--35.Tìm mã các dự án được cung ứng bởi tất cả những hãng nào cung ứng mặt hàng màu đỏ





-------------------------------------------------------------------------
--36. TÌm mã các mặt hàng được cung ứng cho tất cả các dự án ở TP HCM
	--Kiểm Tra--
select *
from CUNG_UNG

select *
from DU_AN

	--Lấy mã dự án ở TP HCM--
select *
from DU_AN as da
where da.TH_PHO='tp ho chi minh'

	--các mặt hàng được cung ứng cho các dự án ở TP HCM--
select *
from CUNG_UNG as c
where c.MA_DU_AN in
	(
		select da.MA_DU_AN
		from DU_AN as da
		where da.TH_PHO='tp ho chi minh'	
	)

	--Gom nhóm maHang, Mada--
select c.MA_HANG, c.MA_DU_AN
from CUNG_UNG as c
where c.MA_DU_AN in
	(
		select da.MA_DU_AN
		from DU_AN as da
		where da.TH_PHO='tp ho chi minh'	
	)
group by c.MA_HANG, c.MA_DU_AN


	-- Hoàn chỉnh --
select KQ.MA_HANG
from
	(
		select c.MA_HANG, c.MA_DU_AN
		from CUNG_UNG as c
		where c.MA_DU_AN in
			(
				select da.MA_DU_AN
				from DU_AN as da
				where da.TH_PHO='tp ho chi minh'	
			)
		group by c.MA_HANG, c.MA_DU_AN
	)as KQ
group by KQ.MA_HANG
having COUNT(*) =
	(
		select COUNT(*)
		from DU_AN as da
		where da.TH_PHO='tp ho chi minh'
	)

