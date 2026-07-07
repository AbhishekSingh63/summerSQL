create database normalization_lab;

use normalization_lab;

create table OrderData
(
OrderID int,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100),
ProductName varchar(50),
Category varchar(30),
SupplierName varchar(50),
SupplierPhone varchar(15),
Quantity int,
Price decimal(10,2)
);

insert into OrderData values
(101,'Rahul','9453672884','Delhi','Laptop','Electronics','ABC Suppliers','99911111111',1,65000),
(102,'Priya','9876543210','Mumbai','Smartphone','Electronics','XYZ Traders','9876500001',2,25000.00),
(103,'Amit','9123456789','Bengaluru','Office Chair','Furniture','Comfort Furnishers','9988776655',3,4500.00),
(104,'Sneha','9012345678','Hyderabad','Refrigerator','Appliances','CoolTech Pvt Ltd','9900112233',1,32000.00),
(105,'Rohit','9988123456','Pune','Washing Machine','Appliances','HomeNeeds','9811223344',1,28000.00),
(106,'Anjali','9870011223','Chennai','Headphones','Electronics','XYZ Traders','9876500001',4,2200.00),
(107,'Karan','9090909090','Kolkata','Dining Table','Furniture','WoodWorks','9123456780',1,18000.00),
(108,'Neha','9001234567','Jaipur','Microwave Oven','Appliances','ABC Suppliers','99911111111',2,8500.00),
(109,'Vikram','9112233445','Ahmedabad','Tablet','Electronics','TechZone','9988998877',3,18000.00),
(110,'Pooja','9887766554','Lucknow','Bookshelf','Furniture','XYZ Traders','9876500001',2,6500.00);

insert into OrderData values
(111,'Rahul','9453672884','Delhi','Mouse','Electronics','ABC Suppliers','99911111111',2,800.00),
(112,'Rahul','9453672884','Delhi','Keyboard','Electronics','ABC Suppliers','99911111111',1,1500.00),
(113,'Priya','9876543210','Mumbai','Smartphone','Electronics','XYZ Traders','9876500001',1,25000.00),
(114,'Priya','9876543210','Mumbai','Power Bank','Electronics','XYZ Traders','9876500001',2,1200.00),
(115,'Amit','9123456789','Bengaluru','Office Chair','Furniture','Comfort Furnishers','9988776655',2,4500.00),
(116,'Amit','9123456789','Bengaluru','Study Table','Furniture','Comfort Furnishers','9988776655',1,6500.00),
(117,'Sneha','9012345678','Hyderabad','Refrigerator','Appliances','CoolTech Pvt Ltd','9900112233',1,32000.00),
(118,'Sneha','9012345678','Hyderabad','Microwave Oven','Appliances','CoolTech Pvt Ltd','9900112233',1,8500.00),
(119,'Rahul','9453672884','Delhi','Monitor','Electronics','ABC Suppliers','99911111111',1,12000.00);

create table Customers
(
CustomerID int primary key,
CustomerName varchar(50),
Phone varchar(15),
Address varchar(100)
);

create table Suppliers
(
SupplierID int primary key,
SupplierName varchar(50),
SupplierPhone varchar(15)
);

create table Products
(
ProductID int primary key,
ProductName varchar(50),
Category varchar(30),
Price decimal(10,2),
SupplierID int,
foreign key (SupplierID) references Suppliers(SupplierID)
);

create table Orders
(
OrderID int primary key,
CustomerID int,
foreign key (CustomerID) references Customers(CustomerID)
);

create table OrderDetails
(
OrderID int,
ProductID int,
Quantity int,
primary key(OrderID,ProductID),
foreign key(OrderID) references Orders(OrderID),
foreign key(ProductID) references Products(ProductID)
);

insert into Customers values
(1,'Rahul','9453672884','Delhi'),
(2,'Priya','9876543210','Mumbai'),
(3,'Amit','9123456789','Bengaluru'),
(4,'Sneha','9012345678','Hyderabad'),
(5,'Rohit','9988123456','Pune'),
(6,'Anjali','9870011223','Chennai'),
(7,'Karan','9090909090','Kolkata'),
(8,'Neha','9001234567','Jaipur'),
(9,'Vikram','9112233445','Ahmedabad'),
(10,'Pooja','9887766554','Lucknow');

insert into Suppliers values
(1,'ABC Suppliers','99911111111'),
(2,'XYZ Traders','9876500001'),
(3,'Comfort Furnishers','9988776655'),
(4,'CoolTech Pvt Ltd','9900112233'),
(5,'HomeNeeds','9811223344'),
(6,'WoodWorks','9123456780');

insert into Products values
(1,'Laptop','Electronics',65000.00,1),
(2,'Smartphone','Electronics',25000.00,2),
(3,'Office Chair','Furniture',4500.00,3),
(4,'Refrigerator','Appliances',32000.00,4),
(5,'Washing Machine','Appliances',28000.00,5),
(6,'Headphones','Electronics',2200.00,2),
(7,'Dining Table','Furniture',18000.00,6),
(8,'Microwave Oven','Appliances',8500.00,1),
(9,'Tablet','Electronics',18000.00,2),
(10,'Bookshelf','Furniture',6500.00,2),
(11,'Mouse','Electronics',800.00,1),
(12,'Keyboard','Electronics',1500.00,1);

insert into Orders values
(101,1),
(102,2),
(103,3),
(104,4),
(105,5),
(106,6),
(107,7),
(108,8),
(109,9),
(110,10),
(111,1),
(112,1),
(113,2),
(114,2),
(115,3),
(116,3),
(117,4),
(118,4),
(119,1);

insert into OrderDetails values
(101,1,1),
(102,2,2),
(103,3,3),
(104,4,1),
(105,5,1),
(106,6,4),
(107,7,1),
(108,8,2),
(109,9,3),
(110,10,2),
(111,11,2),
(112,12,1),
(113,2,1),
(114,11,2),
(115,3,2),
(116,10,1),
(117,4,1),
(118,8,1),
(119,9,1);

insert into Products values
(13,'Power Bank','Electronics',1200.00,2);

delete from OrderDetails
where OrderID = 114;

insert into OrderDetails values
(114,13,2);

-- Q1 Update rahul's phone number. which table should be updated?
update Customers
set Phone = '9876543211'
where CustomerName = 'Rahul';

-- Q2 add one new customer without placing any order. is it possible?
insert into Customers values
(11,'Ramesh','9871234567','Bhopal');

-- Q3 delete order 112. check whether customer information still exists?
delete from OrderDetails
where OrderID = 112;
delete from Orders
where OrderID = 112;
select * from Customers
where CustomerName = 'Rahul';

