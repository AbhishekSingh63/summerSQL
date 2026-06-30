/* practice problems */
use college01;

select count(*) as total_students FROM student01;

select avg(cgpa) as avgcgpa from student01;

select min(age) as minage from student01;

select sum(fees) as totalfee from student01;

select count(*) as delhistudent from student01 where city='Delhi';

select avg(age) as avgIt from student01 where branch='CSE';

select min(cgpa) as minCSE from student01 where branch='CSE';

select count(*) as aStud from student01 where student_name like 'A%';

select sum(fees) as tfee from student01 where cgpa>8;

/* challenges */
select avg(fees) as avgfee from student01 where city in ('Delhi','Jaipur') and cgpa>8;

select max(attendance) as maxA from student01 where branch not in ('Mechanical');

select sum(fees) as tfee from student01 where email is not null;

select min(cgpa) as mingpa from student01 where student_name like 'S%';