/*
Type	                Returns	                Common Operators
Single-row subquery	    One row	                =, >, <, >=, <=
Multiple-row subquery	Multiple rows	        IN, NOT IN, ANY, ALL
Correlated subquery	    Depends on outer query	Uses outer query values
EXISTS subquery	        Checks if rows exist	EXISTS, NOT EXISTS
*/

use normalization_lab;

-- products priced above average
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price>
(select avg(Price) 
from Products);

-- most expensive product
SELECT ProductID, ProductName, Price
FROM Products
WHERE Price=
(select max(Price) 
from Products);

-- customers who placed orders
select CustomerName
from Customers
where CustomerID in
(select CustomerID
from Orders);

-- products never ordered 
select ProductName
from Products
where ProductID not in
(select ProductID 
from OrderDetails); 

-- products supplied by suppliers from delhi 
SELECT ProductID, ProductName
FROM Products
WHERE SupplierID IN
(
SELECT SupplierID
FROM Suppliers
WHERE Address = 'Delhi'
);

-- suppliers supplying products above average price 
SELECT SupplierID, SupplierName
FROM Suppliers
WHERE SupplierID IN
(
SELECT SupplierID
FROM Products
WHERE Price >
(
SELECT AVG(Price)
FROM Products
)
);

-- latest order 
-- customers who ordered expensive product 
-- suppliers whose products were never ordered 
-- find second highest priced product