create database CompanyDB;

use CompanyDB;

create table employees
(
emp_id int primary key,
emp_name varchar(60),
department varchar(30),
salary decimal(10,3)
);

insert into employees values
(101,'Rahul','IT',55000),
(102,'Aman','HR',42000),
(103,'Priya','Finance',70000),
(104,'Sneha','IT',60000),
(105,'Rohit','Sales',45000),
(106,'Kiran','HR',52000);

select * from employees;

/*
Normally sql statements end with ;
Inside a procedure there can be multiple sql statements.
So we temporarily change the delimeter.
*/


-- Syntax
delimiter //
create procedure ShowAllEmployees()
begin
select * from employees;
end //
delimiter ;
-- execute
call ShowAllEmployees();


-- using where in procedure
delimiter //
create procedure ShowITEmployees()
begin
select * from employees
where department in ('IT');
end //
delimiter ;
call ShowITEmployees();


-- procedure with input parameter
delimiter //
create procedure EmployeeDepartment(in  dept varchar(30))
begin
select * from employees
where department = dept;
end //
delimiter ;
call EmployeeDepartment('IT');
call EmployeeDepartment('HR');


delimiter //
create procedure SalaryGreaterThan(in amount decimal(10,3))
begin
select * from employees
where salary>amount;
end //
delimiter ;
call SalaryGreaterThan(50000);


delimiter //
create procedure EmployeeFilter(in dept varchar(30), in minSalary decimal(10,2))
begin
select * from employees
where department=dept and salary >= minSalary;
end //
delimiter ;
call EmployeeFilter('IT',51000);


-- view existing procedures
show procedure status;
show create procedure ShowAllEmployees;


-- drop procedure
drop procedure EmployeeFilter;



/* Practice Questions */

-- create a procedure to display all employees
delimiter //
create procedure allEmp()
begin
select * from employees;
end //
delimiter ;

-- create a procedure to display all hr employees
delimiter //
create procedure hrEmp()
begin
select * from employees
where department='HR';
end //
delimiter ;

-- create a procedure that accepts department as input
delimiter //
create procedure empDep(in dept varchar(30))
begin
select * from employees
where department=dept;
end //
delimiter ;

-- create a procedure that accepts minimum salary
delimiter //
create procedure minSal(in sal decimal(10,3))
begin
select * from employees
where salary>=sal;
end //
delimiter ;

-- create a procedure with department and salary inputs
delimiter //
create procedure deptMinSal(in dept varchar(30), in sal decimal(10,3))
begin
select * from employees
where department=dept and salary>=sal;
end //
delimiter ;

-- execute each procedure with different values
call allEmp();
call hrEmp();
call empDep('Sales');
call deptMinSal('HR',45000);

-- display employees earning more than 60000
delimiter //
create procedure EmployeesAbove60000()
begin
    select *
    from employees
    where salary > 60000;
end //
delimiter ;
call EmployeesAbove60000();

-- display finance employees
delimiter //
create procedure FinanceEmployees()
begin
    select *
    from employees
    where department = 'Finance';
end //
delimiter ;
call FinanceEmployees();

-- view procedure definition
show create procedure FinanceEmployees;

-- drop a procedure and recreate it
drop procedure FinanceEmployees;
delimiter //
create procedure FinanceEmployees()
begin
    select *
    from employees
    where department in ('Finance');
end //
delimiter ;