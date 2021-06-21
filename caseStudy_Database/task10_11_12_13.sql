use caseStudy_Database;
SET SQL_SAFE_UPDATES = 0;
-- Task 10:
/*10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem 
(được tính dựa trên việc count các IDHopDongChiTiet).*/
select hd.id_hop_dong,hd.ngay_lam_hop_dong,hd.ngay_ket_thuc,hd.tien_dat_coc,count(hdct.id_hop_dong_chi_tiet) as "so_luong_dich_vu_di_kem"
from hop_dong hd
join hop_dong_chi_tiet hdct on hd.id_hop_dong=hdct.id_hop_dong
group by hd.id_hop_dong;

-- Task 11:
/*11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi 
những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.*/
select dvdk.id_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai_kha_dung,lk.ten_loai_khach,kh.dia_chi
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_hop_dong
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join loai_khach lk on kh.id_loai_khach = lk.id_loai_khach
where kh.id_loai_khach = 1 and (kh.dia_chi = "Quang Ngai" or kh.dia_chi = "Vinh");

-- Task 12:
/*12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, 
TenDichVu, SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), 
TienDatCoc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2019 
nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.*/
select hd.id_hop_dong,nv.ho_ten as "ten_nhan_vien",kh.ho_ten as "ten_khach_hang",kh.SDT as "so_dien_thoai_khach_hang",dv.ten_dich_vu,count(hdct.id_hop_dong) as "so_luong_dich_vu_di_kem",hd.tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.id_nhan_vien = nv.id_nhan_vien
join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong 
where year(hd.ngay_lam_hop_dong)=2019 and month(hd.ngay_lam_hop_dong) in (10,11,12)and month(hd.ngay_lam_hop_dong) not in (select month(hd.ngay_lam_hop_dong)
	from hop_dong
	where month(hd.ngay_lam_hop_dong)between 1 and 6); 

-- Task 13:
/*13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
 (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).*/
 -- Cách 1:
create temporary table bang_tam_dich_vu_di_kem(select id_hop_dong_chi_tiet,count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung_dich_vu_di_kem"
				from hop_dong_chi_tiet hdct
                group by hdct.id_dich_vu_di_kem);
                select * from bang_tam_dich_vu_di_kem;
select dvdk.id_dich_vu_di_kem,dvdk.ten_dich_vu_di_kem,dvdk.gia,dvdk.don_vi,dvdk.trang_thai_kha_dung,max(bt.so_lan_su_dung_dich_vu_di_kem)
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
join bang_tam_dich_vu_di_kem bt on hdct.id_hop_dong_chi_tiet = bt.id_hop_dong_chi_tiet
group by hdct.id_dich_vu_di_kem;
drop table bang_tam_dich_vu_di_kem;

-- Cách 2:
select dvdk.* , count(hdct.id_hop_dong_chi_tiet) as "so_hop_dong"
from dich_vu_di_kem dvdk
inner join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
group by dvdk.id_dich_vu_di_kem
having count(hdct.id_hop_dong_chi_tiet) >= all (select count(hdct.id_hop_dong_chi_tiet)
from hop_dong_chi_tiet hdct
group by hdct.id_dich_vu_di_kem);