create database joins;
use joins;

CREATE TABLE Customers(
    CustomerID INT PRIMARY KEY,
    CustomerName VARCHAR(255)
);

CREATE TABLE Orders(
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE
);
INSERT INTO Orders (OrderID, CustomerID, OrderDate) VALUES
(101, 1, '2023-01-01'),
(102, 1, '2023-01-05'),
(103, 2, '2023-01-10'),
(104, 4, '2023-02-01'),
(105, 5, '2023-02-15'); 

INSERT INTO Customers(CustomerID, CustomerName) VALUES
(1, 'Alice'),
(2, 'Bob'),
(3, 'Charlie'),
(4, 'David');


select * from orders;
select * from customers;

--

select customername,orderid from customers as c left join orders as o  on c.customerid=o.customerid;

--
select customername,orderid from customers as c right join orders as o  on c.customerid=o.customerid;

--

select customername,orderid from customers as c right join orders as o  on c.customerid=o.customerid
union
select customername,orderid from customers as c left join orders as o  on c.customerid=o.customerid;

-- cross join : each record of left table will merge the record of right table
-- syntax
-- select col_name from table1,table2;

select * from customers cross join orders;
-- or
select * from customers,orders;

-- NATURAL JOIN IF BOTH THE TABLES HAVING COMMON COLUMN THEN IT WILL ACT LIKE INNER JOIN OR ELSE IT WILL ACT LIKE CROSS JOIN.
SELECT COL_NAME 
FROM TABLE1 NATURAL JOIN TABLE2;

SELECT * FROM ORDERS NATURAL JOIN CUSTOMERS;


CREATE TABLE employee(
    empID INT PRIMARY KEY,
    empName VARCHAR(255)
);

INSERT INTO employee VALUES
(111, 'A'),
(222, 'B'),
(333, 'C'),
(444, 'D');


-- 1. Employee with orders cross join and natural join

SELECT * FROM ORDERS , EMPLOYEE;
SELECT * FROM ORDERS NATURAL JOIN EMPLOYEE;

-- 2. Employee with customers cross join and natural join
SELECT * FROM EMPLOYEE,CUSTOMERS;
SELECT * FROM EMPLOYEE NATURAL JOIN CUSTOMERS;


-- 3. Orders with customers cross join and natural join

SELECT * FROM ORDERS,CUSTOMERS;
SELECT * FROM ORDERS NATURAL JOIN CUSTOMERS;

-- 



