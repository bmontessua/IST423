-- 1. Create the Tables using Data defination Language(DDL)
-- 1a. Create the employee table
CREATE TABLE employee (
    person_ID INT PRIMARY KEY,
    person_name VARCHAR(100) NOT NULL,
    street VARCHAR(100),
    city VARCHAR(50)
);
-- 1b. Create the company table
CREATE TABLE company (
    company_name VARCHAR(100) PRIMARY KEY,
    city VARCHAR(50)
);
-- 1c. Create works table (employee that works for company)
CREATE TABLE works (
    person_ID INT NOT NULL,
    company_name VARCHAR(100) NOT NULL,
    salary DECIMAL(10, 2),
    PRIMARY KEY (person_ID, company_name),
    FOREIGN KEY (person_ID) REFERENCES employee(person_ID),
    FOREIGN KEY (company_name) REFERENCES company(company_name)
);
-- 2. Insert the following sample data using Data Manipulation Language (DML)
-- 2a. Insert data into the employee table
INSERT INTO employee (person_ID, person_name, street, city) VALUES
(001, 'Alice', '12 Maple St', 'Greensboro'),
(002, 'Bob', '45 Pine Rd', 'Raleigh'),
(003, 'Carol', '90 Lake Ave', 'Charlotte'),
(004, 'David', '10 Elm St', 'Greensboro');
-- 2b. Insert data into the company table
INSERT INTO company (company_name, city) VALUES
('First Bank', 'Greensboro'),
('TechSoft', 'Raleigh'),
('DataCorp', 'Charlotte');
-- 2c. Insert data into the works table
INSERT INTO works (person_ID, company_name, salary) VALUES
(001, 'First Bank', 60000),
(002, 'TechSoft', 75000),
(003, 'DataCorp', 82000),
(004, 'First Bank', 55000);
-- 3. Modify the Data (DML)
-- 3a. Increase the salary of all employees working for First Bank by 20%
UPDATE works
SET salary = salary * 1.20
WHERE company_name = 'First Bank';
-- 3b. Change the city of Bob to Durham
UPDATE employee
SET city = 'Durham'
WHERE person_id = '2';
-- 3c. Insert a new employee: Emma, 78 Oak Street, Raleigh
INSERT INTO employee (person_ID, person_name, street, city) VALUES
(005, 'Emma', '78 Oak Street', 'Raleigh');
-- 3d. Record that Emma works for TechSoft with salary 70000
INSERT INTO works (person_ID, company_name, salary) VALUES
(005, 'TechSoft', 70000);
-- a. Delete David’s record from the works table, then delete David from the employee table.
-- 4. Write SQL statements for the following operations.
-- 4a. Delete David’s record from the works table, then delete David from the employee table.
DELETE FROM works
WHERE person_id = 4;
-- then
DELETE FROM employee
WHERE person_id = 4;
-- 4b. Delete all records in the works table for employees who work for DataCorp.
DELETE FROM works
WHERE company_name = 'Datacorp';
