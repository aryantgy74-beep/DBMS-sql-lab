-- LAB 5: SQL JOINS (MySQL)
-- Corrected, standalone version. Run the whole script in MySQL Workbench.
-- It recreates only these four tables inside CollegeDB.

CREATE DATABASE IF NOT EXISTS CollegeDB;
USE CollegeDB;

-- Drop child tables first so the script can be run again safely.
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Dept_Name VARCHAR(50) NOT NULL,
    Location VARCHAR(50)
);

CREATE TABLE Course (
    Course_ID INT PRIMARY KEY,
    Course_Name VARCHAR(50) NOT NULL,
    Duration VARCHAR(30)
);

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(50) NOT NULL,
    Age INT,
    Dept_ID INT NULL,
    Course_ID INT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Employee (
    Emp_ID INT PRIMARY KEY,
    Emp_Name VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2),
    Dept_ID INT NULL,
    Manager_ID INT NULL,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID),
    FOREIGN KEY (Manager_ID) REFERENCES Employee(Emp_ID)
);

-- Sample data
INSERT INTO Department (Dept_ID, Dept_Name, Location) VALUES
(1, 'IT', 'Delhi'),
(2, 'HR', 'Jaipur'),
(3, 'Sales', 'Meerut'),
(4, 'Finance', 'Noida');

INSERT INTO Course (Course_ID, Course_Name, Duration) VALUES
(101, 'BTech AI-ML', '4 years'),
(102, 'BCA', '3 years'),
(103, 'BBA', '3 years');

INSERT INTO Student (Student_ID, Name, Age, Dept_ID, Course_ID) VALUES
(1, 'Aman', 20, 1, 101),
(2, 'Riya', 19, 2, 102),
(3, 'Karan', 21, 1, 101),
(4, 'Neha', 20, NULL, 103),
(5, 'Sara', 22, 3, NULL);

INSERT INTO Employee (Emp_ID, Emp_Name, Salary, Dept_ID, Manager_ID) VALUES
(201, 'Arun', 45000, 1, NULL),
(202, 'Meena', 40000, 2, 201),
(203, 'Dev', 52000, 3, 201),
(204, 'Sara', 36000, NULL, 202);

-- Q1-Q5: INNER JOIN examples
-- Q1: Students with their department names
SELECT s.Name, d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d ON s.Dept_ID = d.Dept_ID;

-- Q2: Students with their course names
SELECT s.Name, c.Course_Name
FROM Student AS s
INNER JOIN Course AS c ON s.Course_ID = c.Course_ID;

-- Q3: Employees with their department names
SELECT e.Emp_Name, d.Dept_Name
FROM Employee AS e
INNER JOIN Department AS d ON e.Dept_ID = d.Dept_ID;

-- Q4: Students with department and course details
SELECT s.Name, d.Dept_Name, c.Course_Name
FROM Student AS s
INNER JOIN Department AS d ON s.Dept_ID = d.Dept_ID
INNER JOIN Course AS c ON s.Course_ID = c.Course_ID;

-- Q5: Students who belong to the IT department
SELECT s.Name, d.Dept_Name
FROM Student AS s
INNER JOIN Department AS d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_Name = 'IT';

-- Q6-Q11: LEFT/RIGHT JOIN and unmatched rows
-- Q6: All students, including students without a department
SELECT s.Name, d.Dept_Name
FROM Student AS s
LEFT JOIN Department AS d ON s.Dept_ID = d.Dept_ID;

-- Q7: All departments, including departments without students
SELECT d.Dept_Name, s.Name
FROM Department AS d
LEFT JOIN Student AS s ON d.Dept_ID = s.Dept_ID;

-- Q8: All departments and any matching students (RIGHT JOIN version)
SELECT s.Name, d.Dept_Name
FROM Student AS s
RIGHT JOIN Department AS d ON s.Dept_ID = d.Dept_ID;

-- Q9: Students without a matching department
SELECT s.Name
FROM Student AS s
LEFT JOIN Department AS d ON s.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q10: Departments without any students
SELECT d.Dept_Name
FROM Department AS d
LEFT JOIN Student AS s ON d.Dept_ID = s.Dept_ID
WHERE s.Student_ID IS NULL;

-- Q11: Employees without a department
SELECT e.Emp_Name
FROM Employee AS e
LEFT JOIN Department AS d ON e.Dept_ID = d.Dept_ID
WHERE d.Dept_ID IS NULL;

-- Q12-Q15: SELF JOIN examples
-- Q12: Employees and their managers
SELECT e.Emp_Name AS Employee, m.Emp_Name AS Manager
FROM Employee AS e
LEFT JOIN Employee AS m ON e.Manager_ID = m.Emp_ID;

-- Q13: Employees earning more than 40000 with department names
SELECT e.Emp_Name, e.Salary, d.Dept_Name
FROM Employee AS e
LEFT JOIN Department AS d ON e.Dept_ID = d.Dept_ID
WHERE e.Salary > 40000;

-- Q14: All student-course combinations that have a matching course
SELECT s.Name, c.Course_Name
FROM Student AS s
JOIN Course AS c ON s.Course_ID = c.Course_ID;

-- Q15: Show each department and its students, sorted by department
SELECT d.Dept_Name, s.Name
FROM Department AS d
LEFT JOIN Student AS s ON d.Dept_ID = s.Dept_ID
ORDER BY d.Dept_Name, s.Name;

-- Final checks
SELECT * FROM Department;
SELECT * FROM Course;
SELECT * FROM Student;
SELECT * FROM Employee;
