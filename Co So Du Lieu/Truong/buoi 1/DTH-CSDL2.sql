create database QUANLY_BAOCHI
GO
USE QUANLY_BAOCHI
GO

--a. Tìm tên các báo/tạp chí có đăng bài của tác giả Tô Phan. CHo biết đăng trên số nào? Được phát hành vào những ngày nào?
select bb.TUA as 'Tên Báo/Tạp Chí', db.SO_BAO_TC as 'Đăng trên số',ph.NGAY as 'Ngày phát hành'
from BAIBAO as bb, VIETBAI as vb, DANG_BAI as db, PHATHANH as ph
where bb.STT_BAI=vb.STT_BAI
	and vb.BUT_HIEU='to phan'
	and db.STT_BAI=bb.STT_BAI
	and ph.MA_BAO_TC=db.MA_BAO_TC

--b. Nội dung của tập chí Kiến thức ngày nay Số 156 gồm những bài tựa gì? Đăng từ trang nao?
select bb.TUA as 'Tựa', db.TRANG as 'Trang'
from BAO_TCHI as btc, DANG_BAI as db, BAIBAO as bb
where btc.MA_BAO_TC=db.MA_BAO_TC
	and db.STT_BAI=bb.STT_BAI
	and db.SO_BAO_TC='156'
	


	
--c.Cho biết tựa và thể loại tất cả các bài báo do tác giả Nguyễn Trọng Vinh sáng tác
--và đã được đăng trên các báo/ tạp chí xuất bản hàng tuần.
--Cho biết đồng thời tên và số tờ báo/tạp chí tương ứng mỗi bài được đăng.
select bb.TUA as 'Tựa', tl.DGIAI as 'Thể Loại', btc.TEN as 'Tên tờ báo', db.SO_BAO_TC as 'Số Báo/Tạp Chí'
from BAIBAO as bb, THE_LOAI as tl, VIETBAI as vb, DANG_BAI as db, BAO_TCHI as btc
where bb.MA_THLOAI=tl.MA
	and bb.STT_BAI=vb.STT_BAI
	and vb.BUT_HIEU='ng trong vinh'
	and bb.STT_BAI=db.STT_BAI
	and db.MA_BAO_TC=btc.MA_BAO_TC
	and btc.DINH_KY='1 tuan'
	
--d.Cho biết các số báo/tạp chí và các ngày phát hành tương ứng trong năm 1994 của tờ báo Lao động.
select ph.SO_BAO_TC as 'Số Báo/Tạp Chí', ph.NGAY as 'Ngày phát hành'
from PHATHANH as ph, BAO_TCHI as btc
where YEAR(ph.NGAY)=1994
	and ph.MA_BAO_TC=btc.MA_BAO_TC
	and btc.TEN='lao dong'




--e.Tờ Tuổi trẻ chủ nhật số 23 có những bài bút ký nào?(Cho biết tựa của chúng)
select bb.TUA as 'Tựa'
from BAO_TCHI as btc, DANG_BAI as db, BAIBAO as bb, THE_LOAI as tl
where btc.TEN='tuoi tre chu nhat'
	and db.MA_BAO_TC=btc.MA_BAO_TC
	and db.SO_BAO_TC='23'
	and db.STT_BAI=bb.STT_BAI
	and bb.MA_THLOAI=tl.MA
	and tl.DGIAI='but ky'
	


--f.Cho biết ngày đăng, tên và số của tờ báo/tạp chí đã đăng bài 'Chúc mừng vui năm Lợn"
select ph.NGAY as 'Ngày Đăng', ph.SO_BAO_TC as 'Số Báo/Tạp Chí', btc.TEN
from PHATHANH as ph, BAO_TCHI as btc, DANG_BAI as db, BAIBAO as bb
where ph.MA_BAO_TC=btc.MA_BAO_TC
	and ph.MA_BAO_TC=db.MA_BAO_TC
	and db.STT_BAI = bb.STT_BAI
	and bb.TUA='chuc vui nam lon'

