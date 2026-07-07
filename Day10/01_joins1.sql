use normalization_lab;

-- 1st inner join

-- Example: Orders and customer
select O.OrderID, C.*
from Orders as O
inner join Customers as C
on O.CustomerID = C.CustomerID;

-- show product purchased in every order
select OrderDetails.OrderID,
Products.ProductID, Products.ProductName, Products.Category
from OrderDetails
inner join Products
on OrderDetails.ProductID = Products.ProductID;

-- show customer name and products purchased
select Customers.CustomerName, Products.ProductName
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join OrderDetails
on Orders.OrderID = OrderDetails.OrderID
inner join Products
on OrderDetails.ProductID = Products.ProductID;

-- show customer name, product name and price
select Customers.CustomerName, Products.ProductName, Products.Price
from Customers
inner join Orders
on Customers.CustomerID = Orders.CustomerID
inner join OrderDetails
on Orders.OrderID = OrderDetails.OrderID
inner join Products
on OrderDetails.ProductID = Products.ProductID;

-- total bill for each product purchased
select Products.ProductID, Products.ProductName, (Products.Price*OrderDetails.Quantity) as TotalBill
from Products
inner join OrderDetails
on Products.ProductID = OrderDetails.ProductID;