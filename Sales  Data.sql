########## May 11 ########

use tech;

CREATE TABLE Sales (
    TransactionID INT PRIMARY KEY,
    Date DATE,
    ProductID VARCHAR(10),
    ProductName VARCHAR(50),
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    TotalPrice DECIMAL(10, 2),
    CustomerID VARCHAR(10),
    CustomerName VARCHAR(50),
    SalesRep VARCHAR(50)
);

describe sales;

INSERT INTO Sales (TransactionID, Date, ProductID, ProductName, Quantity, UnitPrice, TotalPrice, CustomerID, CustomerName, SalesRep) VALUES
(1, '2024-04-01', 'PROD001', 'Laptop', 2, null, 2000.00, 'CUST001', 'John Smith', 'Sarah Johnson'),
(2, '2024-04-02', 'PROD002', 'Smartphone', 3, 500.00, 1500.00, 'CUST002', 'Emma Davis', 'Mike Wilson'),
(3, '2024-04-03', 'PROD003', 'Tablet', 1, 700.00, 700.00, 'CUST003', 'Michael Brown', 'Emily Miller'),
(4, '2024-04-04', 'PROD004', 'Headphones', 5, 50.00, 250.00, 'CUST004', 'Sophia Lee', 'David Clark'),
(5, '2024-04-05', 'PROD005', 'Smartwatch', 2, 300.00, 600.00, 'CUST005', 'Olivia Garcia', 'Sarah Johnson'),
(6, '2024-04-06', 'PROD001', 'Laptop', 1, 1000.00, 1000.00, 'CUST006', 'Ethan Martinez', 'Mike Wilson'),
(7, '2024-04-07', 'PROD002', 'Smartphone', 2, 500.00, 1000.00, 'CUST007', 'Mia Rodriguez', 'Emily Miller'),
(8, '2024-04-08', 'PROD003', 'Tablet', 3, 700.00, 2100.00, 'CUST008', 'Charlotte Adams', 'David Clark'),
(9, '2024-04-09', 'PROD004', 'Headphones', 1, 50.00, 50.00, 'CUST009', 'Benjamin Hernandez', 'Sarah Johnson'),
(10, '2024-04-10', 'PROD005', 'Smartwatch', 4, 300.00, 1200.00, 'CUST010', 'Amelia Taylor', 'Mike Wilson'),
(11, '2024-04-11', 'PROD001', 'Laptop', 2, 1000.00, 2000.00, 'CUST011', 'William Thompson', 'Emily Miller'),
(12, '2024-04-12', 'PROD002', 'Smartphone', 1, 500.00, 500.00, 'CUST012', 'Harper Anderson', 'David Clark'),
(13, '2024-04-13', 'PROD003', 'Tablet', 2, 700.00, 1400.00, 'CUST013', 'Evelyn White', 'Sarah Johnson'),
(14, '2024-04-14', 'PROD004', 'Headphones', 3, 50.00, 150.00, 'CUST014', 'James Wilson', 'Mike Wilson'),
(15, '2024-04-15', 'PROD005', 'Smartwatch', 1, 300.00, 300.00, 'CUST015', 'Aiden Moore', 'Emily Miller'),
(16, '2024-04-16', 'PROD001', 'Laptop', 3, 1000.00, 3000.00, 'CUST016', 'Abigail Hall', 'David Clark'),
(17, '2024-04-17', 'PROD002', 'Smartphone', 2, 500.00, 1000.00, 'CUST017', 'Evelyn Martinez', 'Sarah Johnson'),
(18, '2024-04-18', 'PROD003', 'Tablet', 1, 700.00, 700.00, 'CUST018', 'Logan Thompson', 'Mike Wilson'),
(19, '2024-04-19', 'PROD004', 'Headphones', 2, 50.00, 100.00, 'CUST019', 'Grace Parker', 'Emily Miller'),
(20, '2024-04-20', 'PROD005', 'Smartwatch', 4, 300.00, 1200.00, 'CUST020', 'Daniel Wright', 'David Clark'),
(21, '2024-04-21', 'PROD001', 'Laptop', 1, 1000.00, 1000.00, 'CUST021', 'Zoey Scott', 'Sarah Johnson'),
(22, '2024-04-22', 'PROD002', 'Smartphone', 2, 500.00, 1000.00, 'CUST022', 'Sebastian Brown', 'Mike Wilson'),
(23, '2024-04-23', 'PROD003', 'Tablet', 3, 700.00, 2100.00, 'CUST023', 'Riley Wood', 'Emily Miller'),
(24, '2024-04-24', 'PROD004', 'Headphones', 1, 50.00, 50.00, 'CUST024', 'Luna Lopez', 'David Clark'),
(25, '2024-04-25', 'PROD005', 'Smartwatch', 2, 300.00, 600.00, 'CUST025', 'Eli Perez', 'Sarah Johnson'),
(26, '2024-04-26', 'PROD001', 'Laptop', 1, 1000.00, 1000.00, 'CUST026', 'Sawyer Rivera', 'Mike Wilson'),
(27, '2024-04-27', 'PROD002', 'Smartphone', 4, 500.00, 2000.00, 'CUST027', 'Nova Gonzales', 'Emily Miller'),
(28, '2024-04-28', 'PROD003', 'Tablet', 2, 700.00, 1400.00, 'CUST028', 'Roman Stewart', 'David Clark'),
(29, '2024-04-29', 'PROD004', 'Headphones', 1, 50.00, 50.00, 'CUST029', 'Elena Cook', 'Sarah Johnson');

