/*  Mock Test Questions
1. Find the total quantity of products for each categoryname.
2. Retrieve the names of suppliers who supply more than one product.
3. List products with a price higher than the average price of all products.
4. Find the supplier of the most expensive product.
5. Get the average price of products in each category.
6. Retrieve products that are supplied by 'TechSupplier Inc.
7. Find categories that have more than 100 products in total.
8. add a new product to table.
9. write a syntax of trigger.
10. Create a trigger to update the `updated_at` timestamp before updating a product.
11. List products along with their category names and supplier names.
12. Find the total number of products supplied by each supplier.
13. List the names of categories that have products priced above $100.
14. Find the maximum and minimum price of products in each category.
15. Create a trigger to prevent the deletion of products with a quantity greater than 50.
16. write complete MySQL syntax and order of execution
 */
-- Note: for above all questions print productname,categoryname and suppliername insted of ID's 

create database mock_test;
use mock_test;

CREATE TABLE Suppliers (
    supplier_id INT AUTO_INCREMENT PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(255)
);

INSERT INTO Suppliers (supplier_name, contact_info) VALUES
('TechSupplier Inc.', 'tech@example.com'),
('Fashion Co.', 'fashion@example.com'),
('OfficeSupplies Ltd.', 'office@example.com'),
('MobileTech Corp.', 'mobile@example.com');

select * from suppliers;

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

INSERT INTO Categories (category_name) VALUES
('Electronics'),
('Clothing'),
('Furniture');
select * from Categories;

CREATE TABLE Inventory (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    category_id INT,
    supplier_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES Suppliers(supplier_id)
);

INSERT INTO Inventory (product_name, description, quantity, price, category_id, supplier_id) VALUES
('Laptop', '15-inch display, 8GB RAM, 256GB SSD', 50, 799.99, 1, 1),
('T-Shirt', '100% cotton, size L', 200, 19.99, 2, 2),
('Desk Chair', 'Ergonomic office chair', 75, 129.99, 3, 3),
('Smartphone', 'Latest model, 128GB storage', 100, 699.99, 1, 4),
('Gaming Laptop', '17-inch display, 16GB RAM, 512GB SSD', 30, 1299.99, 1, 1),
('Casual Shirt', 'Slim fit, size M', 150, 29.99, 2, 2),
('Office Desk', 'L-shaped office desk', 40, 249.99, 3, 3),
('Tablet', '10-inch display, 64GB storage', 60, 399.99, 1, 4),
('Bluetooth Speaker', 'Portable speaker with rich sound', 120, 49.99, 1, 1),
('Jeans', 'Blue denim, size 32', 100, 39.99, 2, 2),
('Bookshelf', '5-tier wooden bookshelf', 20, 89.99, 3, 3),
('Wireless Headphones', 'Noise-canceling headphones', 80, 199.99, 1, 4),
('Sweater', 'Wool blend, size L', 75, 59.99, 2, 2),
('Standing Desk', 'Adjustable height standing desk', 25, 399.99, 3, 3),
('Smartwatch', 'Fitness tracker with heart rate monitor', 90, 149.99, 1, 4);


SELECT*FROM SUPPLIERS;

-- >1. Find the total quantity of products for each categoryname.

select * from inventory ;
SELECT SUM(QUANTITY) AS TOTAL_QUANTITY, C.CATEGORY_NAME,
 FROM INVENTORY AS I JOIN CATEGORIES AS C 
 GROUP BY C.CATEGORY_ID;

-- >2. Retrieve the names of suppliers who supply more than one product.

SELECT SUPPLIER_NAME FROM SUPPLIERS 
WHERE SUPPLIER_ID IN 
(SELECT SUPPLIER_ID FROM INVENTORY 
GROUP BY SUPPLIER_ID 
HAVING COUNT(SUPPLIER_ID)>1);
 
 -- > 3. List products with a price higher than the average price of all products.
 
 SELECT PRODUCT_NAME, PRICE FROM INVENTORY 
 WHERE PRICE>ALL(SELECT AVG(PRICE) FROM INVENTORY);
 
 -- > 4. Find the supplier of the most expensive product.

SELECT SUPPLIER_NAME FROM SUPPLIERS WHERE SUPPLIER_ID IN
 (SELECT SUPPLIER_ID FROM INVENTORY WHERE PRICE IN(SELECT MAX(PRICE)FROM INVENTORY));
 
 -- >5. Get the average price of products in each category.

SELECT AVG(PRICE) FROM INVENTORY GROUP BY CATEGORY_ID;

-- > 6. Retrieve products that are supplied by 'TechSupplier Inc.

SELECT PRODUCT_NAME FROM INVENTORY 
WHERE SUPPLIER_ID IN (SELECT SUPPLIER_ID FROM SUPPLIERS 
WHERE SUPPLIER_NAME="TechSupplier Inc.");
 
 
 -- > 7. Find categories that have more than 100 products in total.
 
 SELECT CATEGORY_NAME FROM CATEGORIES 
 WHERE CATEGORY_ID IN (SELECT CATEGORY_ID FROM INVENTORY GROUP BY CATEGORY_ID HAVING SUM(QUANTITY)>100);
 
 -- > 8. add a new product to table.

/*
INSERT INTO Inventory (product_name, description, quantity, price, category_id, supplier_id) VALUES
('MAC', '15-inch display, 16GB RAM, 1024GB SSD', 50, 799.99, 1, 1), 
*/

-- > 9. write a syntax of trigger.
DELIMITER //
CREATE TRIGGER TRIGGER_NAME
[BEFORE/AFTER][DML COMANAD] ON TABLE_NAME 
[ROW BY ROW] [COLUM BY COLUM]
BEGIN 
 LOGIC;
END//

-- > 



-- STORED PROCESSEDURE 
-- A STORE PROCEDURE IS A COLLECTION OF PRE-COMPILED SQL STATEMENTS STORED INSIDE THE DATABASE .
--  IT IS SUBROUTINE OR A SUB PROGRAM IN THE REGULAR COMPUTING LANGUAGES .
-- A PROCEDURE ALWAYS CONTAIN A NAME, PARAMETER LIST AND SQL STATEMENTS .

-- THREE PROCE DURE i. INPROSEDURE , ii. OUTPROCEDURE , iii. IN-OUT PROCEDURE 
/*
DELIMETER $$
CREATE PROCEDURE [ PROCEDURE_NAME] 
[[IN | OUT | INOUT ] PARAMETER_NAME DATATYPE]

BEGIN 
  DECLARATION_SECTION
	EXECUTION_SECTION 
END $$
DELIMITER;
*/
