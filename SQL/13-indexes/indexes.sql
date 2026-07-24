-- =========================================
-- Topic: Indexes
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    salary INT
);

-- Insert Data
INSERT INTO employees VALUES
(1, 'Rahul', 'rahul@gmail.com', 'IT', 60000),
(2, 'Aman', 'aman@yahoo.com', 'HR', 45000),
(3, 'Priya', 'priya@hotmail.com', 'Finance', 75000),
(4, 'Neha', 'neha@gmail.com', 'IT', 80000),
(5, 'Karan', 'karan@gmail.com', 'HR', 50000);

-- =========================================
-- Example 1:
-- Query Without Index
-- =========================================

SELECT *
FROM employees
WHERE email = 'rahul@gmail.com';

-- =========================================
-- Example 2:
-- Create Single-Column Index
-- =========================================

CREATE INDEX idx_email
ON employees(email);

-- =========================================
-- Example 3:
-- Query Using Indexed Column
-- =========================================

SELECT *
FROM employees
WHERE email = 'karan@gmail.com';

-- =========================================
-- Example 4:
-- Create Composite Index
-- =========================================

CREATE INDEX idx_department_salary
ON employees(department, salary);

-- =========================================
-- Example 5:
-- Query Using Composite Index
-- =========================================

SELECT *
FROM employees
WHERE department = 'IT'
AND salary > 65000;

-- =========================================
-- Example 6:
-- Create Unique Index
-- =========================================

CREATE UNIQUE INDEX idx_unique_email
ON employees(email);

-- =========================================
-- Example 7:
-- Show All Indexes
-- =========================================

SHOW INDEX
FROM employees;

-- =========================================
-- Example 8:
-- Check Query Execution Plan
-- =========================================

EXPLAIN
SELECT *
FROM employees
WHERE email = 'rahul@gmail.com';

-- =========================================
-- Example 9:
-- Drop an Index
-- =========================================

DROP INDEX idx_department_salary
ON employees;

-- =========================================
-- Example 10:
-- Drop Another Index
-- =========================================

DROP INDEX idx_email
ON employees;

-- =========================================
-- End of File
-- =========================================