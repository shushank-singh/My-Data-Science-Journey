-- =========================================
-- Topic: Subquery with ANY and ALL
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert Data into Employees
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Aman', 'HR', 40000),
(3, 'Priya', 'IT', 70000),
(4, 'Neha', 'Finance', 60000),
(5, 'Karan', 'HR', 45000),
(6, 'Simran', 'Finance', 80000);

-- =========================================
-- Example 1:
-- Find employees earning more than
-- ANY employee in HR department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary > ANY (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);

-- =========================================
-- Example 2:
-- Find employees earning more than
-- ALL employees in HR department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary > ALL (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);

-- =========================================
-- Example 3:
-- Find employees earning less than
-- ANY employee in Finance department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary < ANY (
    SELECT salary
    FROM employees
    WHERE department = 'Finance'
);

-- =========================================
-- Example 4:
-- Find employees earning less than
-- ALL employees in IT department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary < ALL (
    SELECT salary
    FROM employees
    WHERE department = 'IT'
);

-- =========================================
-- End of File
-- =========================================