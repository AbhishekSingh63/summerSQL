-- ===========================================================
-- DAY_18_SQL_WINDOW_FUNCTIONS_COMPLETE.sql
-- PART 1 : Introduction + Dataset + OVER() + PARTITION BY
--           ORDER BY + ROW_NUMBER() + RANK() + DENSE_RANK()
-- Compatible with: MySQL 8.0+
-- ===========================================================

/*
WINDOW FUNCTIONS
----------------
A Window Function performs calculations across a set of rows without collapsing them like GROUP BY.

Syntax:
FUNCTION_NAME(...) OVER(
    [PARTITION BY column]
    [ORDER BY column]
)

Dataset: E-Commerce Analytics
*/

DROP DATABASE IF EXISTS ecommerce_window_demo;
CREATE DATABASE ecommerce_window_demo;
USE ecommerce_window_demo;

-- ==========================
-- TABLES
-- ==========================

CREATE TABLE categories(
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50)
);

CREATE TABLE products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category_id INT,
    unit_price DECIMAL(10,2),
    FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE TABLE salespersons(
    salesperson_id INT PRIMARY KEY,
    salesperson_name VARCHAR(100),
    region VARCHAR(30)
);

CREATE TABLE orders(
    order_id INT PRIMARY KEY,
    order_date DATE,
    salesperson_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(salesperson_id) REFERENCES salespersons(salesperson_id),
    FOREIGN KEY(product_id) REFERENCES products(product_id)
);

-- ==========================
-- SAMPLE DATA
-- ==========================

INSERT INTO categories VALUES
(1,'Mobile'),
(2,'Laptop'),
(3,'Electronics'),
(4,'Accessories');

INSERT INTO products VALUES
(101,'iPhone 16',1,85000),
(102,'Galaxy S25',1,78000),
(103,'OnePlus 14',1,52000),
(201,'Dell Inspiron',2,72000),
(202,'HP Pavilion',2,68000),
(301,'Sony Smart TV',3,62000),
(302,'LG OLED TV',3,95000),
(401,'Wireless Earbuds',4,4500),
(402,'Mechanical Keyboard',4,6500),
(403,'Gaming Mouse',4,3200);

INSERT INTO salespersons VALUES
(1,'Rahul','North'),
(2,'Priya','South'),
(3,'Amit','East'),
(4,'Sneha','West');

INSERT INTO orders VALUES
(1001,'2026-01-02',1,101,2),
(1002,'2026-01-02',2,201,1),
(1003,'2026-01-03',3,301,1),
(1004,'2026-01-03',4,102,3),
(1005,'2026-01-05',1,401,10),
(1006,'2026-01-05',2,202,2),
(1007,'2026-01-06',3,302,1),
(1008,'2026-01-06',4,103,4),
(1009,'2026-01-08',1,402,5),
(1010,'2026-01-08',2,403,8),
(1011,'2026-01-09',3,101,1),
(1012,'2026-01-10',4,201,2),
(1013,'2026-01-10',1,301,2),
(1014,'2026-01-11',2,401,12),
(1015,'2026-01-12',3,102,2),
(1016,'2026-01-13',4,302,1);

DROP VIEW combine_four_tables;

CREATE VIEW combine_four_tables AS
SELECT
    O.order_id,
    O.order_date,
    S.salesperson_name,
    S.region,
    P.product_name,
    C.category_name,
    O.quantity,
    P.unit_price,
    O.quantity * P.unit_price AS sales_amount
FROM orders AS O
INNER JOIN salespersons AS S
    ON O.salesperson_id = S.salesperson_id
INNER JOIN products AS P
    ON O.product_id = P.product_id
INNER JOIN categories AS C
    ON P.category_id = C.category_id;
    

SELECT * FROM combine_four_tables;


-- OVER()

-- Total sales while keeping every row

SELECT *, SUM(sales_amount) OVER() AS company_total_sales
FROM combine_four_tables;


-- AVERAGE SALES

SELECT *, AVG(sales_amount) OVER() AS company_average_sales
FROM combine_four_tables;


-- Region wise average

SELECT 
salesperson_name,
region,
sales_amount,
AVG(sales_amount)
OVER (PARTITION BY region) AS region_wise_avg
FROM combine_four_tables;


-- RUNNING TOTAL

SELECT
order_date, sales_amount,
SUM(sales_amount)
OVER(ORDER BY order_date ) AS running_total
FROM combine_four_tables;


-- OVERALL RANKING

SELECT salesperson_name,
sales_amount,
ROW_NUMBER()
OVER(ORDER BY sales_amount DESC) AS overall_ranking
FROM combine_four_tables;


-- ROW_NUMBER() :- UNIQUE SEQUENTIAL NUMBER

-- RANK() :- ASSIGNS THE SAME RANK TO TIES BUT SKIPS RANK AFTER TIE

-- DENSE_RANK() :- ASSIGNS THE SAME RANK TO TIES BUT DOES NOT SKIP RANK AFTER A TIE

-- Ranking within category

SELECT category_name, product_name, sales_amount, 
ROW_NUMBER() OVER(PARTITION BY category_name ORDER BY sales_amount DESC) AS ranking_category
FROM combine_four_tables;

-- LAG() :- Previous data

-- LEAD() :- After data

-- FIRST_VALUE() :- 

-- EXECUTION IN ORDER

-- FROM
-- WHERE
-- GROUP BY
-- HAVING
-- WINDOW FUNCTIONS
-- SELECT
-- ORDER BY
-- LIMIT




