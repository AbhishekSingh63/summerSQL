-- Create a new database for the blood bank management system
create database blood_bank_db;

-- Switch to using the newly created database
use blood_bank_db;



/* -------CREATING TABLES------- */

-- Create donors table to store donor information
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

-- Create hospitals table to store hospital details
CREATE TABLE hospitals (
    hospital_id INT AUTO_INCREMENT PRIMARY KEY,
    hospital_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    contact VARCHAR(15) UNIQUE
);

-- Create patients table to store patient records and their hospital mapping
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

-- Create donations table to track blood donation records by donors
CREATE TABLE donations (
    donation_id INT AUTO_INCREMENT PRIMARY KEY,
    donor_id INT NOT NULL,
    donation_date DATE NOT NULL,
    units INT NOT NULL CHECK(units > 0),
    FOREIGN KEY (donor_id)
        REFERENCES donors(donor_id)
);

-- Create blood_stock table to maintain the inventory of available blood groups
CREATE TABLE blood_stock (
    stock_id INT AUTO_INCREMENT PRIMARY KEY,
    blood_group VARCHAR(5) NOT NULL UNIQUE,
    units_available INT NOT NULL DEFAULT 0 CHECK(units_available >= 0)
);

-- Create blood_requests table to track blood requirements for patients
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

-- Create blood_issue table to log when and how much blood is issued against a request
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

-- Insert sample data into the donors table
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

-- Insert sample data into the hospitals table
INSERT INTO hospitals (hospital_name, city, contact) VALUES
('AIIMS Delhi', 'Delhi', '01126588500'),
('Apollo Hospital', 'Chennai', '04428290200'),
('Fortis Hospital', 'Mumbai', '02267542525'),
('Manipal Hospital', 'Bangalore', '08025023200'),
('Max Super Speciality', 'Delhi', '01126515050'),
('KIMS Hospital', 'Hyderabad', '04044885000');

-- Insert sample data into the patients table
INSERT INTO patients (patient_name, blood_group, disease, phone, hospital_id) VALUES
('Ramesh Gupta', 'A+', 'Thalassemia', '9123456780', 1),
('Sunita Devi', 'O+', 'Anemia', '9123456781', 2),
('Manoj Tiwari', 'B+', 'Dengue', '9123456782', 3),
('Kavita Yadav', 'AB+', 'Surgery - Cardiac', '9123456783', 4),
('Arjun Kumar', 'O-', 'Accident Trauma', '9123456784', 5),
('Meena Kumari', 'A-', 'Leukemia', '9123456785', 6),
('Deepak Chauhan', 'B-', 'Surgery - Orthopedic', '9123456786', 1),
('Rekha Singh', 'AB-', 'Childbirth Complication', '9123456787', 3);

-- Insert sample data into the donations table
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

-- Insert sample data into the blood_stock table
INSERT INTO blood_stock (blood_group, units_available) VALUES
('A+', 25),
('A-', 10),
('B+', 20),
('B-', 8),
('O+', 30),
('O-', 12),
('AB+', 15),
('AB-', 6);

-- Insert sample data into the blood_requests table
INSERT INTO blood_requests (patient_id, blood_group, units_required, request_date, status) VALUES
(1, 'A+', 2, '2026-07-01', 'Approved'),
(2, 'O+', 3, '2026-07-05', 'Approved'),
(3, 'B+', 1, '2026-07-10', 'Pending'),
(4, 'AB+', 2, '2026-07-12', 'Approved'),
(5, 'O-', 4, '2026-07-15', 'Approved'),
(6, 'A-', 1, '2026-07-18', 'Pending'),
(7, 'B-', 2, '2026-07-20', 'Rejected'),
(8, 'AB-', 1, '2026-07-22', 'Pending');

-- Insert sample data into the blood_issue table
INSERT INTO blood_issue (request_id, stock_id, units_issued, issue_date) VALUES
(1, 1, 2, '2026-07-01'),
(2, 5, 3, '2026-07-05'),
(4, 7, 2, '2026-07-12'),
(5, 6, 4, '2026-07-15');



/* -------SECTION 3: UPDATE, DELETE & ALTER------- */

-- Update the city of a specific donor
UPDATE donors
SET city='Gurugram'
WHERE donor_id=3;

-- Update the status of a specific blood request to 'Approved'
UPDATE blood_requests
SET status='Approved'
WHERE request_id=3;

-- Delete a specific blood request record
DELETE FROM blood_requests
WHERE request_id=8;

-- Delete a specific patient record
DELETE FROM patients
WHERE patient_id=8;

-- Add an email column to the donors table
ALTER TABLE donors
ADD email VARCHAR(100);

-- Modify the data type size of the city column in the donors table
ALTER TABLE donors
MODIFY city VARCHAR(80);



/* -------SECTION 4: WHERE, ORDER BY, AGGREGATE, GROUP BY, HAVING------- */

