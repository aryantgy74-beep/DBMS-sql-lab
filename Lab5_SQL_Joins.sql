-- LAB 5: SQL JOINS
CREATE DATABASE IF NOT EXISTS CollegeDB; USE CollegeDB;
CREATE TABLE IF NOT EXISTS Department(Dept_ID INT PRIMARY KEY, Dept_Name VARCHAR(50), Location VARCHAR(50));
CREATE TABLE IF NOT EXISTS Course(Course_ID INT PRIMARY KEY, Course_Name VARCHAR(50), Duration VARCHAR(30));
CREATE TABLE IF NOT EXISTS Student(Student_ID INT PRIMARY KEY, Name VARCHAR(50), Age INT, Dept_ID INT NULL, Course_ID INT NULL);
CREATE TABLE IF NOT EXISTS Employee(Emp_ID INT PRIMARY KEY, Emp_Name VARCHAR(50), Salary DECIMAL(10,2), Dept_ID INT NULL, Manager_ID INT NULL);
INSERT INTO Department VALUES(1,'IT','Delhi'),(2,'HR','Jaipur'),(3,'Sales','Meerut'),(4,'Finance','Noida') ON DUPLICATE KEY UPDATE Dept_Name=VALUES(Dept_Name);
INSERT INTO Course VALUES(101,'BTech AI-ML','4 years'),(102,'BCA','3 years'),(103,'BBA','3 years') ON DUPLICATE KEY UPDATE Course_Name=VALUES(Course_Name);
INSERT INTO Student VALUES(1,'Aman',20,1,101),(2,'Riya',19,2,102),(3,'Karan',21,1,101),(4,'Neha',20,NULL,103) ON DUPLICATE KEY UPDATE Name=VALUES(Name);
INSERT INTO Employee VALUES(201,'Arun',45000,1,NULL),(202,'Meena',40000,2,201),(203,'Dev',52000,1,201),(204,'Sara',36000,3,202) ON DUPLICATE KEY UPDATE Emp_Name=VALUES(Emp_Name);
-- Q1-Q5 
SELECT s.Name,d.Dept_Name FROM Student s INNER JOIN Department d ON s.Dept_ID=d.Dept_ID;
SELECT s.Name AS Student_Name,d.Dept_Name FROM Student s JOIN Department d ON s.Dept_ID=d.Dept_ID;
SELECT e.Emp_Name,d.Dept_Name FROM Employee e JOIN Department d ON e.Dept_ID=d.Dept_ID;
SELECT s.Name,c.Course_Name,c.Duration FROM Student s JOIN Course c ON s.Course_ID=c.Course_ID;
SELECT s.Name,d.Dept_Name FROM Student s JOIN Department d ON s.Dept_ID=d.Dept_ID WHERE d.Dept_Name='IT';
-- Q6-Q11 
SELECT s.Name,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
SELECT s.Name,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
SELECT s.Name,d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID=d.Dept_ID;
SELECT d.Dept_Name,s.Name FROM Department d LEFT JOIN Student s ON d.Dept_ID=s.Dept_ID;
SELECT s.Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID WHERE d.Dept_ID IS NULL;
SELECT d.Dept_Name FROM Department d LEFT JOIN Student s ON d.Dept_ID=s.Dept_ID WHERE s.Student_ID IS NULL;
-- Q12 
SELECT s.Name,d.Dept_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID
UNION
SELECT s.Name,d.Dept_Name FROM Student s RIGHT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- Q13-Q16 CROSS and NATURAL joins
SELECT s.Name,c.Course_Name FROM Student s CROSS JOIN Course c;
SELECT COUNT(*) AS Possible_Combinations FROM Student CROSS JOIN Course;
SELECT * FROM Student NATURAL JOIN Department;
SELECT * FROM Student NATURAL JOIN Department;
SELECT s.Student_ID,s.Name,d.Dept_ID,d.Dept_Name FROM Student s JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- Q17-Q18 SELF JOIN
SELECT e.Emp_Name AS Employee,m.Emp_Name AS Manager FROM Employee e LEFT JOIN Employee m ON e.Manager_ID=m.Emp_ID;
SELECT e.Emp_Name,m.Emp_Name AS Manager_Name FROM Employee e LEFT JOIN Employee m ON e.Manager_ID=m.Emp_ID;
-- Q19-Q20 multiple joins
SELECT s.Name,d.Dept_Name,c.Course_Name FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID LEFT JOIN Course c ON s.Course_ID=c.Course_ID;
SELECT s.Name AS Student_Name,c.Course_Name,d.Dept_Name FROM Student s LEFT JOIN Course c ON s.Course_ID=c.Course_ID LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID;
-- Q21 salary above department average
SELECT e.Emp_Name,e.Salary,d.Dept_Name FROM Employee e JOIN Department d ON e.Dept_ID=d.Dept_ID
JOIN(SELECT Dept_ID,AVG(Salary) Avg_Salary FROM Employee GROUP BY Dept_ID) a ON e.Dept_ID=a.Dept_ID
WHERE e.Salary>a.Avg_Salary;
-- Q22 department with maximum students
SELECT d.Dept_Name,COUNT(s.Student_ID) Student_Count FROM Department d LEFT JOIN Student s ON d.Dept_ID=s.Dept_ID
GROUP BY d.Dept_ID,d.Dept_Name ORDER BY Student_Count DESC LIMIT 1;
-- Q23 total students per department
SELECT d.Dept_Name,COUNT(s.Student_ID) Total_Students FROM Department d LEFT JOIN Student s ON d.Dept_ID=s.Dept_ID GROUP BY d.Dept_ID,d.Dept_Name;
-- Q24 enrolled students per course
SELECT c.Course_Name,COUNT(s.Student_ID) Enrolled_Students FROM Course c LEFT JOIN Student s ON c.Course_ID=s.Course_ID GROUP BY c.Course_ID,c.Course_Name;
-- Q25 report with joins, GROUP BY and aggregates
SELECT d.Dept_Name,c.Course_Name,COUNT(s.Student_ID) Student_Count,AVG(s.Age) Average_Age
FROM Student s LEFT JOIN Department d ON s.Dept_ID=d.Dept_ID LEFT JOIN Course c ON s.Course_ID=c.Course_ID
GROUP BY d.Dept_Name,c.Course_Name;
