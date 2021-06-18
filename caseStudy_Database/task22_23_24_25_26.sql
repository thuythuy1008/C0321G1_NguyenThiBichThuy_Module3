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
 delimiter //
create procedure sp_2(in id_hop_dong int,in id_nhan_vien int,in id_khach_hang int,in id_dich_vu int,in ngay_lam_hop_dong date,in ngay_ket_thuc date,in tien_dat_coc int,in tong_tien int)
begin
insert into products (id_hop_dong,id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien)
values (id_hop_dong,id_nhan_vien,id_khach_hang,id_dich_vu,ngay_lam_hop_dong,ngay_ket_thuc,tien_dat_coc,tong_tien);
end //
delimiter ;
-- call insert_products(5,3,2,1,'2020/05/07','2020/05/08',3000000,0);