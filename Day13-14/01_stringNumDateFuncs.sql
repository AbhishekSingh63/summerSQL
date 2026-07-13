/* Things done on Day-13 -
Diff. between Scalar and Non Scalar functions
String functions
*/

/* Day-14 */
CREATE DATABASE IF NOT EXISTS sql_training;

USE sql_training;

DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    emp_id        INT PRIMARY KEY AUTO_INCREMENT,
    first_name    VARCHAR(50),
    last_name     VARCHAR(50),
    email         VARCHAR(100),
    department    VARCHAR(50),
    salary        DECIMAL(10,2),
    bonus_pct     DECIMAL(5,2),
    hire_date     DATE,
    birth_date    DATE,
    last_login    DATETIME
);

ALTER TABLE employees
MODIFY salary DECIMAL(10,3);

INSERT INTO employees
(first_name, last_name, email, department, salary, bonus_pct, hire_date, birth_date, last_login) VALUES
('Amit',    'Sharma',   'amit.sharma@company.com',    'Sales',       55000.756, 8.5,  '2019-03-15', '1990-06-12', '2026-07-01 09:15:00'),
('Priya',   'Verma',    'priya.verma@company.com',    'Marketing',   62000.333, 10.25,'2020-07-22', '1988-11-25', '2026-07-05 14:42:00'),
('Rahul',   'Nair',     'rahul.nair@company.com',     'IT',          78500.999, 12.0, '2018-01-10', '1992-02-18', '2026-07-10 08:05:00'),
('Sneha',   'Iyer',     'sneha.iyer@company.com',     'Finance',     49500.125, 6.75, '2021-11-05', '1995-09-30', '2026-06-28 17:30:00'),
('Karan',   'Malhotra', 'karan.malhotra@company.com', 'IT',          91000.5,   15.0, '2016-05-19', '1985-04-02', '2026-07-11 11:20:00'),
('Neha',    'Gupta',    'neha.gupta@company.com',     'Sales',       53000.0,   9.4,  '2022-02-28', '1998-01-15', NULL),
('Vikram',  'Singh',    'vikram.singh@company.com',   'HR',          47000.45,  5.5,  '2023-08-14', '1993-07-08', '2026-07-12 19:10:00'),
('Ananya',  'Das',      'ananya.das@company.com',     'Marketing',   58000.876, 7.2,  '2017-09-01', '1991-12-20', '2026-07-09 10:00:00'),
('Rohan',   'Kapoor',   'rohan.kapoor@company.com',   'Finance',     67000.654, 11.1, '2019-12-12', '1989-03-27', '2026-07-02 13:55:00'),
('Ishita',  'Joshi',    'ishita.joshi@company.com',   'HR',          51000.2,   8.0,  '2020-04-04', '1996-10-10', '2026-07-07 16:25:00');

-- Numeric functions
/*
Rounding and Truncation Functions
ROUND(number, decimals): Rounds a value to a specified number of decimal places.
CEILING(number) / CEIL(number): Returns the smallest integer greater than or equal to the number.
FLOOR(number): Returns the largest integer less than or equal to the number.
TRUNCATE(number, decimals) / TRUNC(number): Cuts off decimal places without rounding.

Basic Arithmetic and Math Functions
ABS(number): Returns the absolute (positive) value of a number.
MOD(dividend, divisor): Returns the remainder of a division operation.
SIGN(number): Returns -1 for negative numbers, 0 for zero, and 1 for positive numbers.
SQRT(number): Calculates the square root of a positive number.
SQUARE(number): Returns the square of a number (primarily SQL Server).
POWER(base, exponent): Raises a number to the specified power.

Exponential and Logarithmic Functions
EXP(number): Returns e raised to the power of the specified number.
LN(number) / LOG(number): Calculates the natural logarithm of a number.
LOG10(number): Calculates the base-10 logarithm of a number.

Trigonometric Functions
SIN(radians) / COS(radians) / TAN(radians): Standard sine, cosine, and tangent operations.
ASIN(number) / ACOS(number) / ATAN(number): Inverse trigonometric functions returning radians.
COT(radians): Calculates the cotangent of an angle.
DEGREES(radians): Converts a radian value into degrees.
RADIANS(degrees): Converts a degree value into radians.
PI(): A constant function that returns the mathematical value of π (3.14159...).

Random Numbers
RAND() / RANDOM(): Generates a pseudo-random floating-point value between 0 and 1.
*/

