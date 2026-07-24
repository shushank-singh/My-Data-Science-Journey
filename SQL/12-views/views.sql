-- =========================================
-- Topic: Views
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
(1, 'Rahul', 'IT', 60000),
(2, 'Aman', 'HR', 45000),
(3, 'Priya', 'Finance', 75000),
(4, 'Neha', 'IT', 80000),
(5, 'Karan', 'HR', 50000);

-- =========================================
-- Example 1:
-- Create a Simple View
-- =========================================

CREATE VIEW employee_details AS
SELECT
    emp_id,
    emp_name,
    department
FROM employees;

-- View Data
SELECT * FROM employee_details;

-- =========================================
-- Example 2:
-- View with WHERE Clause
-- IT Employees
-- =========================================

CREATE VIEW it_employees AS
SELECT
    emp_id,
    emp_name,
    salary
FROM employees
WHERE department = 'IT';

SELECT * FROM it_employees;

-- =========================================
-- Example 3:
-- View with Calculated Column
-- Annual Salary
-- =========================================

CREATE VIEW employee_salary AS
SELECT
    emp_name,
    salary,
    salary * 12 AS annual_salary
FROM employees;

SELECT * FROM employee_salary;

-- =========================================
-- Example 4:
-- Replace Existing View
-- =========================================

CREATE OR REPLACE VIEW employee_details AS
SELECT
    emp_id,
    emp_name,
    department,
    salary
FROM employees;

SELECT * FROM employee_details;

-- =========================================
-- Example 5:
-- Update Data Through View
-- =========================================

UPDATE employee_details
SET salary = 65000
WHERE emp_id = 1;

SELECT * FROM employee_details;

-- =========================================
-- Example 6:
-- Show All Views
-- =========================================

SHOW FULL TABLES
WHERE TABLE_TYPE = 'VIEW';

-- =========================================
-- Example 7:
-- View Definition
-- =========================================

SHOW CREATE VIEW employee_details;

-- =========================================
-- Example 8:
-- Drop View
-- =========================================

DROP VIEW employee_salary;

-- =========================================
-- Example 9:
-- Drop Multiple Views
-- =========================================

DROP VIEW IF EXISTS
employee_details,
it_employees;

-- =========================================
-- End of File
-- =========================================