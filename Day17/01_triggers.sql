/*
A Trigger is a special type of stored program that automatically executes when a specific event occurs on a table.
The events are:INSERT, UPDATE, DELETE
Unlike a stored procedure, you do not call a trigger manually. It runs automatically.
*/

create database day17_triggers;
use day17_triggers;

create table employee_logs
(
log_id int primary key auto_increment,
emp_id int,
action_type varchar(30),
old_salary decimal(10,2),
new_salary decimal(10,2),
action_time timestamp default current_timestamp
);

create table employees
(
emp_id int primary key auto_increment,
emp_name varchar(60),
department varchar(30),
salary decimal(10,2)
);


/* Before insert trigger */
delimiter $$
create trigger trg_before_import_salary
before insert
on employees
for each row
begin
	if new.salary<10000 then
		signal sqlstate '45000'
		set message_text='Salary cannot be below 10000';
	end if;
end$$
delimiter ;

-- test validation 1
insert into employees(emp_name,department,salary)
values('Amit','IT',25000);
-- test validation 2
insert into employees(emp_name,department,salary)
values('Sonam','HR',8000);

select * from employees;


/* After insert trigger */
delimiter $$
create trigger trg_after_insert_log
after insert
on employees
for each row
begin
	insert into employee_logs(emp_id,action_type,new_salary)
    values(new.emp_id,'INSERT',new.salary);
end$$
delimiter ;

insert into employees(emp_name,department,salary)
values('Neha','Finance',45000);

select * from employee_logs;


/* Before update trigger */
-- To prevent negative salary
delimiter $$
create trigger trg_before_update
before update
on employees
for each row
begin
	if new.salary<=0 then
		signal sqlstate '45000'
		set message_text='Invalid Salary';
	end if;
end$$
delimiter ;

update employees
set salary=32000
where emp_id=1;

update employees
set salary=-500
where emp_id=1;


-- Show
show triggers;

-- Drop: drop trigger triggerName;

