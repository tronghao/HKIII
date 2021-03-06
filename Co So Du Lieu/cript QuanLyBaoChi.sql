CREATE TABLE BAIBAO
(
	STT_BAI INT NOT NULL,
	TUA NVARCHAR(40),
	MA_THLOAI NVARCHAR(4),
	CONSTRAINT PK_BAIBAO PRIMARY KEY(STT_BAI)
)

CREATE TABLE BAO_TCHI
(
	MA_BAO_TC NVARCHAR(4),
	TEN NVARCHAR(20),
	DCHI_TS NVARCHAR(30),
	TEL NVARCHAR(7),
	DINH_KY NVARCHAR(8),
	CONSTRAINT PK_BTC PRIMARY KEY(MA_BAO_TC)
)

CREATE TABLE THE_LOAI
(
	MA NVARCHAR(4) NOT NULL, 
	DGIAI NVARCHAR(18),
	CONSTRAINT PK_TL PRIMARY KEY (MA)
)

CREATE TABLE DANG_BAI
(
	MA_BAO_TC NVARCHAR(4),
	SO_BAO_TC NVARCHAR(7),
	STT_BAI INT,
	TRANG TINYINT,
	CONSTRAINT PK_DB PRIMARY KEY(MA_BAO_TC, SO_BAO_TC, STT_BAI)
)

CREATE TABLE PHATHANH
(
	MA_BAO_TC NVARCHAR(4) NOT NULL,
	SO_BAO_TC NVARCHAR(7),
	NGAY SMALLDATETIME,
	CONSTRAINT PK_PH PRIMARY KEY(MA_BAO_TC, SO_BAO_TC, NGAY)
)

CREATE TABLE VIETBAI
(
	STT_BAI INT NOT NULL,
	BUT_HIEU NVARCHAR(20),
	CONSTRAINT PK_VB PRIMARY KEY(STT_BAI, BUT_HIEU)
)

	--THEM BANG BAIBAO--
INSERT INTO BAIBAO VALUES(1, '100 nam co don', 'bk')
INSERT INTO BAIBAO VALUES(2, 'nhung manh doi nhiem hiv', 'ps')
INSERT INTO BAIBAO VALUES(3, 'mot vai cam nghi cua ngoi sao dien anh S', 'ps')
INSERT INTO BAIBAO VALUES(4, 'han han lich su o dac lac', 'tl')
INSERT INTO BAIBAO VALUES(5, 'thi truong chat xam tu do', 'xl')

INSERT INTO BAIBAO VALUES(6, 'van de chu yeu phu thuoc vao phia viet n', 'ps')
INSERT INTO BAIBAO VALUES(7, 'tim hieu ve chat doc sarin', 'tl')
INSERT INTO BAIBAO VALUES(8, 'bac ke chuyen tay du ky', 'bk')
INSERT INTO BAIBAO VALUES(9, 'duoc gap bac truoc ngay ve nam', 'bk')
INSERT INTO BAIBAO VALUES(10, 'mung xuan tu vinh', 't')

INSERT INTO BAIBAO VALUES(11, 'duyen no', 'tn')
INSERT INTO BAIBAO VALUES(12, 'chuc vui nam lon', 't')
INSERT INTO BAIBAO VALUES(13, 'lang hoa nghi tam', 'ps')
INSERT INTO BAIBAO VALUES(14, 'giai dieu mua xuan', 'xl')

	--them bang BAO_TCHI--
INSERT INTO BAO_TCHI VALUES('ld', 'lao dong', '51 hang bo ha noi', '252441', '1 tuan')
INSERT INTO BAO_TCHI VALUES('ccb', 'cuu chien binh', '34 ly nam de ha noi', '234410', '1 thang')
INSERT INTO BAO_TCHI VALUES('tt', 'tuoi tre', '20lt chinh thang q3 tphcm', '345213', 't3,t5,t7')

INSERT INTO BAO_TCHI VALUES('ttcn', 'tuoi tre chu nhat', '20 ly chinh thang tphcm', '345215', '1 tuan')
INSERT INTO BAO_TCHI VALUES('ktnn', 'kien thuc ngay nay', '18 tung thien vuong q1', '176435', '2 tuan')
INSERT INTO BAO_TCHI VALUES('stnt', 'so tay noi tro', '64 tran quang dieu', '1769', '1 thang')

	--them bang thl--
INSERT INTO THE_LOAI VALUES('bk', 'but ky')
INSERT INTO THE_LOAI VALUES('ps', 'phong su')
INSERT INTO THE_LOAI VALUES('tl', 'tu lieu')
INSERT INTO THE_LOAI VALUES('xl', 'xa luan')

