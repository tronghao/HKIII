--Truy xuất thông tin của bảng tham gia đề tài
select * from THAMGIADT


--Lấy ra mã khoa và tên khoa tương ứng
select MAKHOA, TENKHOA from KHOA


--Lấy ra mã GV, ten GV và họ tên người thân tương ứng
select GV.MAGV AS 'Mã Giáo Viên', HOTEN as 'Họ Tên Giáo Viên', TEN as 'Tên Người Thân'
from GIAOVIEN as GV, NGUOITHAN

--Lấy ra mã GV, ten GV và tên Khoa của GV đó làm việc
select GIAOVIEN.MAGV, GIAOVIEN.HOTEN, Khoa.TENKHOA
from GIAOVIEN, KHOA, BOMON
where GIAOVIEN.MABM=BOMON.MABM and BOMON.MAKHOA=khoa.MAKHOA