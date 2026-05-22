-- =========================================
-- Topic: Basic Subqueries
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Aman', 'HR', 40000),
(3, 'Priya', 'IT', 70000),
(4, 'Neha', 'Finance', 60000),
(5, 'Karan', 'HR', 45000);

-- =========================================
-- Example 1:
-- Find employees earning more than average salary
-- =========================================

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
);

-- =========================================
-- Example 2:
-- Find employees working in the same department
-- as Rahul
-- =========================================

SELECT emp_name, department
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    WHERE emp_name = 'Rahul'
);

-- =========================================
-- Example 3:
-- Find highest salary in company
-- =========================================

SELECT *
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
);

-- =========================================
-- Example 4:
-- Find employees earning minimum salary
-- =========================================

SELECT *
FROM employees
WHERE salary = (
    SELECT MIN(salary)
    FROM employees
);

-- =========================================
-- End of File
-- =========================================