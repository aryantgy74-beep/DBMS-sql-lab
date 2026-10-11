-- LAB 3: SQL FUNCTIONS 
CREATE DATABASE IF NOT EXISTS CollegeDB_Functions;
USE CollegeDB_Functions;
CREATE TABLE IF NOT EXISTS Student(Student_ID INT PRIMARY KEY, Name VARCHAR(50), Age INT, Course VARCHAR(50), City VARCHAR(50));
CREATE TABLE IF NOT EXISTS Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(50), Department VARCHAR(50), Salary DECIMAL(10,2), Joining_Date DATE);
INSERT INTO Student VALUES(101,'Aman Sharma',20,'BTech','Delhi'),(102,'Riya Singh',19,'BCA','Meerut'),(103,'Karan Kumar',21,'BTech','Jaipur') ON DUPLICATE KEY UPDATE Name=VALUES(Name);
INSERT INTO Employee VALUES(201,'Arun','IT',45678.75,'2023-01-15'),(202,'Meena','HR',40500.50,'2022-06-10'),(203,'Dev','IT',52300.25,'2024-03-20') ON DUPLICATE KEY UPDATE Emp_Name=VALUES(Emp_Name);
-- Q1-Q5 Number functions
SELECT ABS(-25); SELECT ROUND(123.4567,2); SELECT CEIL(12.3), FLOOR(12.9); SELECT MOD(17,5);
SELECT Emp_Name, ROUND(Salary,0) AS Rounded_Salary FROM Employee;
-- Q6-Q10 Aggregate functions
SELECT COUNT(*) AS Total_Students FROM Student;
SELECT SUM(Salary) AS Total_Salary FROM Employee;
SELECT AVG(Salary) AS Average_Salary FROM Employee;
SELECT MAX(Salary) AS Highest_Salary FROM Employee;
SELECT MIN(Salary) AS Lowest_Salary FROM Employee;
-- Q11-Q15 Character functions
SELECT UPPER(Name) FROM Student; SELECT LOWER(Name) FROM Student;
SELECT Name, LENGTH(Name) FROM Student;
SELECT CONCAT('Aaryan',' ','Tyagi') AS Full_Name;
SELECT Name, SUBSTRING(Name,1,4) FROM Student;
-- Q16-Q20 Conversion functions
SELECT CAST(12345 AS CHAR); SELECT CAST('456' AS UNSIGNED);
SELECT DATE_FORMAT('2026-10-14','%d-%m-%Y');
SELECT CAST('99.50' AS DECIMAL(10,2)); SELECT CONVERT('2026-10-14', DATE);
-- Q21-Q25 Date functions
SELECT CURDATE();
SELECT YEAR('2026-10-14'), MONTH('2026-10-14'), DAY('2026-10-14');
SELECT DATEDIFF('2026-10-14','2026-10-01');
SELECT DATE_ADD('2026-10-14', INTERVAL 7 DAY);
SELECT Emp_Name, DATE_FORMAT(Joining_Date,'%d-%m-%Y') FROM Employee;
