-- LAB 2: DML (MySQL)
CREATE DATABASE IF NOT EXISTS CollegeDB; USE CollegeDB;
CREATE TABLE IF NOT EXISTS Student(Student_ID INT PRIMARY KEY, Name VARCHAR(50), Age INT, Course VARCHAR(50), City VARCHAR(50));
CREATE TABLE IF NOT EXISTS Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(50), Department VARCHAR(50), Salary DECIMAL(10,2), Email VARCHAR(100) UNIQUE);
CREATE TABLE IF NOT EXISTS Department(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(50), Location VARCHAR(50));
CREATE TABLE IF NOT EXISTS Product(Product_ID INT PRIMARY KEY, Product_Name VARCHAR(50), Price DECIMAL(10,2), Quantity INT);
CREATE TABLE IF NOT EXISTS Customer(Customer_ID INT PRIMARY KEY, Customer_Name VARCHAR(50), Email VARCHAR(100), Phone VARCHAR(15));
CREATE TABLE IF NOT EXISTS Course(Course_ID INT PRIMARY KEY, Course_Name VARCHAR(50), Duration VARCHAR(30), Fees DECIMAL(10,2));
-- Q1-Q3: single, separate and multiple inserts
INSERT INTO Student VALUES(101,'Aman',20,'BTech','Delhi');
INSERT INTO Student VALUES(102,'Riya',19,'BCA','Meerut');
INSERT INTO Student VALUES(103,'Karan',21,'BTech','Jaipur');
INSERT INTO Student VALUES(104,'Neha',20,'BBA','Delhi');
INSERT INTO Student VALUES(105,'Ishita',19,'BCA','Meerut');
INSERT INTO Student VALUES(106,'Rahul',22,'BTech','Haridwar');
INSERT INTO Student VALUES(107,'Simran',20,'BTech','Delhi'),(108,'Mohit',21,'BCA','Jaipur');
-- Q4-Q8
INSERT INTO Employee VALUES(201,'Arun','IT',45000,'arun@example.com'),(202,'Meena','HR',40000,'meena@example.com'),(203,'Dev','IT',52000,'dev@example.com');
INSERT INTO Department VALUES(1,'IT','Delhi'),(2,'HR','Jaipur'),(3,'Sales','Meerut');
INSERT INTO Product VALUES(301,'Keyboard',800,10),(302,'Mouse',400,0),(303,'Monitor',7000,5);
INSERT INTO Customer VALUES(401,'Aarav','aarav@example.com','9876543210');
INSERT INTO Course VALUES(501,'BTech','4 years',120000),(502,'BCA','3 years',80000);
-- Q9-Q10: all columns / selected columns
INSERT INTO Student VALUES(109,'Pooja',20,'BTech','Dehradun');
INSERT INTO Student(Student_ID,Name,Course) VALUES(110,'Kabir','BCA');
-- Q11-Q19: updates
UPDATE Student SET City='Noida' WHERE Student_ID=101;
UPDATE Employee SET Salary=48000 WHERE Emp_ID=201;
UPDATE Employee SET Salary=Salary*1.10;
UPDATE Product SET Price=Price*1.05;
UPDATE Student SET Course='AI-ML' WHERE Student_ID=103;
UPDATE Employee SET Department='Finance' WHERE Emp_ID=202;
UPDATE Student SET City='Delhi' WHERE City='Meerut';
UPDATE Course SET Fees=125000 WHERE Course_ID=501;
UPDATE Student SET Age=21, City='Roorkee' WHERE Student_ID=104;
-- Q20-Q24: deletes
DELETE FROM Student WHERE Student_ID=110;
DELETE FROM Student WHERE City='Haridwar';
DELETE FROM Employee WHERE Salary<41000;
DELETE FROM Product WHERE Quantity=0;
DELETE FROM Student WHERE (City='Jaipur' AND Age<21) OR Course='BBA';
-- Q25: insert, display, update, display, delete, display
INSERT INTO Student VALUES(199,'Test Student',20,'BTech','Delhi');
SELECT * FROM Student WHERE Student_ID=199;
UPDATE Student SET City='Noida' WHERE Student_ID=199;
SELECT * FROM Student WHERE Student_ID=199;
DELETE FROM Student WHERE Student_ID=199;
SELECT * FROM Student WHERE Student_ID=199;
