-- Total salary by department sql Copy Edit

SELECT department, SUM(salary) AS total_salary
FROM employer
GROUP BY department;

-- Average age in each department
SELECT department, AVG(age) AS average_age
FROM employer
GROUP BY department;

-- Count of employees in each position
SELECT position, COUNT(*) AS total_employees
FROM employer
GROUP BY position;

-- Departments with total salary > 150000 (Using HAVING)
SELECT department, SUM(salary) AS total_salary
FROM employer
GROUP BY department
HAVING total_salary > 150000;

-- Average salary by department where average > 50000
SELECT department, AVG(salary) AS average_salary
FROM employer
GROUP BY department
HAVING average_salary > 50000;

-- Maximum salary in each department
SELECT department, MAX(salary) AS highest_salary
FROM employer
GROUP BY department;

-- Departments with more than 3 employees
SELECT department, COUNT(*) AS employee_count
FROM employer
GROUP BY department
HAVING employee_count > 3;

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments (department_id, department_name, location) VALUES
(1, 'IT', 'New York'),
(2, 'HR', 'Los Angeles'),
(3, 'Finance', 'Chicago'),
(4, 'Sales', 'San Francisco'),
(5, 'Marketing', 'Seattle');

SELECT e.name, e.position, e.department, d.location
FROM employeR e
INNER JOIN departments d
ON e.department = d.department_name;

SELECT e.name, e.department, d.location
FROM employer e
LEFT JOIN departments d
ON e.department = d.department_name;

SELECT d.department_name, e.name AS employee_name
FROM employer e
RIGHT JOIN departments d
ON e.department = d.department_name;

SELECT e.name, e.department, d.location
FROM employer e
LEFT JOIN departments d ON e.department = d.department_name
UNION
SELECT e.name, e.department, d.location
FROM employer e
RIGHT JOIN departments d ON e.department = d.department_name;

-- Get employees who earn more than the average salary sql Copy Edit
SELECT name, salary
FROM employer
WHERE salary > (SELECT AVG(salary) FROM employer);

SELECT name, salary
FROM employer
WHERE salary = (SELECT MAX(salary) FROM employer);

SELECT name, department
FROM employer
WHERE department IN (SELECT department_name FROM departments);

SELECT 
  name,
  salary,
  CASE 
    WHEN salary >= 80000 THEN 'High'
    WHEN salary BETWEEN 50000 AND 79999 THEN 'Medium'
    ELSE 'Low'
  END AS salary_grade
FROM employer;

SELECT 
  name,
  department,
  CASE department
    WHEN 'IT' THEN 'Tech Department'
    WHEN 'HR' THEN 'People Department'
    WHEN 'Finance' THEN 'Money Management'
    ELSE 'Other'
  END AS dept_label
FROM employer;

SELECT 
  name,
  position,
  salary,
  CASE 
    WHEN position LIKE '%Manager%' THEN salary * 0.20
    WHEN position LIKE '%Executive%' THEN salary * 0.10
    ELSE 0
  END AS bonus
FROM employer;

SELECT 
  name,
  department,
  salary,
  RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS salary_rank
FROM employer;

SELECT 
  name,
  department,
  salary,
  SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS cumulative_salary
FROM employer;

SELECT 
  name,
  department,
  salary,
  LAG(salary) OVER(PARTITION BY department ORDER BY salary) AS previous_salary
FROM employer;