-- Retrieve all details of donors who are from Delhi
SELECT * FROM donors
WHERE city='Delhi';

-- Retrieve the names and blood groups of all 'O+' donors
SELECT donor_name,blood_group
FROM donors
WHERE blood_group='O+';

-- Retrieve all blood stock records where available units are greater than 10, ordered descending
SELECT * FROM blood_stock
WHERE units_available>10
ORDER BY units_available DESC;

-- Calculate the total number of donors registered
SELECT COUNT(*) AS total_donors
FROM donors;

-- Calculate the total units of blood donated
SELECT SUM(units) AS total_units
FROM donations;

-- Calculate the average age of all registered donors
SELECT AVG(age) AS average_age
FROM donors;

-- Find the maximum units of blood available in stock
SELECT MAX(units_available) AS maximum_stock
FROM blood_stock;

-- Find the minimum units of blood available in stock
SELECT MIN(units_available) AS minimum_stock
FROM blood_stock;

-- Count the number of donors for each blood group
SELECT blood_group,COUNT(*) AS donors
FROM donors
GROUP BY blood_group;

-- Count the number of donors for each blood group, but only show groups with more than one donor
SELECT blood_group,COUNT(*) AS donors
FROM donors
GROUP BY blood_group
HAVING COUNT(*)>1;



/* -------SECTION 5: JOINS------- */

-- Fetch donor names, blood groups, donation dates, and units by joining donors and donations
SELECT d.donor_name,d.blood_group,don.donation_date,don.units
FROM donors d
INNER JOIN donations don
ON d.donor_id=don.donor_id;

-- Fetch hospital names along with their patients' names, including hospitals with no patients
SELECT h.hospital_name,p.patient_name
FROM hospitals h
LEFT JOIN patients p
ON h.hospital_id=p.hospital_id;



/* -------SECTION 6: SIMPLE SUBQUERIES------- */

-- Retrieve names and ages of donors whose age is strictly greater than the overall average donor age
SELECT donor_name,age
FROM donors
WHERE age>(
SELECT AVG(age) FROM donors);

-- Retrieve blood groups and available units that have less stock than the average stock across all groups
SELECT blood_group,units_available
FROM blood_stock
WHERE units_available<(
SELECT AVG(units_available) FROM blood_stock);

-- Retrieve names of patients who are admitted in hospitals located in Delhi
SELECT patient_name
FROM patients
WHERE hospital_id IN(
SELECT hospital_id
FROM hospitals
WHERE city='Delhi');



/* -------SECTION 7: VIEW, FUNCTION, TRIGGER & INDEX------- */

-- Create a view to easily access donor names, blood groups, and cities without querying the full table
CREATE VIEW donor_details AS
SELECT donor_name,blood_group,city
FROM donors;

-- Create a function to calculate and return the total available units for a given blood group
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

-- Create a trigger that automatically updates a donor's last donation date after a new donation is recorded
CREATE TRIGGER update_last_donation
AFTER INSERT ON donations
FOR EACH ROW
BEGIN
UPDATE donors
SET last_donation_date=NEW.donation_date
WHERE donor_id=NEW.donor_id;
END$$
DELIMITER ;

-- Create an index on the city column of the donors table to speed up city-based searches
CREATE INDEX idx_city
ON donors(city);



/* -------SECTION 8: PRACTICAL REPORTS------- */

-- Get the total count of registered donors
SELECT COUNT(*) AS total_donors FROM donors;

-- Calculate the overall total units of blood currently available in stock
SELECT SUM(units_available) AS total_blood_units FROM blood_stock;

-- Retrieve details of all donors living in Delhi
SELECT * FROM donors WHERE city='Delhi';

-- Retrieve details of all donors with blood group 'O+'
SELECT * FROM donors WHERE blood_group='O+';

-- Count the number of patients registered at each hospital
SELECT h.hospital_name,COUNT(p.patient_id) AS total_patients
FROM hospitals h
LEFT JOIN patients p
ON h.hospital_id=p.hospital_id
GROUP BY h.hospital_name;

-- Find all blood stock entries where the available units are critically low (less than 10)
SELECT * FROM blood_stock
WHERE units_available<10;

-- Retrieve all blood requests that are currently in 'Pending' status
SELECT * FROM blood_requests
WHERE status='Pending';

-- Find the donor who has donated the maximum total units of blood
SELECT d.donor_name,SUM(dn.units) AS total_units
FROM donors d
JOIN donations dn
ON d.donor_id=dn.donor_id
GROUP BY d.donor_name
ORDER BY total_units DESC
LIMIT 1;

-- Count the number of donors from each city
SELECT city,COUNT(*) AS donor_count
FROM donors
GROUP BY city;

-- Retrieve all current records from the blood stock table
SELECT * FROM blood_stock;