use college01;

insert into student01 values
(105,'Roni','BCA',6.56,'Kerela','abiii@gmail.com'),
(106,'Manya','ECE',7.4,'Jaipur','ohh@gmail.com'),
(107,'Sahil','BCA',7.12,'Noida','tk@gmail.com'),
(108,'Sanju','CSE',9.1,'Delhi','abnav@gmail.com');

select name, cgpa
from student01
where cgpa is null; /* to check empty/null we will not use '=' */

select * from student01 where branch in ('CSE','BCA'); /* in operator */
select * from student01 where city in ('Delhi','Lucknow','Ranchi');

/* between operator */
select *
from student01
where cgpa between 7.5 and 9;

select *
from student01
where student_id between 105 and 107;

/* like - retrive data by matching patterns */
select * from student01 where name like 'A%';
select * from student01 where name like '%a';
select * from student01 where name like '%bh%';
select * from student01 where city like 'J%';
select * from student01 where branch like '%E';
select * from student01 where name like '____';

/* order by */
select * from student01 order by name asc;
select * from student01 order by city asc;
select * from student01 order by cgpa desc;
select * from student01 order by branch asc, name desc;

/* Challenge */
select * from student01 where branch in ('CSE');

select * from student01 where branch in ('CSE','ECE');

select distinct branch from student01; /* distinct - to display unique values */

select name, cgpa from student01;