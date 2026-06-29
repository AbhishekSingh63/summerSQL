use college01;

/* changing table structure */
ALTER TABLE student01
RENAME COLUMN name TO student_name;

ALTER TABLE student01
ADD COLUMN age INT,
ADD COLUMN gender VARCHAR(10),
ADD COLUMN semester INT,
ADD COLUMN phoneno VARCHAR(15),
ADD COLUMN admissionDate DATE,
ADD COLUMN fees DECIMAL(10,2),
ADD COLUMN attendance DECIMAL(5,2);

ALTER TABLE student01
MODIFY COLUMN cgpa DECIMAL(3,2),
MODIFY COLUMN city VARCHAR(50),
MODIFY COLUMN email VARCHAR(100);

select * from student01;

SET SQL_SAFE_UPDATES = 0;

/* update command */
update student01
set
age=20,
gender='male',
semester=5,
phoneno='7637546472',
admissionDate='2024-08-01',
fees=99000.00,
attendance=91.00
where student_id=101;

update student01
set
age=20,
gender='male',
semester=5,
phoneno='7935756472',
admissionDate='2024-07-01',
fees=99500.00,
attendance=71.00
where student_id=102;

update student01
set
age=21,
gender='female',
semester=7,
phoneno='7637526512',
admissionDate='2023-08-01',
fees=102000.00,
attendance=87.00
where student_id=103;

update student01
set
age=22,
gender='male',
semester=8,
admissionDate='2022-08-01',
fees=89000.00,
attendance=79.00
where student_id=104;

update student01
set
age=21,
gender='female',
semester=5,
phoneno='9855546472',
admissionDate='2024-07-05',
fees=110000.00,
attendance=87.00
where student_id=105;

update student01
set
age=20,
gender='female',
semester=3,
phoneno='7637578962',
admissionDate='2025-08-01',
fees=95000.00,
attendance=96.00
where student_id=106;

update student01
set
age=20,
gender='female',
semester=3,
admissionDate='2025-08-01',
fees=150000.00,
attendance=65.00
where student_id=107;

update student01
set
age=20,
gender='male',
semester=5,
phoneno='9454546472',
admissionDate='2024-06-01',
fees=79000.00,
attendance=91.00
where student_id=108;

select * from student01;