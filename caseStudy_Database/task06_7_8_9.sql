use caseStudy_Database;
-- Task 6:
/*6.	Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ 
chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).*/
select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where dich_vu.id_dich_vu not in (select hop_dong.id_dich_vu 
	from hop_dong 
	where (year(ngay_lam_hop_dong)=2019) and (month(ngay_lam_hop_dong) in (01,02,03)));

-- Task 7:
/*7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của
 tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 
 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.*/
select dich_vu.id_dich_vu,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu
from dich_vu
join loai_dich_vu on dich_vu.id_loai_dich_vu=loai_dich_vu.id_loai_dich_vu
join hop_dong on dich_vu.id_dich_vu=hop_dong.id_dich_vu
where year(ngay_lam_hop_dong)=2018 and year(ngay_lam_hop_dong) not in (select year(ngay_lam_hop_dong)
	from hop_dong 
	where (year(ngay_lam_hop_dong)=2019)); 
                                
-- Task 8:
/*8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên*/
-- Cách 1:
select khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 2:
select distinct khach_hang.ho_ten
from khach_hang
group by khach_hang.ho_ten;
-- Cách 3:
select khach_hang.ho_ten
from khach_hang
union
select khach_hang.ho_ten
from khach_hang;

-- Task 9:
/*9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 
thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.*/
select month(ngay_lam_hop_dong) as "Thang", sum(dich_vu.chi_phi_thue +hop_dong_chi_tiet.so_luong*dich_vu_di_kem.gia) as "Tong tien",
count(hop_dong.id_khach_hang) as "So khach thue dich vu"
from hop_dong
join dich_vu on hop_dong.id_dich_vu=dich_vu.id_dich_vu
join hop_dong_chi_tiet on hop_dong.id_hop_dong=hop_dong_chi_tiet.id_hop_dong
join dich_vu_di_kem on hop_dong_chi_tiet.id_dich_vu_di_kem=dich_vu_di_kem.id_dich_vu_di_kem
where year(ngay_lam_hop_dong)=2019
group by month(ngay_lam_hop_dong);