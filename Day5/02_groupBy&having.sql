use college01;

/* order of execution(external) - select -> from -> where -> group by -> having -> order by*/
/* order of execution(internal) - from -> where -> group by -> having -> select -> order by*/

/* group by examples */

select branch, avg(cgpa)
from student01
group by branch;

select branch, count(student_id)
from student01
group by branch;

select city, count(*)
from student01
group by city;

select branch, sum(fees)
from student01
group by branch;

select branch, max(cgpa)
from student01
group by branch;

/* having examples */
select branch, avg(cgpa)
from student01
group by branch
having avg(cgpa)>8;

select city, count(*)
from student01
group by city
having count(*)>5;

select branch, sum(fees)
from student01
group by branch
having sum(fees)>2500000;

select city, avg(attendance)
from student01
group by city
having avg(attendance)>80;

/* where and having together */
select branch, avg(cgpa)
from student01
where branch in ('CSE','BCA')
group by branch
having avg(cgpa)>6;

/* practice */
select city, max(attendance)
from student01
group by city;

select branch, min(fees)
from student01
group by branch;

select branch, count(*)
from student01
group by branch
having count(*)>8;

select city, avg(cgpa)
from student01
group by city
having avg(cgpa)>8;

select city, sum(fees)
from student01
group by city;

select branch, min(attendance)
from student01
group by branch
having min(attendance)<70;

select city, sum(fees)
from student01
group by city
having sum(fees)>300000;

/* challenge */
select branch, sum(fees) as totalfees
from student01
group by branch
order by totalfees desc
limit 1;

select city, avg(attendance) as highestavgAtt
from student01
group by city
order by highestavgAtt desc
limit 1;

/* business scenarios */
/* 1-The principal wants to compare the avg attendance of every branch.
2-The finance department wants to know the total fees collected from each semester.
3-The admission office wants to know how many students have enrolled from each city.
4-The placement cell wants to identify branches whose average cgpa is greater than 8.5.
5-The academic coordinator wants to know the highest cgpa obtained in each semester. */