--Tong so luong hang hoa ban ra cua moi dai ly theo tung mat hang
SELECT DAILY.TEN_DL, HANGHOA.TEN_HG, SUM(dbo.BAN.SOLG_BAN) AS TONG_SL_BAN
FROM DAILY INNER JOIN BAN ON DAILY.STT_DL = BAN.STT_DL INNER JOIN
     HANGHOA ON BAN.MA_HANG = HANGHOA.MA_HANG
GROUP BY dbo.DAILY.TEN_DL, dbo.HANGHOA.TEN_HG
ORDER BY DAILY.TEN_DL, HANGHOA.TEN_HG
--
--Tong tri gia ban hang hoa ban ra cua moi dai ly theo tung mat hang

SELECT DAILY.TEN_DL, HANGHOA.TEN_HG, SUM(TRIGIA_BAN) AS TONG_TGIA_BAN
FROM DAILY INNER JOIN BAN ON DAILY.STT_DL = BAN.STT_DL INNER JOIN
     HANGHOA ON BAN.MA_HANG = HANGHOA.MA_HANG
GROUP BY dbo.DAILY.TEN_DL, dbo.HANGHOA.TEN_HG
ORDER BY DAILY.TEN_DL, HANGHOA.TEN_HG

--Tong so luong hang hoa ban ra cua moi dai ly 
SELECT DAILY.TEN_DL, SUM(dbo.BAN.SOLG_BAN) AS TONG_SL_BAN
FROM DAILY INNER JOIN BAN ON DAILY.STT_DL = BAN.STT_DL
GROUP BY DAILY.TEN_DL
--
--Tong tri gia ban hang hoa ban ra cua moi dai ly

SELECT DAILY.TEN_DL, SUM(TRIGIA_BAN) AS TONG_TGIA_BAN
FROM DAILY INNER JOIN BAN ON DAILY.STT_DL = BAN.STT_DL
GROUP BY dbo.DAILY.TEN_DL
ORDER BY DAILY.TEN_DL

--Cho biet dai ly co tong so luong hang hoa ban ra cao nhat
SELECT DL1.TEN_DL, SUM(BA1.SOLG_BAN) AS TONG_SL_BAN
FROM DAILY DL1,BAN BA1
WHERE DL1.STT_DL = BA1.STT_DL
GROUP BY DL1.TEN_DL
HAVING SUM(BA1.SOLG_BAN) =
 ( SELECT MAX(TONG_SL))
   FROM TBL_TONG)
--
CREATE VIEW dbo.SDED
AS
SELECT     dbo.DAILY.TEN_DL, dbo.HANGHOA.TEN_HG, dbo.BAN.SOLG_BAN
FROM         dbo.BAN INNER JOIN
                      dbo.DAILY ON dbo.BAN.STT_DL = dbo.DAILY.STT_DL INNER JOIN
                      dbo.HANGHOA ON dbo.BAN.MA_HANG = dbo.HANGHOA.MA_HANG


--Ten hang hoa co tri gia ban cao nhat 
SELECT DL1.TEN_DL
FROM DAILY DL1,BAN BA1
WHERE DL1.STT_DL = BA1.STT_DL AND
      TRIGIA_BAN = (SELECT MAX(BA2.TRIGIA_BAN) FROM BAN BA2)
--