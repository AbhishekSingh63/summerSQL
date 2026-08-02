create database blood_bank_db;
use blood_bank_db;



/* -------CREATING TABLES------- */

-- donors table
CREATE TABLE donors (
    donor_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_name VARCHAR(100) NOT NULL,
    age INT NOT NULL CHECK(age >= 18 AND age <= 65),
    gender VARCHAR(10) NOT NULL CHECK(gender IN ('Male','Female','Other')),
    blood_group VARCHAR(5) NOT NULL,
    phone VARCHAR(15) UNIQUE,
    city VARCHAR(50) NOT NULL,
    last_donation_date DATE
);

-- hospitals table
CREATE TABLE hospitals (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    contact VARCHAR(15) UNIQUE
);

-- patients table
CREATE TABLE patients (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_name VARCHAR(100) NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    disease VARCHAR(100),
    phone VARCHAR(15) UNIQUE,
    hospital_id INT NOT NULL,
    FOREIGN KEY (hospital_id)
        REFERENCES hospitals(hospital_id)
);

-- donations table
CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    donation_date DATE NOT NULL,
    units INT NOT NULL CHECK(units > 0),
    FOREIGN KEY (donor_id)
        REFERENCES donors(donor_id)
);

-- blood_stock table
CREATE TABLE blood_stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    blood_group VARCHAR(5) NOT NULL UNIQUE,
    units_available INT NOT NULL DEFAULT 0 CHECK(units_available >= 0)
);

-- blood_requests table
CREATE TABLE blood_requests (
    request_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    blood_group VARCHAR(5) NOT NULL,
    units_required INT NOT NULL CHECK(units_required > 0),
    request_date DATE NOT NULL,
    status VARCHAR(20) DEFAULT 'Pending',
    FOREIGN KEY (patient_id)
        REFERENCES patients(patient_id)
);

-- blood_issue table
CREATE TABLE blood_issue (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    request_id INT NOT NULL,
    stock_id INT NOT NULL,
    units_issued INT NOT NULL CHECK(units_issued > 0),
    issue_date DATE NOT NULL,
    FOREIGN KEY (request_id)
        REFERENCES blood_requests(request_id),
    FOREIGN KEY (stock_id)
        REFERENCES blood_stock(stock_id)
);



/* -------INSERTING VALUES IN ALL TABLE------- */

-- 1. DONORS
INSERT INTO donors (donor_name, age, gender, blood_group, phone, city, last_donation_date) VALUES
('Rahul Sharma', 25, 'Male', 'A+', '9876543210', 'Delhi', '2026-05-10'),
('Priya Singh', 30, 'Female', 'B+', '9876543211', 'Mumbai', '2026-06-01'),
('Amit Verma', 22, 'Male', 'O+', '9876543212', 'Noida', '2026-04-15'),
('Sneha Kapoor', 28, 'Female', 'AB+', '9876543213', 'Delhi', '2026-03-20'),
('Vikram Rao', 35, 'Male', 'O-', '9876543214', 'Bangalore', '2026-06-10'),
('Anjali Mehta', 40, 'Female', 'A-', '9876543215', 'Pune', '2026-02-25'),
('Karan Malhotra', 27, 'Male', 'B-', '9876543216', 'Delhi', '2026-05-30'),
('Neha Joshi', 33, 'Female', 'AB-', '9876543217', 'Mumbai', '2026-01-18'),
('Suresh Nair', 45, 'Male', 'O+', '9876543218', 'Chennai', '2026-06-20'),
('Pooja Reddy', 24, 'Female', 'A+', '9876543219', 'Hyderabad', '2026-07-05');

-- 2. HOSPITALS
INSERT INTO hospitals (hospital_name, city, contact) VALUES
('AIIMS Delhi', 'Delhi', '01126588500'),
('Apollo Hospital', 'Chennai', '04428290200'),
('Fortis Hospital', 'Mumbai', '02267542525'),
('Manipal Hospital', 'Bangalore', '08025023200'),
('Max Super Speciality', 'Delhi', '01126515050'),
('KIMS Hospital', 'Hyderabad', '04044885000');

-- 3. PATIENTS
INSERT INTO patients (patient_name, blood_group, disease, phone, hospital_id) VALUES
('Ramesh Gupta', 'A+', 'Thalassemia', '9123456780', 1),
('Sunita Devi', 'O+', 'Anemia', '9123456781', 2),
('Manoj Tiwari', 'B+', 'Dengue', '9123456782', 3),
('Kavita Yadav', 'AB+', 'Surgery - Cardiac', '9123456783', 4),
('Arjun Kumar', 'O-', 'Accident Trauma', '9123456784', 5),
('Meena Kumari', 'A-', 'Leukemia', '9123456785', 6),
('Deepak Chauhan', 'B-', 'Surgery - Orthopedic', '9123456786', 1),
('Rekha Singh', 'AB-', 'Childbirth Complication', '9123456787', 3);

-- 4. DONATIONS
INSERT INTO donations (donor_id, donation_date, units) VALUES
(1, '2026-05-10', 1),
(2, '2026-06-01', 1),
(3, '2026-04-15', 2),
(4, '2026-03-20', 1),
(5, '2026-06-10', 1),
(6, '2026-02-25', 1),
(7, '2026-05-30', 2),
(8, '2026-01-18', 1),
(9, '2026-06-20', 1),
(10, '2026-07-05', 1),
(1, '2025-12-01', 1),
(3, '2025-11-05', 1);

-- 5. BLOOD_STOCK
INSERT INTO blood_stock (blood_group, units_available) VALUES
('A+', 25),
('A-', 10),
('B+', 20),
('B-', 8),
('O+', 30),
('O-', 12),
('AB+', 15),
('AB-', 6);

