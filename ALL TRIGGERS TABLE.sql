create database trig;
use trig;

-- TRIGGER MYSQL TRIGGER IS A DATABASE OBJECT THAT IS ASSOCIATED WITH THE TABLE.
-- IT WILL BE ACTIVATTED WHEN A DEFINE ACTION IS EXECUTED FOR THE TABLE.
-- THE TRIGGER CAN BE EXECTUTED WHEN YOU RUN ONE OF THE FOLLING MYSQL STATEMENTS ON THE TABLE
-- INSERTS , UPDATE, DELETE . AND IT CAN BE INKOVED BEFORE OR AFTER THE EVENT

-- SYNTAX
/*
DELIMITER //
CREATE TRIGGER TRIGGER_NAME
(BEFORE | AFTER)
[INSERT | UPDATE | DELETE]
ON (TABLE_NAME)
[FOR EACH ROW | FOR EACH COLUMN]
BEGIN
[TRIGGER_BODY]
END //
*/

CREATE TABLE emptrig (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    hire_date DATE,
    job_id VARCHAR(10),
    salary DECIMAL(10, 2)
);

INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '2022-01-15', 'DEV', 60000.00);

INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (2, 'Jane', 'Smith', 'jane.smith@example.com', '2023-03-10', 'QA', 50000.00);

INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (3, 'Emily', 'Johnson', 'emily.johnson@example.com', '2021-05-20', 'HR', 45000.00);

INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (4, 'Michael', 'Brown', 'michael.brown@example.com', '2020-08-30', 'DEV', 70000.00);

INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (5, 'Jessica', 'Williams', 'jessica.williams@example.com', '2019-11-12', 'FIN', 65000.00);


-- DISPLAY DATA
SELECT * FROM EMPTRIG;

-- CREATE A TRIGGER
DELIMITER //
CREATE TRIGGER BEFORE_INSERT_EMPDATA
BEFORE INSERT ON  EMPTRIG FOR EACH ROW 
BEGIN 
IF NEW.SALARY<0 THEN SET NEW.SALARY=0;
END IF;
END //

-- DROP  A TRIGGER
DROP TRIGGER BEFORE_INSERT_EMPDATA;

-- TRIGGER IN ACTION
INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (6, 'SHIV', 'SANKAR', 'SHIV.SANKAR@example.com', '2019-11-12', 'FIN', -65000.00);

-- TRIGGER WILL NOT WORK 
INSERT INTO emptrig (employee_id, first_name, last_name, email, hire_date, job_id, salary)
VALUES (7, 'Jessica', 'jhones', 'jessica.jones@example.com', '2019-11-12', 'FIN', 35000.00);


-- CREATE 
DELIMITER //
CREATE TRIGGER BEFORE_UPDATE_SAL_TRIGGER
BEFORE UPDATE ON EMPTRIG 
FOR EACH ROW
BEGIN
IF NEW.SALARY < OLD.SALARY THEN SIGNAL SQLSTATE '45000'
SET MESSAGE_TEXT='ERROR NEW SAL CANT BE LESS THEN OLD SAL ' ;
END IF;
END //

UPDATE EMPTRIG SET SALARY=35000 WHERE EMPLOYEE_ID=2;







CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100),
    quantity INT,
    price DECIMAL(10, 2)
);
-- ORDERS AND ORDER_LOGS

SELECT * FROM ORDERS;
SELECT * FROM ORDER_LOGS;

DELIMITER //
CREATE TRIGGER after_order_insert
AFTER INSERT ON orders
FOR EACH ROW
BEGIN
    INSERT INTO order_logs (order_id, action)
    VALUES (NEW.id, 'New order inserted');
END //




INSERT INTO orders (product_name, quantity, price) VALUES
('Smartphone', 2, 599.99),
('Laptop', 1, 1299.99),
('Headphones', 3, 149.99);


CREATE TABLE order_logs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    action_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    action VARCHAR(50)
);



CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2),
    department VARCHAR(100)
);

select * from employees;

INSERT INTO employees (name, salary, department) VALUES
('John Doe', 50000.00, 'Sales'),
('Jane Smith', 60000.00, 'Marketing'),
('Michael Johnson', 75000.00, 'Engineering');


CREATE TABLE audit_salary_changes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10, 2),
    new_salary DECIMAL(10, 2),
    change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

describe audit_salary_changes;

--


CREATE TABLE audit_deleted_employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    deleted_name VARCHAR(100),
    deleted_salary DECIMAL(10, 2),
    deleted_department VARCHAR(100),
    deletion_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


DELIMITER //
CREATE TRIGGER AFTER_DELETE
AFTER DELETE ON EMPLOYEES
FOR EACH ROW 
INSERT INTO AUDIT_DELETED_EMPLOYEES(EMPLOYEE_ID,DELETED_NAME,DELETED_SALARY,DELETED_DEPARTMENT)
VALUES(OLD.ID,OLD.NAME,OLD.SALARY,OLD.DEPARTMENT);
END;
 //
DROP TRIGGER AFTER_DELETE;
DROP TRIGGER AFTER_DELETE;

SELECT * FROM AUDIT_DELETED_EMPLOYEES;
delete FROM EMPLOYEES WHERE ID=1;



delimiter //
CREATE TRIGGER AFTER_SALARY_CHANGES
BEFORE UPDATE ON EMPLOYEES
FOR EACH ROW 
BEGIN 
IF OLD.SALARY <> NEW.SALARY THEN
 INSERT INTO AUDIT_SALARY_CHANGES(EMPLOYEE_ID,OLD_SALARY,NEW_SALARY)
 VALUES (NEW.ID,OLD.SALARY,NEW.SALARY);

END IF;
END //
SELECT * FROM AUDIT_SALARY_CHANGES;
UPDATE EMPLOYEES SET SALARY=65000 WHERE ID=3;

-- 
DELIMITER //
CREATE TRIGGER BEFORE_HR_DELETE
BEFORE DELETE ON EMPTRIG
FOR EACH ROW 
BEGIN 
 IF OLD.JOB_ID='HR' THEN SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT='CANNOT DELETE HR ' ;
END IF;
END //

DROP TRIGGER BEFORE_HR_DELETE;

set sql_safe_updates=0; -- SET SQL_SAFE_UPDATE=0
SELECT * FROM EMPTRIG;
delete from emptrig where job_id='hr';

-- CREATE A TRIGGER FOR EMPTRIG SO THAT WE CAN'T DELETE FIN PEOPLE
DELIMITER //
CREATE TRIGGER BEFORE_FIN_DELETE
BEFORE DELETE ON EMPTRIG
FOR EACH ROW 
BEGIN 
 IF OLD.JOB_ID='FIN' THEN SIGNAL SQLSTATE '45000'
 SET MESSAGE_TEXT='CANNOT DELETE FIN ' ;
END IF;
END //

DROP TRIGGER BEFORE_FIN_DELETE;

DELETE FROM EMPTRIG WHERE EMPLOYEE_ID=5;


 