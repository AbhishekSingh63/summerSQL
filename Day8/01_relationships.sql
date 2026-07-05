use college01;

SELECT * FROM student02;


SELECT * FROM Attendance;


SELECT * FROM Enrollments;


SELECT * FROM Students_Auto;


SHOW TABLES;

CREATE TABLE departments (
	department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    hod_name VARCHAR(100)
    );
    

INSERT INTO departments
VALUES
(10, 'Computer Science', 'Dr. Amit Sharma'),
(20, 'Information Technology', 'Dr. Neha Verma'),
(30, 'Electronics', 'Dr. Rajesh Kumar'),
(40, 'Mechanical Engineering', 'Dr. Priya Singh'),
(50, 'Civil Engineering', 'Dr. Anil Gupta');


CREATE TABLE faculty(
	faculty_id INT PRIMARY KEY,
    faculty_name VARCHAR(100),
    department_id INT,
    FOREIGN KEY(department_id) REFERENCES departments(department_id)
);



INSERT INTO faculty
VALUES
(1, 'Rahul Sharma', 10),
(2, 'Priya Verma', 20),
(3, 'Amit Kumar', 30),
(4, 'Neha Singh', 40),
(5, 'Anil Gupta', 50);


CREATE TABLE courses(
	course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    faculty_id INT,
    duration_months INT,
    FOREIGN KEY(faculty_id) REFERENCES faculty(faculty_id)
);

INSERT INTO courses
VALUES
(501, 'SQL', 1, 2),
(502, 'Java Programming', 2, 6),
(503, 'Python', 3, 4),
(504, 'Power BI', 4, 5),
(505, 'DSA', 5, 6);


DESC departments;

DESC faculty;

DESC courses; 


DESC student02;


DESC attendance;

DESC Enrollments;

DESC Students_Auto;

-- to check entire commands

SHOW CREATE TABLE student02;


-- no connection in students with department table so modify students table and add department_id


ALTER TABLE student02
ADD COLUMN department_id INT;

UPDATE student02 
SET department_id = 10
WHERE student_id IN (101,102,103);


UPDATE student02 
SET department_id = 20
WHERE student_id IN (104,105,106);


ALTER TABLE student02
ADD CONSTRAINT fk_students_department
FOREIGN KEY (department_id) 
REFERENCES departments(department_id);


DESC student02;


DESC faculty;

DESC courses;

DESC departments;

SELECT * FROM faculty;

ALTER TABLE student02
ADD COLUMN faculty_id INT;

UPDATE student02 
SET faculty_id = 1
WHERE student_id IN (101,102);


UPDATE Students 
SET faculty_id = 2
WHERE student_id IN (103,104);

UPDATE student02 
SET faculty_id = 3
WHERE student_id IN (105,108);

SELECT * FROM student02;


ALTER TABLE student02
ADD CONSTRAINT fk_students_courses
FOREIGN KEY (faculty_id) 
REFERENCES courses(faculty_id); 


-- relationships :- one to one, one to many, many to one, many to many

-- ONE TO ONE

SELECT department_id, COUNT(*) AS total_students
FROM student02
GROUP BY department_id;


-- MANY TO MANY

SELECT course_id, COUNT(*) AS enrolled_students
from student02
GROUP BY course_id;



-- A new model 

-- FOOD DELIVERY APPLICATION

DROP TABLE customers;
DROP TABLE restaurants;
DROP TABLE delivery_partners;
DROP TABLE delivery_orders;

CREATE DATABASE RESTAURANT;

USE RESTAURANT;

DROP TABLE customers;
DROP TABLE resturants;
DROP TABLE delivery_partners;
DROP TABLE delivery_orders;



CREATE TABLE customers(
	customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(100)
);


CREATE TABLE restaurants(
	restaurant_id INT PRIMARY KEY,
    restaurant_name VARCHAR(100),
    city VARCHAR(100)
);
    
    
CREATE TABLE delivery_partners(
	partner_id INT PRIMARY KEY,
    partner_name VARCHAR(100),
    vehicle VARCHAR(100)
);
    
CREATE TABLE delivery_orders(
	order_id INT PRIMARY KEY,
    customer_id INT,
    restaurant_id INT,
    partner_id INT,
    order_amount DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY(customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY(partner_id) REFERENCES delivery_partners(partner_id),
    FOREIGN KEY(restaurant_id) REFERENCES restaurants(restaurant_id)
);

SHOW TABLES;