INSERT INTO THE_LOAI VALUES('t', 'tho')
INSERT INTO THE_LOAI VALUES('tn', 'truyen ngan')
INSERT INTO THE_LOAI VALUES('tg', 'truyen dai')

	--them bang dangbai--
INSERT INTO	DANG_BAI VALUES('ld', '125/94', 1, 4)
INSERT INTO	DANG_BAI VALUES('ld', '125/94', 2, 4)
INSERT INTO	DANG_BAI VALUES('ld', '125/94', 3, 4)
INSERT INTO	DANG_BAI VALUES('ld', '41/95', 4, 3)
INSERT INTO	DANG_BAI VALUES('ld', '41/95', 5, 3)

INSERT INTO	DANG_BAI VALUES('ld', '41/95', 6, 3)
INSERT INTO	DANG_BAI VALUES('ttcn', '23', 7, 4)
INSERT INTO	DANG_BAI VALUES('ttcn', '23', 8, 3)
INSERT INTO	DANG_BAI VALUES('ttcn', '22', 9, 2)
INSERT INTO	DANG_BAI VALUES('ttcn', '22', 10, 3)

INSERT INTO	DANG_BAI VALUES('ktnn', '156', 11, 16)
INSERT INTO	DANG_BAI VALUES('ktnn', '157', 12, 18)
INSERT INTO	DANG_BAI VALUES('ccb', 'x95', 13, 19)
INSERT INTO	DANG_BAI VALUES('ccb', 'x95', 14, 25)

	--them ph-
INSERT INTO PHATHANH VALUES('ld', '41/95', '19950104')
INSERT INTO PHATHANH VALUES('ccb', 'x95', '19950101')
INSERT INTO PHATHANH VALUES('ld', '125/94', '19941018')
INSERT INTO PHATHANH VALUES('ttcn', '23', '19950430')

INSERT INTO PHATHANH VALUES('ttcn', '22', '19950423')
INSERT INTO PHATHANH VALUES('ktnn', '156', '19950425')
INSERT INTO PHATHANH VALUES('ktnn', '157', '19950410')

	--them vb--
INSERT INTO VIETBAI VALUES(1, 'nhat le')
INSERT INTO VIETBAI VALUES(2, 'lan anh')
INSERT INTO VIETBAI VALUES(2, 'le hoang my linh')
INSERT INTO VIETBAI VALUES(3, 'le nguyen')
INSERT INTO VIETBAI VALUES(4, 'dang ba tien')

INSERT INTO VIETBAI VALUES(5, 'to phan')
INSERT INTO VIETBAI VALUES(6, 'thanh ha')
INSERT INTO VIETBAI VALUES(6, 'quang ha')
INSERT INTO VIETBAI VALUES(7, 'thanh liem')
INSERT INTO VIETBAI VALUES(8, 'van giang')

INSERT INTO VIETBAI VALUES(9, 'binh minh')
INSERT INTO VIETBAI VALUES(10, 'ng trong vinh')
INSERT INTO VIETBAI VALUES(11, 'han ngoc cam')
INSERT INTO VIETBAI VALUES(12, 'binh mac')
INSERT INTO VIETBAI VALUES(13, 'thang canh')

INSERT INTO VIETBAI VALUES(14, 'nguyen du ngoan')
INSERT INTO VIETBAI VALUES(14, 'to phan')


--a.
	--tim tophan--
SELECT *
FROM dbo.VIETBAI AS vb
WHERE vb.BUT_HIEU = 'to phan'

	--btchi co dang bai to phan--
SELECT *
FROM dbo.DANG_BAI AS db
WHERE db.STT_BAI IN
	(
		SELECT vb.STT_BAI
		FROM dbo.VIETBAI AS vb
		WHERE vb.BUT_HIEU = 'to phan'	
	)
	
	--Hoàn chỉnh--
SELECT btc.TEN, db.SO_BAO_TC, ph.NGAY AS 'Ngày Phát Hành'
FROM dbo.DANG_BAI AS db, dbo.PHATHANH AS ph, dbo.BAO_TCHI AS btc
WHERE db.STT_BAI IN
	(
		SELECT vb.STT_BAI
		FROM dbo.VIETBAI AS vb
		WHERE vb.BUT_HIEU = 'to phan'	
	)
	AND db.MA_BAO_TC = ph.MA_BAO_TC
	AND db.MA_BAO_TC=btc.MA_BAO_TC
	
---------------------------------------------------------------------
--b. 
	--lay kien thuc ngay nay--
