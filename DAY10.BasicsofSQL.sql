CREATE TABLE employer (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    department VARCHAR(50),
    position VARCHAR(50),
    salary INT,
    joining_date DATE
);
INSERT INTO employer (id, name, age, department, position, salary, joining_date) VALUES
(1, 'Alice', 30, 'IT', 'Developer', 60000, '2019-04-12'),
(2, 'Bob', 28, 'HR', 'Recruiter', 45000, '2020-01-15'),
(3, 'Charlie', 35, 'IT', 'Lead Developer', 75000, '2018-06-10'),
(4, 'Diana', 32, 'Finance', 'Analyst', 52000, '2019-08-20'),
(5, 'Eva', 27, 'HR', 'Coordinator', 47000, '2021-02-10'),
(6, 'Frank', 40, 'IT', 'Manager', 85000, '2017-11-01'),
(7, 'Grace', 31, 'Marketing', 'Executive', 50000, '2020-05-18'),
(8, 'Henry', 29, 'Sales', 'Sales Rep', 48000, '2021-07-12'),
(9, 'Ivy', 34, 'Finance', 'Manager', 78000, '2016-09-25'),
(10, 'Jake', 26, 'IT', 'Support Engineer', 43000, '2022-03-08'),
(11, 'Kira', 33, 'Marketing', 'Manager', 67000, '2018-12-15'),
(12, 'Leo', 30, 'Sales', 'Executive', 51000, '2020-04-23'),
(13, 'Mona', 28, 'Finance', 'Analyst', 54000, '2021-10-05'),
(14, 'Nathan', 36, 'IT', 'Architect', 90000, '2015-03-30'),
(15, 'Olivia', 25, 'HR', 'Recruiter', 44000, '2022-08-01'),
(16, 'Paul', 31, 'Sales', 'Manager', 69000, '2017-07-07'),
(17, 'Queen', 29, 'IT', 'Tester', 46000, '2021-01-19'),
(18, 'Ryan', 35, 'Marketing', 'Analyst', 55000, '2018-05-14'),
(19, 'Sara', 27, 'Finance', 'Executive', 50000, '2020-10-21'),
(20, 'Tom', 38, 'HR', 'Manager', 72000, '2016-06-11');
-- DISPLAY ALL THE EMPLOYEES
select * from employer;

-- FILTER EMPLOYEES
SELECT * FROM employer
WHERE department = 'IT';

-- Top 5 Highest Paid Employees
SELECT * FROM employer
ORDER BY salary DESC
LIMIT 5;

-- Average Salary by Department
SELECT department, AVG(salary) AS average_salary
FROM employer
GROUP BY department;

-- Employees Who Joined After 2020
SELECT * FROM employer
WHERE joining_date > '2020-01-01';

-- Count of Employees in Each Department
SELECT department, COUNT(*) AS total_employees
FROM employer
GROUP BY department;

-- Employees with ‘Manager’ in Their Position
SELECT * FROM employer
WHERE position LIKE '%Manager%';

-- Total Salary Paid by Each Department
SELECT department, SUM(salary) AS total_salary
FROM employer
GROUP BY department;

-- Employees Sorted by Joining Date
SELECT * FROM employer
ORDER BY joining_date DESC;

-- Get Employee Details Whose ID is Between 5 and 10
SELECT * FROM employer
WHERE id BETWEEN 5 AND 10;

-- UPDATE and DELETE Queries
UPDATE employer
SET salary = salary + 5000
WHERE id = 1;

DELETE FROM employer
WHERE id = 20;

UPDATE employer
SET salary = 75000
WHERE id = 8;

SET SQL_SAFE_UPDATES = 0;

UPDATE employer
SET salary = 52000
WHERE department = 'HR' AND salary < 50000;

SELECT name AS EmployeeName, salary AS SalaryInINR FROM employer;

SELECT department, COUNT(*) AS total_employees
FROM employer
GROUP BY department;

SELECT department, COUNT(*) AS total_employees
FROM employer
GROUP BY department
HAVING COUNT(*) > 2;

SELECT department, AVG(salary) AS avg_salary
FROM employer
GROUP BY department;

SELECT department, MAX(salary) AS max_salary, MIN(salary) AS min_salary
FROM employer
GROUP BY department;
