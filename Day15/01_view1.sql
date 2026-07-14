USE sql_training;

/*view*/
create view employee_basic as
select first_name,last_name,department,salary from employees;

select * from employee_basic;

show full tables where Table_type='view';

desc employee_basic;

/*view with filter*/
create view high_salary as select * from employees where salary>70000;

select * from high_salary;

/*update through view*/
-- updating a view updates the base table (when view is updateable)
update employee_basic set salary=75000 where first_name='Neha';
select * from employee_basic;
select first_name,salary from employees where first_name='Neha';

/*replace and drop view*/
create or replace view employee_basic as select first_name,department,salary
from employees;

select * from employee_basic;

create view temp_view as select * from employees;
drop view temp_view;

-- it department only
create view IT_employee as select * from employees where department in ('IT');
select * from IT_employee;

-- create name and salary view
create view namewithsalary as select first_name, salary from employees;
select * from namewithsalary;

-- employees hired after 2023
CREATE VIEW employees_hired_after_2023 AS SELECT * FROM employees
WHERE YEAR(hire_date) > 2023;
SELECT *FROM employees_hired_after_2023;