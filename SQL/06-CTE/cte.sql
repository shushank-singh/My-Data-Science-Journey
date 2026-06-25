-- =========================================
-- Topic: Common Table Expressions (CTE)
-- Database: MySQL 
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Aman', 'HR', 40000),
(3, 'Priya', 'IT', 70000),
(4, 'Neha', 'Finance', 60000),
(5, 'Karan', 'HR', 45000),
(6, 'Simran', 'Finance', 80000);

-- =========================================
-- Example 1:
-- Basic CTE
-- =========================================

WITH high_salary AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)

SELECT *
FROM high_salary;

-- =========================================
-- Example 2:
-- CTE with Aggregation
-- Find Average Salary by Department
-- =========================================

WITH dept_avg AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)

SELECT *
FROM dept_avg;

-- =========================================
-- Example 3:
-- Employees Earning More Than
-- Their Department Average
-- =========================================

WITH dept_avg AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
)

SELECT
    e.emp_name,
    e.department,
    e.salary,
    d.avg_salary
FROM employees e
JOIN dept_avg d
ON e.department = d.department
WHERE e.salary > d.avg_salary;

-- =========================================
-- Example 4:
-- Multiple CTEs
-- =========================================

WITH dept_avg AS (
    SELECT
        department,
        AVG(salary) AS avg_salary
    FROM employees
    GROUP BY department
),
high_paid AS (
    SELECT *
    FROM employees
    WHERE salary > 50000
)

SELECT
    h.emp_name,
    h.department,
    h.salary,
    d.avg_salary
FROM high_paid h
JOIN dept_avg d
ON h.department = d.department;

-- =========================================
-- Example 5:
-- Recursive CTE
-- Generate Numbers 1 to 10
-- =========================================

WITH RECURSIVE numbers AS (
    SELECT 1 AS num

    UNION ALL

    SELECT num + 1
    FROM numbers
    WHERE num < 10
)

SELECT *
FROM numbers;

-- =========================================
-- Example 6:
-- Recursive CTE
-- Employee Salary Running Level
-- =========================================

WITH ranked_salary AS (
    SELECT
        emp_name,
        salary,
        DENSE_RANK() OVER(ORDER BY salary DESC) AS salary_rank
    FROM employees
)

SELECT *
FROM ranked_salary;

-- =========================================
-- End of File
-- =========================================