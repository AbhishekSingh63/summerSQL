use college01;

select * from student01 where city!='delhi';

select * from student01 where branch!='IT';

select * from student01 where cgpa<=8;

select * from student01 where branch!='CSE' and branch!='BCA'; /* 1st way to exclude more than 2 values */

select * from student01 where branch not in ('CSE','BCA'); /* 2st way to exclude more than 2 values */