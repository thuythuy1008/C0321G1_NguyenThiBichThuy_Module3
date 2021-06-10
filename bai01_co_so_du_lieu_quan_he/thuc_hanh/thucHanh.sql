create database bai01_thucHanh;
use bai01_thucHanh;
create table student (
id int,
nameStudent varchar(255),
age int,
address varchar(255)
);
alter table student
add column gender varchar(255);
select * from student;
drop table student;
drop database bai01_thucHanh;