SELECT * FROM Sales;

# WAQD transaction_id,productname and quantity
SELECT transactionID,ProductName,quantity from sales;
/*Projection means select particular coloums/attributes from tables with all the records /rows
*/

#SYNTAX OF PROJECTION
#select */col_name/expression
#from table_name*/

#Order of execution
1.from clause:select the table and send that table under execution
2. select clause : this is responsible for preparing result table 

1.from
2.select(row-by-row)
SELECTION
This will select particular rows with particular columns

select */col_name/expression
from table_name
where conditions

order of execution for selection
1.from clause
2.where clause(row-by-row)(It will filter the records)
3.select clause(row-by-row)

#waqd details of transaction id of 10

select * from sales
where transactionid=10;

####### May 14 ##########
/*WAQTD Date,ProductID, ProductName from sales table*/
select date,productid,productname from sales;
select * from sales;
select totalprice*2 AS FINALPRICE from sales;

select productname,quantity from sales
where customerid="CUST015";

/*WAQTD DATE,PRODUCTNAME,UNITPRICE,TOTALPRICE,CUSTOMERID OF Emma Davis from sales table*/

SELECT date, productname,unitprice,totalprice,customerid from sales
where customername="Emma Davis";

# WAQTP the productname, totalprice, 5% discount on total price
select productname as pn,totalprice as tp,(totalprice)*0.05 as discount from sales; #as is aliase

# waqtp details of laptop
select * from sales where productname="laptop";

#Caluculate 13% of tax for unitprice
select unitprice,unitprice * 0.13 Tax13 from sales;

# Expression is combination of operaters and operands
# Aliases is alternative name to an attribute is called as alliases
select PRODUCTID from sales
where transactionid=10;
############### Assignment 3 ############

#1
SELECT * FROM Sales
WHERE quantity>2;

#2
SELECT totalprice from sales
where unitprice<700;

#3
SELECT * FROM SALES
WHERE SALESREP="SARAH JOHNSON";

#4
SELECT * FROM SALES
WHERE quantity>=2 AND quantity<=4;

#5
SELECT * FROM SALES
WHERE TOTALPRICE>=1000;

#6
SELECT * FROM SALES
WHERE SALESREP ="MIKE WILSON" OR SALESREP="EMILY MILLER";

#7
SELECT * FROM SALES
WHERE CUSTOMERID!="CUST001";

#8
SELECT * FROM SALES
WHERE PRODUCTID ="PROD001" OR PRODUCTID="PROD002";

#9
SELECT * FROM SALES
WHERE TOTALPRICE>2*UNITPRICE;

#10
SELECT * FROM SALES
WHERE DATE>="2024-04-15";

#11
SELECT * FROM SALES
WHERE CUSTOMERNAME!="JOHN SMITH" AND UNITPRICE<1000;

#12
SELECT * FROM SALES
WHERE CUSTOMERNAME = "JOHN SMITH" OR CUSTOMERNAME= "EMMA DAVIS";

#13
SELECT * FROM SALES
WHERE TOTALPRICE=QUANTITY*UNITPRICE;

#14
SELECT PRODUCTID AS PID,CUSTOMERNAME AS CUSTOMER FROM SALES;

#15
SELECT PRODUCTNAME AS Product,SALESREP AS Representative FROM SALES;

################ MAY 15 ###############

/*Display the detail of the product laptop and quantity should be 2*/

select *from sales
where productname="laptop" and quantity=2;

