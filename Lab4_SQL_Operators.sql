-- LAB 4: SQL OPERATORS (MySQL)
CREATE DATABASE IF NOT EXISTS CollegeDB; USE CollegeDB;
CREATE TABLE IF NOT EXISTS Student(Student_ID INT PRIMARY KEY, Name VARCHAR(50), Age INT, Course VARCHAR(50), City VARCHAR(50));
CREATE TABLE IF NOT EXISTS Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(50), Department VARCHAR(50), Salary DECIMAL(10,2));
CREATE TABLE IF NOT EXISTS Product(Product_ID INT PRIMARY KEY, Product_Name VARCHAR(50), Price DECIMAL(10,2), Quantity INT);
INSERT INTO Student VALUES(101,'Aman',20,'BTech','Delhi'),(102,'Riya',19,'BCA','Meerut'),(103,'Karan',22,'BTech','Jaipur'),(104,'Neha',20,'BBA','Delhi') ON DUPLICATE KEY UPDATE Name=VALUES(Name);
INSERT INTO Employee VALUES(201,'Arun','IT',45000),(202,'Meena','HR',40000),(203,'Dev','IT',52000),(204,'Sara','Sales',36000) ON DUPLICATE KEY UPDATE Emp_Name=VALUES(Emp_Name);
INSERT INTO Product VALUES(301,'Keyboard',800,10),(302,'Mouse',400,0),(303,'Monitor',7000,5) ON DUPLICATE KEY UPDATE Product_Name=VALUES(Product_Name);
-- Q1-Q5 Arithmetic
SELECT 10+5; SELECT 10-5; SELECT 10*5; SELECT 10/5;
SELECT Product_Name, Price*Quantity AS Total_Amount FROM Product;
-- Q6-Q10 Logical
SELECT * FROM Student WHERE Course='BTech' AND City='Delhi';
SELECT * FROM Student WHERE City='Delhi' OR City='Jaipur';
SELECT * FROM Student WHERE NOT Course='BCA';
SELECT * FROM Student WHERE Course='BTech' AND City='Delhi';
SELECT * FROM Employee WHERE Department='IT' OR Department='HR';
-- Q11-Q15 Comparison
SELECT * FROM Student WHERE City='Delhi';
SELECT * FROM Student WHERE Age>20;
SELECT * FROM Student WHERE Age<21;
SELECT * FROM Employee WHERE Salary>=40000 AND Salary<=50000;
SELECT * FROM Student WHERE City<>'Delhi'; SELECT * FROM Student WHERE City!='Delhi';
-- Q16-Q20 Special
SELECT * FROM Employee WHERE Salary BETWEEN 35000 AND 50000;
SELECT * FROM Student WHERE City IN('Delhi','Jaipur');
SELECT * FROM Student WHERE City NOT IN('Delhi','Jaipur');
SELECT * FROM Student WHERE Name LIKE 'A%';
SELECT * FROM Student WHERE Course IS NULL; SELECT * FROM Student WHERE Course IS NOT NULL;
-- Q21 UNION
SELECT City AS Place FROM Student WHERE City='Delhi' UNION SELECT City FROM Student WHERE City='Jaipur';
-- Q22 UNION ALL
SELECT City AS Place FROM Student WHERE City='Delhi' UNION ALL SELECT City FROM Student WHERE City='Delhi';
-- Q23 INTERSECT concept, compatible with older MySQL versions
SELECT DISTINCT a.City FROM Student a JOIN Student b ON a.City=b.City WHERE a.Course='BTech' AND b.Course='BTech';
-- Q24 EXCEPT/MINUS workaround with NOT EXISTS
SELECT DISTINCT s.City FROM Student s WHERE NOT EXISTS(SELECT 1 FROM Student x WHERE x.City=s.City AND x.Course='BTech');
-- Q25 Combined operators
SELECT Product_Name, Price, Quantity, Price*Quantity AS Total_Amount FROM Product
WHERE Price>500 AND Quantity BETWEEN 1 AND 10 AND Product_Name LIKE 'M%';
