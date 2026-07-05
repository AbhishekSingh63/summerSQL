use college01;

/* composite key */
create table attendance
(
Student_ID int,
Subject_Code varchar(10),
Attendance_Date date,
primary key(Student_ID,Subject_Code)
);

insert into Attendance
values
(101,'SQL 101','2026-07-01');

insert into Attendance
values
(101,'PHY 101','2026-07-01');

create table Enrollments
(
Enrollment_ID int primary key,
Student_ID int,
Course_Name varchar(50),
foreign key(Student_ID) references
student02(Student_ID)
);

insert into Enrollments
values
(1,101,'Python');

insert into Enrollments
values
(2,102,'SQL');

create table Students_Auto(
Student_ID int auto_increment primary key,
Student_Name varchar(100)
);

insert into Students_Auto(Student_Name)
values
('Rahul');

insert into Students_Auto(Student_Name)
values
('Priya');

select * from Students_Auto;

delete from Students_Auto
where Student_ID=1;

insert into Students_Auto(Student_Name)
values
('Neha');

select * from Students_Auto;

-- Q1 insert two valid student records.
INSERT INTO student02
VALUES
(109, 'Rohit Mehta', 20, 'Male', 'Computer Science', 5, 8.45, 'Pune',
'rohit.mehta@example.com', '9876543218', '2022-08-01', 92000.00, 90.50);

INSERT INTO student02
VALUES
(110, 'Anjali Verma', 19, 'Female', 'Electronics', 3, 8.90, 'Delhi',
'anjali.verma@example.com', '9876543219', '2023-08-12', 91000.00, 94.00);

-- Q2 try inserting a duplicate Student_ID.
INSERT INTO student02
VALUES
(103, 'Karan Malhotra', 20, 'Male', 'Civil', 4, 7.80, 'Noida',
'karan@example.com', '9876543220', '2023-08-10', 85000.00, 88.00);

-- Q3 try inserting a duplicate email.
INSERT INTO student02
VALUES
(111, 'Karan Malhotra', 20, 'Male', 'Civil', 4, 7.80, 'Noida',
'aman.singh@example.com', '9876543221', '2023-08-10', 85000.00, 88.00);

-- Q4 try inserting age=15.
INSERT INTO student02
VALUES
(112, 'Riya Sharma', 15, 'Female', 'Mechanical', 1, 8.10, 'Jaipur',
'riya.sharma@example.com', '9876543222', '2025-08-01', 90000.00, 91.00);

-- Q5 try inserting CGPA=11.
-- Q6 try inserting Fees=-1000.
-- Q7 insert one record without City. What value is stored?
-- Q8 insert one enrollment for Student_ID =101.
-- Q9 try inserting Student_Id =999 into Enrollments.