create database bai01_baiTap;
use bai01_baiTap;
create table class (
id int,
nameClass varchar(255)
);
insert into class (id, nameClass)
values (1,'C0321G1');
select * from class;
select id from class;
insert into class (id, nameClass)
values 
(2,'C0421G1'),
(3,'C0521G1'),
(2,'C0621G1');
update class
set nameClass = 'C0321G2'
where id = 1;
delete from class
where id = 1;
use bai01_baiTap;
create table teacher (
id int,
nameTeacher varchar(255),
age int,
country varchar(255)
);