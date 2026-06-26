/* Create Database */
create database college01;
use college01;

create table student01(
id int,
name varchar(30),
branch varchar(20),
cgpa decimal(4,2),
city varchar(30),
email varchar(40));

show tables;

insert into student01 values
(101,'Abhishek','CSE',7.56,'Lucknow','abhi@gmail.com'),
(102,'Soham','ECE',7.96,'Pune','soh@gmail.com'),
(103,'Utkarsh','BCA',6.90,'Ranchi','utk@gmail.com'),
(104,'Abhinav','CSE',8.55,'Banaras','abhinav@gmail.com');

select * from student01;

describe student01;

select name,
cgpa,
cgpa+1 as bonus_cgpa
from student01;

select distinct branch from student01;

select name as studentName from student01;

select * from student01 where branch='CSE';

select * from student01 where branch='BCA';

select * from student01 where city='Lucknow';

select * from student01 where branch='CSE' and cgpa>8;

select * from student01 where branch='ECE' and cgpa>7.5;

select * from student01 where branch='ECE' or branch='BCA';

use college01;
 
alter table student01
change column id student_id int;

select * from student01;