-- Current date and time functions
/*
curdate()
current_date()
curtime()
current_time()
now()
sysdate()
current_timestamp()
*/

-- Extracting parts of a date
/*
year()
month()
monthname()
day()
dayname()
dayofmonth()
dayofweek()
dayofyear()
quarter()
week()
hour()
minute()
second()
*/

-- Date Arithmetic functions
/*
date_add()
date_sub()
adddate()
subdate()
*/

-- format functions
/*
date_format()
time_format()
*/

/*
str_to_date()
cast()
*/


/*Numeric function Questions*/
-- round every employee's salary to the nearest whole number.
SELECT emp_id, salary, ROUND(salary) AS rounded_salary
FROM employees;

-- display each salary truncated to 1 decimal place (no rounding).
SELECT emp_id, first_name, TRUNCATE(salary, 1) AS truncated_salary
FROM employees;

-- calculate each employee's monthly salary (salary/12), rounf to 2 decimals.
SELECT emp_id, first_name, salary, ROUND(salary / 12, 2) AS monthly_salary
FROM employees;

-- calculate the bonus amount (salary*bonus_pct/100) for each employee, rounded to 2 decimal places, and label the column "bonus_amount"
SELECT emp_id, first_name, salary, bonus_pct, ROUND((salary * bonus_pct) / 100, 2) AS bonus_amount
FROM employees;

-- find the diif. between each employee's salary and average salary of all employess's and show its absolute value
SELECT emp_id, first_name, salary,
ABS(salary -
(
SELECT AVG(salary)
FROM employees
)) AS salary_difference
FROM employees;

-- display the ceiling and floor values of each employee's salary side by side
SELECT emp_id, first_name, salary, CEIL(salary) AS ceiling_salary, FLOOR(salary) AS floor_salary
FROM employees;

-- using mod(), list only employees whose emp_id is an odd number
SELECT *
FROM employees
WHERE MOD(emp_id, 2) = 1;

-- find the square root of each employee's salary (just for numeric practice)
SELECT emp_id, salary, sqrt(salary) as sqrtSalary
from employees;

-- among (salary, bonus_pct*10000), display the greater value for each employee using greatest()
SELECT emp_id, first_name, salary, bonus_pct, GREATEST(salary, bonus_pct * 10000) AS greater_value
FROM employees;


/*Date and Time function Questions*/
-- display each employee's hire_date formatted as ""dd month yyyy".
SELECT emp_id, first_name, hire_date, DATE_FORMAT(hire_date, '%d %M %Y') AS formatted_hire_date
FROM employees;

-- calculate the exact number of days each employee has worked at the company (from hire_date to today).
SELECT emp_id, first_name, hire_date, DATEDIFF(CURDATE(), hire_date) AS days_worked
FROM employees;

-- calculate each employee's current age in years using birth_date.
SELECT emp_id, first_name, birth_date, TIMESTAMPDIFF(YEAR, birth_date, CURDATE()) AS age
FROM employees;

-- display the day of the week on which each emplaoyee was hired (e.g, "Friday")
SELECT emp_id, first_name, hire_date, DAYNAME(hire_date) AS hire_day
FROM employees;

-- find employees who were hired in the month of "December" (any year).
SELECT emp_id, first_name, hire_date
FROM employees
WHERE MONTHNAME(hire_date) = 'December';

-- add 3 years to each employee's hire date and display it as their "eligible for pension" date.
SELECT emp_id, first_name, hire_date, DATE_ADD(hire_date, INTERVAL 3 YEAR) AS eligible_for_pension
FROM employees;

-- find the last date of the month in which each employee was born
SELECT emp_id, first_name, birth_date, LAST_DAY(birth_date) AS last_day_of_birth_month
FROM employees;

-- list employees hired in the last 5 years, ordered by the most recently hired first
SELECT emp_id, first_name, hire_date
FROM employees
WHERE hire_date >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR)
ORDER BY hire_date DESC;

-- display the year and quarter of each employee's hire_date, e.g., "2019 - Q1".
SELECT emp_id, first_name, hire_date, CONCAT(YEAR(hire_date), ' - Q', QUARTER(hire_date)) AS year_quarter
FROM employees;


-- miscellaneous finctions
/*
makedate()
maketime()
extract(), etc.
*/