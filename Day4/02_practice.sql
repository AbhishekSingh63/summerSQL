use college01;

select * from student01;

select student_id,student_name, branch from student01;

select distinct city from student01;

select student_name from student01 where branch in ; /*incomplete*/

select * from student01 where branch in ('CSE');

select * from student01 where age>20;

select * from student01 where cgpa>=8.5;

select * from student01 where city in ('Delhi','Noida','Lucknow');

select * from student01 where age between 18 and 21;

select * from student01 where cgpa between 7.5 and 8.5;

/* pattern searching */
select * from student01 where student_name like 'A%';

select * from student01 where student_name like '%a';

select * from student01 where student_name like '%an%';

select * from student01 where city like 'N%';

/* logical operators */
select * from student01 where branch in ('CSE') and cgpa>8;

select * from student01 where city='Delhi' or branch='IT';

select * from student01 where branch not in ('CSE');

select * from student01 where age between 19 and 22 and branch in ('CSE');

/* null handling */
select * from student01 where email is null;

select * from student01 where phoneno is not null;

/* sorting */
select * from student01 order by cgpa desc;

select * from student01 order by student_name asc;

select * from student01 order by branch asc, cgpa desc;

/* mixed thinking questions */
select student_name, cgpa from student01 where city in ('Delhi') and cgpa>8.5;

select * from student01 where city not in ('Delhi');

select * from student01 where student_name like 'S%' and city in ('Delhi','Jaipur');

select * from student01 where student_name like '%a%' order by student_name desc;

select * from student01 where email is not null;