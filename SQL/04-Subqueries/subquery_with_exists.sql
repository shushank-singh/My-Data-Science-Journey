-- =========================================
-- Topic: Subquery with EXISTS
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Create Departments Table
CREATE TABLE departments (
    dept_id INT,
    department_name VARCHAR(50)
);

-- Insert Data into Employees
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 50000),
(2, 'Aman', 'HR', 40000),
(3, 'Priya', 'IT', 70000),
(4, 'Neha', 'Finance', 60000),
(5, 'Karan', 'HR', 45000),
(6, 'Simran', 'Finance', 80000);

-- Insert Data into Departments
INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- =========================================
-- Example 1:
-- Find departments that have employees
-- =========================================

SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department = d.department_name
);

-- =========================================
-- Example 2:
-- Find employees whose department exists
-- in departments table
-- =========================================

SELECT emp_name, department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_name = e.department
);

-- =========================================
-- Example 3:
-- Find departments having employee
-- with salary greater than 60000
-- =========================================

SELECT department_name
FROM departments d
WHERE EXISTS (
    SELECT 1
    FROM employees e
    WHERE e.department = d.department_name
      AND e.salary > 60000
);

-- =========================================
-- Example 4:
-- Find employees from departments
-- that have more than one employee
-- =========================================

SELECT emp_name, department
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM employees e2
    WHERE e.department = e2.department
    GROUP BY department
    HAVING COUNT(*) > 1
);

-- =========================================
-- End of File
-- =========================================