USE sql_training;

/*Indexes*/

-- create index
create index idx_email on employees(email);
show index from employees;

-- composite index
-- leftmost prefix rule: (department,salary) helps department
create index idx_dept_salary on employees(department,salary);
show index from employees;

-- unique index
create unique index idx_id on employees(emp_id);
show index from employees;

-- drop index
drop index idx_email on employees;
show index from employees;


/*Practice Questions on view and indexes*/
-- create a view names top_paid_it_employees that contains only employees from the it department having salary greater than 70000. display the records ordered by salary in descending order.
CREATE VIEW top_paid_it_employees AS
SELECT *
FROM employees
WHERE department = 'IT'
  AND salary > 70000
ORDER BY salary DESC;
SELECT *
FROM top_paid_it_employees;

-- create a view named annual_salary_view displaying employeeId, full name (first+last name), department,monthly salary and annual salary(salary*12).
CREATE VIEW annual_salary_view AS
SELECT emp_id,
       CONCAT(first_name,' ',last_name) AS full_name,
       department,
       salary AS monthly_salary,
       ROUND(salary*12,2) AS annual_salary
FROM employees;
SELECT *
FROM annual_salary_view;

-- create a view named department_salary-summary showing department, total employees, average salary and highest salary.
CREATE VIEW department_salary_summary AS
SELECT department,
       COUNT(*) AS total_employees,
       AVG(salary) AS average_salary,
       MAX(salary) AS highest_salary
FROM employees
GROUP BY department;
SELECT *
FROM department_salary_summary;

-- create a view displaying employees who joined after 1 january 2023. show employee name, department, hire date and city.
CREATE VIEW employees_joined_after_2023 AS
SELECT CONCAT(first_name,' ',last_name) AS employee_name,
       department,
       hire_date
FROM employees
WHERE hire_date > '2023-01-01';
SELECT *
FROM employees_joined_after_2023;

-- create a view containing employees whose salary is greater than the average salary of all employees. display name, department and salary
CREATE VIEW above_average_salary AS
SELECT CONCAT(first_name,' ',last_name) AS employee_name,
       department,
       salary
FROM employees
WHERE salary >
(
    SELECT AVG(salary)
    FROM employees
);
SELECT *
FROM above_average_salary;

-- the hr team freguently searches employees using there email address. create an appropriate index, verify it, and then delete it.
CREATE INDEX idx_email
ON employees(email);

SHOW INDEX
FROM employees;

DROP INDEX idx_email
ON employees;

SHOW INDEX
FROM employees;

-- create a view showing only those departments where average salary is greater than 65,000. display department, number of employees and average salary.
CREATE VIEW high_salary_departments AS
SELECT department,
       COUNT(*) AS total_employees,
	   AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 65000;
SELECT *
FROM high_salary_departments;

-- create a view named employee_report containing employeeid, full name, department, city, salary and a salary category using CASE: high(>=80000), medium(60000-79999), low(<60000)