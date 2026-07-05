use college01;

-- we use keys and constraints for database designing

-- keys

-- Primary ;- Unique, Not Null, not duplicate values, One key per table

-- Foreign keys :- Links one table to another

-- Constraints - Unique, Not Null, Check, Default

-- Candidate :- Eligible to become a PK, Can be more than 1

-- Composite :- When no PK is there then Taking multiple columns to combine to generate unique and not null property to act as PK

CREATE TABLE student02(
    Student_ID INT PRIMARY KEY,
    Student_Name VARCHAR(100) NOT NULL,
    Age INT CHECK (Age >= 18),
    Gender VARCHAR(10),
    Branch VARCHAR(30) NOT NULL,
    Semester INT CHECK (Semester BETWEEN 1 AND 8),
    CGPA DECIMAL(4,2) CHECK (CGPA BETWEEN 0 AND 10),
    City VARCHAR(50) DEFAULT 'Delhi',
    Email VARCHAR(100) UNIQUE,
    Phone_No VARCHAR(15) UNIQUE,
    Admission_Date DATE,
    Fees DECIMAL(10,2) CHECK (Fees > 0),
    Attendance DECIMAL(5,2) CHECK (Attendance BETWEEN 0 AND 100)
);

SELECT * FROM student02;

DESC student02;

INSERT INTO student02
VALUES
(101, 'Rahul Sharma', 20, 'Male', 'Computer Science', 4, 8.75, 'Delhi', 
'rahul.sharma@example.com', '9876543210', '2023-08-10', 85000.00, 92.50);

INSERT INTO student02
VALUES
(102, 'Priya Verma', 19, 'Female', 'Electronics', 2, 9.20, 'Mumbai', 
'priya.verma@example.com', '9876543211', '2024-07-15', 80000.00, 88.75);

INSERT INTO student02
VALUES
(103, 'Aman Singh', 19, 'Male', 'Mechanical', 6, 7.95, 'Jaipur', 
'aman.singh@example.com', '9876543212', '2022-08-05', 90000.00, 95.00);

SELECT * FROM student02;

INSERT INTO student02(Student_id)
VALUES (101);

INSERT INTO student02 (Age)
VALUES (15);

SELECT Student_Name FROM student02
WHERE CGPA >= 9.00;

SELECT Student_Name FROM student02
WHERE Attendance < 75;

SELECT Student_Name FROM student02
ORDER BY Fees DESC
LIMIT 10;

SELECT city, count(Student_Name) FROM student02
GROUP BY city;

SELECT branch, AVG(CGPA) FROM student02
GROUP BY branch;

SELECT Semester, count(Student_Name) FROM student02
GROUP BY Semester;

SELECT branch FROM student02
GROUP BY branch
HAVING count(Student_Name) > 30;

SELECT * FROM student02
WHERE Admission_Date = "2025";

SELECT Student_Name FROM student02
WHERE city in ("Delhi" , "Noida");

INSERT INTO student02
VALUES
(104, 'Priya Sharma', 20, 'Female', 'Computer Science', 5, 8.75, 'Mumbai',
'priya.sharma@example.com', '9876543213', '2022-07-15', 95000.00, 92.50),
(105, 'Rahul Verma', 21, 'Male', 'Electrical', 7, 7.80, 'Chandigarh',
'rahul.verma@example.com', '9876543214', '2021-08-10', 88000.00, 89.00),
(106, 'Neha Gupta', 18, 'Female', 'Civil', 2, 8.20, 'Lucknow',
'neha.gupta@example.com', '9876543215', '2024-08-01', 85000.00, 94.50),
(107, 'Arjun Kumar', 22, 'Male', 'Data Science', 8, 9.10, 'Bangalore',
'arjun.kumar@example.com', '9876543216', '2020-08-12', 100000.00, 97.25),
(108, 'Sneha Patel', 19, 'Female', 'Information Technology', 4, 8.60, 'Ahmedabad',
'sneha.patel@example.com', '9876543217', '2023-08-20', 92000.00, 91.75);