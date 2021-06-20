use caseStudy_Database;
-- Task 27:
/*27.	Tạo triggers có tên Tr_1 Xóa bản ghi trong bảng HopDong thì hiển thị tổng số lượng bản ghi còn lại 
có trong bảng HopDong ra giao diện console của database*/
delimiter //
create procedure sp(in id int)
begin
delete from hop_dong
where id_hop_dong = id;
end //
delimiter ;
call sp(5);
drop procedure sp;

delimiter //
create trigger tr_1 after delete on hop_dong for each row
	begin
		select count(*) into @so_luong from hop_dong;
        set @temp = concat('Số lượng bản ghi còn lại',' ', @so_luong);
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = @temp;
    end//
delimiter ;
drop trigger tr_1;
-- Task 28:
/*28.	Tạo triggers có tên Tr_2 Khi cập nhật Ngày kết thúc hợp đồng, cần kiểm tra xem 
thời gian cập nhật có phù hợp hay không, với quy tắc sau: Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng 
ít nhất là 2 ngày. Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra 
thông báo “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database*/
delimiter //
create trigger tr_2 after update on hop_dong for each row
begin
if datediff(new.ngay_ket_thuc,old.ngay_lam_hop_dong) < 2 then
	SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
end if;
end // 
delimiter ;
drop trigger tr_2;
update hop_dong
set ngay_ket_thuc = '2019/12/14'
where id_hop_dong = 4;
-- Task 29:
/*29.	Tạo user function thực hiện yêu cầu sau:
a.	Tạo user function func_1: Đếm các dịch vụ đã được sử dụng với Tổng tiền là > 2.000.000 VNĐ.*/
delimiter //
create function func_1()
returns int
deterministic
begin
return (select count(id_dich_vu)
		from hop_dong
        where id_dich_vu in (select dv.id_dich_vu 			
			from hop_dong hd
			join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
			join hop_dong_chi_tiet hdct on hd.id_hop_dong = hdct.id_hop_dong
			join dich_vu_di_kem dvdk on hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
			group by dv.id_dich_vu
			having sum(dv.chi_phi_thue + hdct.so_luong*dvdk.gia)  > 2000000));        
end // 
delimiter ;
select func_1()  as "so_luong_dich_vu";

/*b.	Tạo user function Func_2: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng
 đến lúc kết thúc hợp đồng mà Khách hàng đã thực hiện thuê dịch vụ (lưu ý chỉ xét các khoảng thời gian 
 dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
 Mã của Khách hàng được truyền vào như là 1 tham số của function này.*/
 delimiter //
create function func_2(id int)
returns int
deterministic
begin
return (select max(datediff(ngay_ket_thuc,ngay_lam_hop_dong))
	from hop_dong
    where id_khach_hang = id
    group by id_khach_hang);
end // 
delimiter ;
select func_2(2);
drop function func_2;

-- Task 30:
/*30.	Tạo Stored procedure Sp_3 để tìm các dịch vụ được thuê bởi khách hàng với loại dịch vụ là “Room” 
từ đầu năm 2015 đến hết năm 2019 để xóa thông tin của các dịch vụ đó (tức là xóa các bảng ghi trong bảng DichVu) 
và xóa những HopDong sử dụng dịch vụ liên quan (tức là phải xóa những bản gi trong bảng HopDong) 
và những bản liên quan khác.*/
create temporary table bang_tam_id(select dv.id_dich_vu,dv.ten_dich_vu,hd.id_hop_dong,hdct.id_hop_dong_chi_tiet
				from hop_dong hd
				join dich_vu dv on hd.id_dich_vu = dv.id_dich_vu
                join hop_dong_chi_tiet hdct on hd.id_hop_dong= hdct.id_hop_dong
                where year(hd.ngay_lam_hop_dong) between 2015 and 2019 and dv.ten_dich_vu = 'Room');
delimiter //
create procedure sp_3()
begin
delete from dich_vu
where id_dich_vu = (select bang_tam_id.id_dich_vu from bang_tam_id);
delete from hop_dong
where id_hop_dong = (select bang_tam_id.id_hop_dong from bang_tam_id);
end //
delimiter ; 
call sp_3; 
drop procedure sp_3;
drop table bang_tam_id;