create database lpu_db;
show databases;
use lpu_db;
create table students_lpu(
    student_name varchar(50),
    reg_id int,
    batch varchar(20),
    cgpa int,
    age int,
    city varchar(50)
);
insert into students_lpu values
('Abhishek',123,'CSE',8,20,'Lucknow'),
('Aman',173,'CSE',7,21,'Ranchi'),
('Soni',143,'ECE',6,20,'Chandigarh'),
('Ayush',243,'CSE',8,20,'Patna'),
('Vishal',823,'ECE',9,21,'Golaghat');
select * from students_lpu;