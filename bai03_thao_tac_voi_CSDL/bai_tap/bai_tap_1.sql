-- Tạo database quản lý sinh viên
create database bai03_bt1_quan_ly_sinh_vien;
use bai03_bt1_quan_ly_sinh_vien;
CREATE TABLE class (
    class_id   INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(60) NOT NULL,
    start_date DATETIME    NOT NULL,
    status1    BIT
);
CREATE TABLE student (
    student_id   	INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    student_name 	VARCHAR(30) NOT NULL,
    address     	VARCHAR(50),
    phone       	VARCHAR(20),
    status1      	BIT,
    class_id     	INT         NOT NULL,
    FOREIGN KEY (class_id) REFERENCES class (class_id)
);
CREATE TABLE subject1 (
    subject1_id   	INT         NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject1_name 	VARCHAR(30) NOT NULL,
    credit  		TINYINT     NOT NULL DEFAULT 1 CHECK ( credit >= 1 ),
    status1  		BIT			DEFAULT 1
);
CREATE TABLE mark (
    mark_id    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    subject1_id     INT NOT NULL,
    student_id INT NOT NULL,
    mark      FLOAT   DEFAULT 0 CHECK ( mark BETWEEN 0 AND 100),
    exam_times TINYINT DEFAULT 1,
    UNIQUE (subject1_id, student_id),
    FOREIGN KEY (subject1_id) REFERENCES subject1 (subject1_id),
    FOREIGN KEY (student_id) REFERENCES student (student_id)
);
-- Thêm dữ liệu
INSERT INTO class
VALUES 
(1, 'A1', '2008-12-20', 1),
(2, 'A2', '2008-12-22', 1),
(3, 'B3', current_date, 0);
INSERT INTO student (student_name, address, phone, status1, class_id)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO student (student_name, address, status1, class_id)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO student (student_name, address, phone, status1, class_id)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);
INSERT INTO subject1
VALUES 
(1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);
INSERT INTO mark (subject1_id, student_id, mark, exam_times)
VALUES 
(1, 1, 8, 1),
(1, 2, 10, 2),
(2, 1, 12, 1);
-- Truy vấn dữ liệu
-- Hiển thị tất cả các sinh viên có tên bắt đầu bảng ký tự ‘h’
select *
from student
where student_name like "H%";
-- Hiển thị các thông tin lớp học có thời gian bắt đầu vào tháng 12.
select *
from class
where month(start_date) = 12;
-- Hiển thị tất cả các thông tin môn học có credit trong khoảng từ 3-5.
select *
from subject1
where credit between 3 and 5;
-- Thay đổi mã lớp(ClassID) của sinh viên có tên ‘Hung’ là 2.
update student
set class_id = 2
where student_name = "Hung";
/* Hiển thị các thông tin: StudentName, SubName, Mark. 
Dữ liệu sắp xếp theo điểm thi (mark) giảm dần. 
nếu trùng sắp theo tên tăng dần.*/
select student_name, subject1_name, mark
from student
inner join mark on student.student_id = mark.student_id
inner join subject1 on mark.subject1_id = subject1.subject1_id
order by mark.mark desc, student.student_name asc;
