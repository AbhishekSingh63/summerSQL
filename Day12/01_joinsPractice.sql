use normalization_lab;

-- the finance team wants the orderid, product name, quantity and price for every purchased product
select O.OrderID,
       P.ProductName,
       O.Quantity,
       P.Price
from OrderDetails O
inner join Products P
on O.ProductID = P.ProductID;

-- display customer name, product name and quantity purchased
select c.CustomerName, p.ProductName, od.Quantity
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
inner join OrderDetails od
on od.OrderID=o.OrderID
inner join Products p
on p.ProductID=od.ProductID;

-- find all products costing more than 1000 along with there supplier name
select P.ProductName, P.Price, S.SupplierName
from Products P
inner join Suppliers S
on P.SupplierID = S.SupplierID
where P.Price > 1000;

-- display customers whose names start with 'A' along with the orders they placed
select c.CustomerName, o.OrderID
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
where c.CustomerName like 'A%';

-- show all products supplied by suppliers whose names contain the word Tech
select p.ProductName, s.SupplierName
from Products p
inner join Suppliers s
on p.SupplierID=s.SupplierID
where s.SupplierName like '%Tech%';

-- find products costing between 500 and 3000 along with supplier names, sort by price descending
select P.ProductName, P.Price, S.SupplierName
from Products P
inner join Suppliers S
on P.SupplierID = S.SupplierID
where P.Price between 500 and 3000
order by P.Price desc;

-- display customers living in delhi along with there orderid
select c.CustomerName, o.OrderID
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
where c.Address in ('Delhi');

-- show all purchased products whose quantity is greater than 5. display product name and quantity
select P.ProductName, OD.Quantity
from Products P
inner join OrderDetails OD
on P.ProductID = OD.ProductID
where OD.Quantity > 5;

-- find all suppliers supplying products in either electronics or furniture category
select distinct S.SupplierName
from Suppliers S
inner join Products P
on S.SupplierID = P.SupplierID
where P.Category in ('Electronics', 'Furniture');

-- display all customers except those living in mumbai, along with the orders they placed
select c.CustomerName, o.OrderID
from Customers c
inner join Orders o
on c.CustomerID=o.CustomerID
where c.Address not in ('Mumbai');


-- advance questions
-- the management wants to know the top 5 most expensive purchased products along with customer name, supplier name, quantity purchased and price
select C.CustomerName, P.ProductName, S.SupplierName, OD.Quantity, P.Price
from Customers C
inner join Orders O
on C.CustomerID = O.CustomerID
inner join OrderDetails OD
on O.OrderID = OD.OrderID
inner join Products P
on OD.ProductID = P.ProductID
inner join Suppliers S
on P.SupplierID = S.SupplierID
order by P.Price desc
limit 5;

-- find the customer who has purchased the highest total quantity of products. display customer name and total quantity
select C.CustomerName, OD.Quantity
from Customers C
inner join Orders O
on C.CustomerID = O.CustomerID
inner join OrderDetails OD
on O.OrderID = OD.OrderID
order by OD.Quantity desc
limit 1;

-- dispaly customer name, product name and price whose price is greater than total average price
select C.CustomerName, P.ProductName, P.Price
from Customers C
inner join Orders O
on C.CustomerID = O.CustomerID
inner join OrderDetails OD
on O.OrderID = OD.OrderID
inner join Products P
on OD.ProductID = P.ProductID
where P.Price > (avg(P.Price));

-- subquery
select ProductName
from Products
where Price > (select avg(Price)from Products);