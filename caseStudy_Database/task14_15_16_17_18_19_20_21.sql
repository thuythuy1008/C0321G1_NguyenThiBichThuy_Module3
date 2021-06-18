use caseStudy_Database;
-- Task 14:
/*14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.*/
select hd.id_hop_dong, ldv.ten_loai_dich_vu,dvdk.ten_dich_vu_di_kem,count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung"
from dich_vu_di_kem dvdk
join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
join hop_dong hd on hdct.id_hop_dong = hd.id_dich_vu
join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
join loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
group by hdct.id_dich_vu_di_kem
having count(hdct.id_dich_vu_di_kem) = 1;

-- Task 15:
/*15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi 
mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.*/
select nv.id_nhan_vien,nv.ho_ten,td.trinh_do,bp.ten_bo_phan,nv.SDT,nv.dia_chi,count(hd.id_hop_dong) as "so_lan_lam_hop_dong"
from nhan_vien nv
join trinh_do td on nv.id_trinh_do = td.id_trinh_do
join bo_phan bp on nv.id_bo_phan = bp.id_bo_phan
join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where (year(hd.ngay_lam_hop_dong) between 2018 and 2019)
group by hd.id_nhan_vien
having count(hd.id_hop_dong) <=3;

-- Task 16:
/*16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.*/
delete from nhan_vien nv
where  nv.id_nhan_vien not in (select hd.id_nhan_vien
						 from hop_dong hd
						 where year(hd.ngay_lam_hop_dong) between 2017 and year(curdate()));
 
 -- Task 17:
 /*17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, 
 chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.*/
 create temporary table bang_tam_id_tong_tien (select kh.id_loai_khach,hd.id_khach_hang,
		sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia) as "tong_tien"
        from hop_dong hd
        join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
        join khach_hang kh on hd.id_khach_hang = kh.id_khach_hang
        join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
        join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
        where year(hd.ngay_lam_hop_dong)=2019
        group by hd.id_khach_hang
        having tong_tien > 10000000);
select * from bang_tam_id_tong_tien;

update khach_hang 
set id_loai_khach = 1
where id_khach_hang = (select bang_tam_id_tong_tien.id_khach_hang from bang_tam_id_tong_tien);           

select * from khach_hang;
drop table bang_tam_id_tong_tien;

-- Task 18:
/*18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràng buộc giữa các bảng).*/
delete from khach_hang kh
where  kh.id_khach_hang in (select hd.id_khach_hang
						 from hop_dong hd
						 where year(hd.ngay_lam_hop_dong) < 2016);
                         
-- Task 19:
/*19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.*/
create temporary table bang_tam_dich_vu_di_kem (select dvdk.id_dich_vu_di_kem as "id" , count(hdct.id_dich_vu_di_kem) as "so_lan_su_dung"
            from dich_vu_di_kem dvdk
            join hop_dong_chi_tiet hdct on dvdk.id_dich_vu_di_kem = hdct.id_dich_vu_di_kem
            group by hdct.id_dich_vu_di_kem 
            having so_lan_su_dung > 10);
update dich_vu_di_kem
set gia = gia*2
where dich_vu_di_kem.id_dich_vu_di_kem in (select bang_tam_dich_vu_di_kem.id from bang_tam_dich_vu_di_kem);
select * from dich_vu_di_kem;
drop table bang_tam_dich_vu_di_kem;

-- Task 20:
/*20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống,
 thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.*/
 select id_khach_hang as id,ho_ten,email,SDT,ngay_sinh,dia_chi
 from khach_hang
 union all
 select id_nhan_vien as id,ho_ten,email,SDT,ngay_sinh,dia_chi
 from nhan_vien;
 
 -- Task 21:
 /*21.	Tạo khung nhìn có tên là V_NHANVIEN để lấy được thông tin của tất cả các nhân viên 
 có địa chỉ là “Hải Châu” và đã từng lập hợp đồng cho 1 hoặc nhiều Khách hàng bất kỳ  
 với ngày lập hợp đồng là “12/12/2019”*/
 create view v_nhan_vien as (select nv.* from nhan_vien nv
 join hop_dong hd on nv.id_nhan_vien = hd.id_nhan_vien
where nv.dia_chi = "Hai Chau" and hd.ngay_lam_hop_dong = "2019/12/12");
select * from v_nhan_vien;