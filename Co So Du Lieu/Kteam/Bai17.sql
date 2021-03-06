select * from NGUOITHAN
select * from GIAOVIEN

--Xuất ra thông tin giáo viên có hơn 1 người thân
select GV.*
from GIAOVIEN as GV
where 1 <
	(
		select COUNT(*)
		from NGUOITHAN as NT
		where NT.MAGV=GV.MAGV
	)
	
--Xuất ra danh sách giáo viên lớn tuổi hơn ít nhất 5 người trong trường
select GV.HOTEN
from GIAOVIEN as GV
where 5 <=
(
	select COUNT(*)
	from GIAOVIEN as GV2
	where GV.MAGV != GV2.MAGV
		and YEAR(GV.NGSINH)<YEAR(GV2.NGSINH)
)