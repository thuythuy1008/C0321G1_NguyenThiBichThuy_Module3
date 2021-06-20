use caseStudy_Database;
-- Task 22:
/*22.	Thông qua khung nhìn V_NHANVIEN thực hiện cập nhật địa chỉ thành “Liên Chiểu” đối với tất cả các Nhân viên 
được nhìn thấy bởi khung nhìn này.*/
update v_nhan_vien
set v_nhan_vien.dia_chi = "Lien Chieu"
where v_nhan_vien.id_nhan_vien = 4;
select * from nhan_vien;

-- Task 23:
/*23.	Tạo Clustered Index có tên là IX_KHACHHANG trên bảng Khách hàng.
Giải thích lý do và thực hiện kiểm tra tính hiệu quả của việc sử dụng INDEX*/
create unique index ix_khach_hang on khach_hang (id_khach_hang);
explain select * from khach_hang where id_khach_hang = 4;

-- Task 24:
/*24.	Tạo Non-Clustered Index có tên là IX_SoDT_DiaChi trên các cột SODIENTHOAI và DIACHI 
trên bảng KHACH HANG và kiểm tra tính hiệu quả tìm kiếm sau khi tạo Index.*/
create unique index ix_sdt_dia_chi on khach_hang (SDT,dia_chi);
explain select * from khach_hang where SDT = "0989098765" and dia_chi = "Nha Trang";

-- Task 25:
/*25.	Tạo Store procedure Sp_1 Dùng để xóa thông tin của một Khách hàng nào đó với Id Khách hàng 
được truyền vào như là 1 tham số của Sp_1*/
delimiter //
create procedure sp_1(in id int)
begin
delete from khach_hang
where id_khach_hang = id;
end //
delimiter ;
-- call xoa_khach_hang (2);
-- select * from khach_hang;

-- Task 26:
/*26.	Tạo Store procedure Sp_2 Dùng để thêm mới vào bảng HopDong với yêu cầu Sp_2 phải thực hiện
 kiểm tra tính hợp lệ của dữ liệu bổ sung, với nguyên tắc không được trùng khóa chính và 
 đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.*/
 -- Cách 1:Chưa kiểm tra tính hợp lệ
 delimiter //
create procedure sp_2(in id_hop_dong int,in id_nhan_vien int,in id_khach_hang int,in id_dich_vu int,in ngay_lam_hop_dong date,in ngay_ket_thuc date,in tien_dat_coc int,in tong_tien int)
begin
insert into hop_dong (id_hop_dong,id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
values (id_hop_dong,id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien);
end //
delimiter ;
call sp_2(5,3,2,1,'2020/05/07','2020/05/08',3000000,0);
-- Cách 2: Có kiểm tra tính hợp lệ
delimiter //
create procedure sp_5(in id_hop_dong_in int, in id_nhan_vien_in int, in id_khach_hang_in int, in id_dich_vu_in int,
in ngay_lam_hop_dong_in date, in ngay_ket_thuc_in date, in tien_dat_coc_in int, in tong_tien_in int)
begin
    if (id_hop_dong_in in (select id_hop_dong from hop_dong)) then
			signal sqlstate '45000' set message_text = 'Thông tin id hợp đồng trùng lặp';
		elseif (id_nhan_vien_in not in (select id_nhan_vien from nhan_vien)) then
			signal sqlstate '45000' set message_text = 'Thông tin id nhân viên không tồn tại';
		elseif (id_khach_hang_in not in (select id_khach_hang from khach_hang)) then
			signal sqlstate '45000' set message_text = 'Thông tin id khách hàng không tồn tại';
		elseif (id_dich_vu_in not in (select id_dich_vu from dich_vu)) then
			signal sqlstate '45000' set message_text = 'Thông tin id dịch vụ không tồn tại';
		else
			insert into hop_dong
			values
			(id_hop_dong_in, id_nhan_vien_in, id_khach_hang_in, id_dich_vu_in, ngay_lam_hop_dong_in, ngay_ket_thuc_in, tien_dat_coc_in, tong_tien_in);
    end if;
end//
delimiter ;
call sp_5(5,3,2,1,'2020/05/07','2020/05/15',3000000,0);
drop procedure sp_5;