-- 6. BLOOD_REQUESTS
INSERT INTO blood_requests (patient_id, blood_group, units_required, request_date, status) VALUES
(1, 'A+', 2, '2026-07-01', 'Approved'),
(2, 'O+', 3, '2026-07-05', 'Approved'),
(3, 'B+', 1, '2026-07-10', 'Pending'),
(4, 'AB+', 2, '2026-07-12', 'Approved'),
(5, 'O-', 4, '2026-07-15', 'Approved'),
(6, 'A-', 1, '2026-07-18', 'Pending'),
(7, 'B-', 2, '2026-07-20', 'Rejected'),
(8, 'AB-', 1, '2026-07-22', 'Pending');

-- 7. BLOOD_ISSUE
INSERT INTO blood_issue (request_id, stock_id, units_issued, issue_date) VALUES
(1, 1, 2, '2026-07-01'),
(2, 5, 3, '2026-07-05'),
(4, 7, 2, '2026-07-12'),
(5, 6, 4, '2026-07-15');



/* -------SECTION 3: UPDATE, DELETE & ALTER------- */

-- UPDATE
UPDATE donors
SET city='Gurugram'
WHERE donor_id=3;

UPDATE blood_requests
SET status='Approved'
WHERE request_id=3;

-- DELETE
DELETE FROM blood_requests
WHERE request_id=8;

DELETE FROM patients
WHERE patient_id=8;

-- ALTER
ALTER TABLE donors
ADD email VARCHAR(100);

ALTER TABLE donors
MODIFY city VARCHAR(80);



/* -------SECTION 4: WHERE, ORDER BY, AGGREGATE, GROUP BY, HAVING------- */

-- Donors from Delhi
SELECT * FROM donors
WHERE city='Delhi';

-- O+ Donors
SELECT donor_name,blood_group
FROM donors
WHERE blood_group='O+';

-- Blood stock greater than 10 units
SELECT * FROM blood_stock
WHERE units_available>10
ORDER BY units_available DESC;

-- Total donors
SELECT COUNT(*) AS total_donors
FROM donors;

-- Total donated units
SELECT SUM(units) AS total_units
FROM donations;

-- Average donor age
SELECT AVG(age) AS average_age
FROM donors;

-- Maximum stock
SELECT MAX(units_available) AS maximum_stock
FROM blood_stock;

-- Minimum stock
SELECT MIN(units_available) AS minimum_stock
FROM blood_stock;

-- Blood group wise donor count
SELECT blood_group,COUNT(*) AS donors
FROM donors
GROUP BY blood_group;

-- Blood groups having more than one donor
SELECT blood_group,COUNT(*) AS donors
FROM donors
GROUP BY blood_group
HAVING COUNT(*)>1;



/* -------SECTION 5: JOINS------- */

-- INNER JOIN
SELECT d.donor_name,d.blood_group,don.donation_date,don.units
FROM donors d
INNER JOIN donations don
ON d.donor_id=don.donor_id;

-- LEFT JOIN
SELECT h.hospital_name,p.patient_name
FROM hospitals h
LEFT JOIN patients p
ON h.hospital_id=p.hospital_id;



/* -------SECTION 6: SIMPLE SUBQUERIES------- */

-- Donors older than average age
SELECT donor_name,age
FROM donors
WHERE age>(
SELECT AVG(age) FROM donors);

-- Blood groups below average stock
SELECT blood_group,units_available
FROM blood_stock
WHERE units_available<(
SELECT AVG(units_available) FROM blood_stock);

-- Patients from Delhi hospitals
SELECT patient_name
FROM patients
WHERE hospital_id IN(
SELECT hospital_id
FROM hospitals
WHERE city='Delhi');



/* -------SECTION 7: VIEW, FUNCTION, TRIGGER & INDEX------- */

CREATE VIEW donor_details AS
SELECT donor_name,blood_group,city
FROM donors;

DELIMITER $$
CREATE FUNCTION total_units(bg VARCHAR(5))
RETURNS INT
DETERMINISTIC
BEGIN
DECLARE total INT;
SELECT units_available
INTO total
FROM blood_stock
WHERE blood_group=bg;
RETURN total;
END$$

CREATE TRIGGER update_last_donation
AFTER INSERT ON donations
FOR EACH ROW
BEGIN
UPDATE donors
SET last_donation_date=NEW.donation_date
WHERE donor_id=NEW.donor_id;
END$$
DELIMITER ;

CREATE INDEX idx_city
ON donors(city);



/* -------SECTION 8: PRACTICAL REPORTS------- */

SELECT COUNT(*) AS total_donors FROM donors;

SELECT SUM(units_available) AS total_blood_units FROM blood_stock;

SELECT * FROM donors WHERE city='Delhi';

SELECT * FROM donors WHERE blood_group='O+';

SELECT h.hospital_name,COUNT(p.patient_id) AS total_patients
FROM hospitals h
LEFT JOIN patients p
ON h.hospital_id=p.hospital_id
GROUP BY h.hospital_name;

SELECT * FROM blood_stock
WHERE units_available<10;

SELECT * FROM blood_requests
WHERE status='Pending';

SELECT d.donor_name,SUM(dn.units) AS total_units
FROM donors d
JOIN donations dn
ON d.donor_id=dn.donor_id
GROUP BY d.donor_name
ORDER BY total_units DESC
LIMIT 1;

SELECT city,COUNT(*) AS donor_count
FROM donors
GROUP BY city;

SELECT * FROM blood_stock;