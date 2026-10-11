CREATE DATABASE IF NOT EXISTS CollegeDB_DML;
USE CollegeDB_DML;

DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Product;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Course;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Course VARCHAR(50),
    City VARCHAR(50)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    Salary DECIMAL(10,2),
    Email VARCHAR(100) UNIQUE
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50),
    Location VARCHAR(50)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2),
    Quantity INT
);

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50),
    Duration VARCHAR(30),
    Fees DECIMAL(10,2)
);

-- Q1-Q3: single-row, separate and multiple-row INSERT statements
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (101, 'Aman', 20, 'BTech', 'Delhi');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (102, 'Riya', 19, 'BCA', 'Meerut');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (103, 'Karan', 21, 'BTech', 'Jaipur');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (104, 'Neha', 20, 'BBA', 'Delhi');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (105, 'Ishita', 19, 'BCA', 'Meerut');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (106, 'Rahul', 22, 'BTech', 'Haridwar');

INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (107, 'Simran', 20, 'BTech', 'Delhi'),
       (108, 'Mohit', 21, 'BCA', 'Jaipur');

-- Q4-Q8: insert records into different tables
INSERT INTO Employee (Emp_ID, Emp_Name, Department, Salary, Email)
VALUES (201, 'Arun', 'IT', 45000, 'arun@example.com'),
       (202, 'Meena', 'HR', 40000, 'meena@example.com'),
       (203, 'Dev', 'IT', 52000, 'dev@example.com');

INSERT INTO Department (Dept_ID, Dept_Name, Location)
VALUES (1, 'IT', 'Delhi'), (2, 'HR', 'Jaipur'), (3, 'Sales', 'Meerut');

INSERT INTO Product (Product_ID, Product_Name, Price, Quantity)
VALUES (301, 'Keyboard', 800, 10), (302, 'Mouse', 400, 0), (303, 'Monitor', 7000, 5);

INSERT INTO Customer (Customer_ID, Customer_Name, Email, Phone)
VALUES (401, 'Aarav', 'aarav@example.com', '9876543210');

INSERT INTO Course (Course_ID, Course_Name, Duration, Fees)
VALUES (501, 'BTech', '4 years', 120000), (502, 'BCA', '3 years', 80000);

-- Q9-Q10: insert using all columns and selected columns
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (109, 'Pooja', 20, 'BTech', 'Dehradun');

INSERT INTO Student (Student_ID, Name, Course)
VALUES (110, 'Kabir', 'BCA');

-- Q11-Q19: UPDATE examples
UPDATE Student SET City = 'Noida' WHERE Student_ID = 101;
UPDATE Employee SET Salary = 48000 WHERE Emp_ID = 201;
UPDATE Employee SET Salary = Salary * 1.10;
UPDATE Product SET Price = Price * 1.05;
UPDATE Student SET Course = 'AI-ML' WHERE Student_ID = 103;
UPDATE Employee SET Department = 'Finance' WHERE Emp_ID = 202;
UPDATE Student SET City = 'Delhi' WHERE City = 'Meerut';
UPDATE Course SET Fees = 125000 WHERE Course_ID = 501;
UPDATE Student SET Age = 21, City = 'Roorkee' WHERE Student_ID = 104;

-- Q20-Q24: DELETE examples
DELETE FROM Student WHERE Student_ID = 110;
DELETE FROM Student WHERE City = 'Haridwar';
DELETE FROM Employee WHERE Salary < 41000;
DELETE FROM Product WHERE Quantity = 0;
DELETE FROM Student WHERE (City = 'Jaipur' AND Age < 21) OR Course = 'BBA';

-- Q25: insert, display, update, display, delete and display
INSERT INTO Student (Student_ID, Name, Age, Course, City)
VALUES (199, 'Test Student', 20, 'BTech', 'Delhi');

SELECT * FROM Student WHERE Student_ID = 199;
UPDATE Student SET City = 'Noida' WHERE Student_ID = 199;
SELECT * FROM Student WHERE Student_ID = 199;
DELETE FROM Student WHERE Student_ID = 199;
SELECT * FROM Student WHERE Student_ID = 199;

-- Verify the final records
SELECT * FROM Student;
SELECT * FROM Employee;
SELECT * FROM Department;
SELECT * FROM Product;
SELECT * FROM Customer;
SELECT * FROM Course;