/*Display the details of the product smarphone and headphones*/
select * from sales
where productname="smartphone" or productname="headphones";

/*Display the details of the product PROD005
OR quantity should be 2*/

select* from sales
where productid="PROD005" or quantity=2;

select* from sales
where productname<>"tablet" and productname<>"smartphone";

select*from sales
where productname not in("tablet","smartphone");

select * from sales
where unitprice>=1000 and unitprice<=2000;

select * from sales
where productname in("smartphone","headphones","tablet");
/*special operator*/ 

select * from sales
where unitprice not between 1000 and 2000;

select * from sales
where unitprice is null;

select * from sales
where unitprice is not null;

select * from sales
where productname like "h%";

select * from sales
where productname like "s%e";

########## Assigment 3 SPECIAL OPERATOR #############


#1. Retrieve transactions where the product name starts with 'Smart’.
SELECT * FROM SALES
WHERE PRODUCTNAME LIKE"SMART%";

#2. Get transactions where the customer name ends with 'son’.
SELECT*FROM SALES
WHERE CUSTOMERNAME LIKE"%SON";

#3. List transactions where the product ID contains '003’.
SELECT * FROM SALES
WHERE PRODUCTID LIKE "%003%";

#4. Retrieve transactions where the customer ID is not 'CUST001’.
SELECT * FROM SALES
WHERE CUSTOMERID NOT IN ("CUST001"); 

#5. Show transactions where the customer name is exactly 'John Smith’.
SELECT*FROM SALES
WHERE CUSTOMERNAME IN("JOHN SMITH");

#6. Get transactions where the product name is either 'Laptop' or 'Smartphone’.
SELECT*FROM SALES
WHERE PRODUCTNAME IN ("LAPTOP","SMARTPHONE");

#7. List transactions where the customer name is not 'Sarah Johnson’.
SELECT *FROM SALES
WHERE CUSTOMERNAME NOT IN ("SARAH JOHNSON");

#8. Retrieve transactions where the sales rep is not 'Mike Wilson’.
SELECT * FROM SALES
WHERE SALESREP NOT IN ("MIKE WILSON");

#9. Show transactions where the product name does not contain 'Tablet’.
SELECT * FROM SALES
WHERE PRODUCTNAME NOT IN ("TABLE");

#10.Get transactions where the customer name is like 'E%’.
SELECT * FROM SALES
WHERE CUSTOMERNAME LIKE "E%";


#11.List transactions where the sales rep is 'Sarah Johnson' or 'Mike Wilson’.
SELECT*FROM SALES
WHERE SALESREP IN ("SARAH JOHNSON","MIKE WILSON");

#12.Retrieve transactions where the product name is not 'Smartwatch'.
SELECT*FROM SALES
WHERE PRODUCTNAME NOT IN("SMARTWATCH");

#13.Show transactions where the customer name is 'Emily Miller’.
SELECT*FROM SALES
WHERE CUSTOMERNAME IN("EMILY MILLER");

#14.Get transactions where the sales rep is not null.
SELECT*FROM SALES
WHERE SALESREP IS NOT NULL;


#15.List transactions where the product name is null.
SELECT*FROM SALES
WHERE PRODUCTNAME IS NULL;

######## MAY 16 #######
# Distinct is used to extract uniques data from a columns
select distinct productname as PName from sales;
select distinct salesrep from sales;

#Function
/*
2type of function are present in sql
i. Single Row function
ii. multirow function
*/
/*Display maximum unit price of a product*/
select max(unitprice) as max from sales;

/*Display maximum unit price of a product*/
select max(totalprice) from sales
where productname = "laptop";

/*Display product whose unitprice is grater than max value of totalprice*/
select * from sales
where unitprice>max(totalprice);#wrong invalid use of function

/*Display total unit price amd total price of sales table*/
select sum(unitprice) as Total_UnitPrice,sum(totalprice) as Total_Totalprice from sales; 

############# May 20
# Display total and avg of unitprice and total number of product

select sum(unitprice), avg (unitprice), sum(totalprice), count(distinct productname) from sales;
select sum(unitprice),productname from sales
group by productname;

/*
GROUP BY
IS USED TO GROUP THE RECORD

Syntax:
select group_by_expession/group_by_function
from table_name
[where <filter condition>]
group by column_name_expression*/

select sum(quantity), 
salesrep from sales
group by salesrep;

select sum(unitprice),productname from sales
where productname in("laptop","smartwatch")
group by productname;


select count(distinct productname),salesrep from sales
group by salesrep;
