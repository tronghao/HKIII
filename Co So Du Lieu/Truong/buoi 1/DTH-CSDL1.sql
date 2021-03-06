CREATE DATABASE QUANLY_CONGTRINH
GO
USE QUANLY_CONGTRINH
GO


-- a.Cho biết tên và địa chỉ các công trình do chủ thầu Công Ty xây dựng số 6 thi công
SELECT TEN_CTR AS 'TÊN CÔNG TRÌNH', DIACHI_CTR AS 'ĐỊA CHỈ'
FROM CGTRINH
WHERE TEN_THAU='cty xd so 6'



--b.Tìm tên và địa chỉ liên lạc của các chủ thầu thi công công trình ở Cần Thơ do kiến trúc sư Lê Kim Dung thiết kế
SELECT ct.TEN_THAU, ct.DCHI_THAU
FROM CHUTHAU AS ct, CGTRINH AS cgt, THIETKE AS tk
WHERE ct.TEN_THAU=cgt.TEN_THAU
	AND tk.STT_CTR=cgt.STT_CTR
	AND cgt.TINH_THANH='can tho'
	AND tk.HOTEN_KTS='le kim dung'

--c.Hãy cho biết nơi tốt nghiệp của các kiến trúc sư đã thiết kế công trình Khách Sạn Quốc Tế ở Cần Thơ

SELECT NOI_TN
FROM KTRUCSU AS kt, CGTRINH AS cgt, THIETKE AS tk
WHERE kt.HOTEN_KTS=tk.HOTEN_KTS
	and cgt.STT_CTR=tk.STT_CTR
	and cgt.TINH_THANH='can tho'
	and cgt.TEN_CTR='khach san quoc te'


--d.Hãy cho biết họ tên, năm sinh, năm vào nghề của các công nhân có chuyện môn hàn hoặc điện đã tham gia các công trình
--mà chủ thầu Lê Văn Sơn đã trúng thầu

SELECT cn.HOTEN_CN as 'Họ Tên Công Nhân', cn.NAMS_CN as 'Năm Sinh', cn.NAM_VAO_N as 'Năm Vào Nghề'
FROM CONGNHAN AS cn, CGTRINH AS cgt, THAMGIA AS tg
WHERE cn.HOTEN_CN=tg.HOTEN_CN
	and tg.STT_CTR=cgt.STT_CTR
	and (cn.CH_MON='han' or cn.CH_MON='dien')
	and cgt.TEN_THAU='le van son'
	
--e.Những công nhân nào đã bắt đầu tham gia công trình Khách sạn Quốc Tế ở Cần Thơ trong giai đoạn từ ngày 15/12/94 
--đến ngày 31/12/94, số ngày tương ứng là bao nhiêu
select tg.HOTEN_CN as 'Họ Tên Công Nhân', tg.NGAY_TGIA as 'Ngày tham gia' , tg.SO_NGAY as 'Số Ngày'
from THAMGIA as tg, CGTRINH as cgt
where tg.STT_CTR=cgt.STT_CTR
	and cgt.TINH_THANH='can tho'
	and cgt.TEN_CTR='khach san quoc te'
	and tg.NGAY_TGIA between 'Dec 15, 1994' and 'Dec 31, 1994'
	
	
	
--f.Cho biết họ tên và năm sinh của các kiến trúc sư đã tốt nghiệp ở thành phố HCM 
--và đã thiết kế ít nhất một công trình có kinh phí đầu tư trên 400 triệu đồng
select kt.HOTEN_KTS, kt.NAMS_KTS
from KTRUCSU as kt, CGTRINH as cgt, THIETKE as tk
where kt.NOI_TN='tp hcm'
	and kt.HOTEN_KTS=tk.HOTEN_KTS
	and tk.STT_CTR=cgt.STT_CTR
	and cgt.KINH_PHI > 400