SELECT *
FROM dbo.BAO_TCHI AS btc
WHERE btc.TEN ='kien thuc ngay nay'

	--lau các bai bao cua ktnn
SELECT *
FROM dbo.DANG_BAI AS db
WHERE db.MA_BAO_TC IN
	(
		SELECT btc.MA_BAO_TC
		FROM dbo.BAO_TCHI AS btc
		WHERE btc.TEN ='kien thuc ngay nay'		
	)
	AND db.SO_BAO_TC='156'
	
	--Hoàn Chỉnh--
SELECT bb.TUA, db.TRANG
FROM dbo.DANG_BAI AS db, dbo.BAIBAO AS bb
WHERE db.MA_BAO_TC IN
	(
		SELECT btc.MA_BAO_TC
		FROM dbo.BAO_TCHI AS btc
		WHERE btc.TEN ='kien thuc ngay nay'		
	)
	AND db.SO_BAO_TC='156'
	AND db.STT_BAI=bb.STT_BAI
	
---------------------------------------------------------------------
--c. 
	--lay tua, the loai Nguyen Trong Vinh--
SELECT *
FROM dbo.BAIBAO AS bb, dbo.VIETBAI AS vb, dbo.THE_LOAI AS tl
WHERE bb.STT_BAI=vb.STT_BAI
	AND bb.MA_THLOAI=tl.MA
	AND vb.BUT_HIEU='ng trong vinh'

	--lay btc xuat bang hang tuan--
SELECT *
FROM dbo.BAO_TCHI AS btc
WHERE btc.DINH_KY='1 tuan'

	--Hoàn Chỉnh--
SELECT bb.TUA, tl.DGIAI, btc.TEN, db.SO_BAO_TC
FROM dbo.BAIBAO AS bb, dbo.VIETBAI AS vb, dbo.THE_LOAI AS tl, dbo.DANG_BAI AS db, dbo.BAO_TCHI AS btc
WHERE bb.STT_BAI=vb.STT_BAI
	AND bb.MA_THLOAI=tl.MA
	AND bb.STT_BAI=db.STT_BAI
	AND btc.MA_BAO_TC=db.MA_BAO_TC
	AND vb.BUT_HIEU='ng trong vinh'
	AND db.MA_BAO_TC IN
	(
		SELECT btc.MA_BAO_TC
		FROM dbo.BAO_TCHI AS btc
		WHERE btc.DINH_KY='1 tuan'	
	)
	
---------------------------------------------------------------------
--d. 
	--lay bao lao dong--
SELECT *
FROM dbo.BAO_TCHI AS btc
WHERE btc.TEN='lao dong'

	--Hoàn CHỉnh--
SELECT ph.SO_BAO_TC, ph.NGAY AS 'Ngày Phát Hành'
FROM dbo.PHATHANH AS ph
WHERE  YEAR(ph.NGAY)=1994
	AND ph.MA_BAO_TC IN
	(
		SELECT btc.MA_BAO_TC
		FROM dbo.BAO_TCHI AS btc
		WHERE btc.TEN='lao dong'	
	)
	
---------------------------------------------------------------------
--e. 
		--lay bao tuoi tre--
SELECT *
FROM dbo.BAO_TCHI AS btc
WHERE btc.TEN='tuoi tre chu nhat'

	-- lay bút ký--
SELECT *
FROM dbo.THE_LOAI AS tl
WHERE tl.DGIAI='but ky'

	--Hoàn Chỉnh--
SELECT bb.TUA
FROM dbo.DANG_BAI AS db, dbo.BAIBAO AS bb
WHERE db.STT_BAI=bb.STT_BAI
	AND db.SO_BAO_TC='23'
	AND bb.MA_THLOAI=
	(
		SELECT tl.MA
		FROM dbo.THE_LOAI AS tl
		WHERE tl.DGIAI='but ky'		
	)
	AND db.MA_BAO_TC =
	(
		SELECT btc.MA_BAO_TC
		FROM dbo.BAO_TCHI AS btc
		WHERE btc.TEN='tuoi tre chu nhat'	
	)
	
---------------------------------------------------------------------
--f. 
SELECT ph.NGAY AS 'Ngày Đăng', btc.TEN, db.SO_BAO_TC
FROM dbo.BAIBAO AS bb, dbo.DANG_BAI AS db, dbo.BAO_TCHI AS btc, dbo.PHATHANH AS ph
WHERE bb.STT_BAI=db.STT_BAI
	AND btc.MA_BAO_TC=db.MA_BAO_TC
	AND btc.MA_BAO_TC=ph.MA_BAO_TC
	AND bb.TUA='chuc vui nam lon'