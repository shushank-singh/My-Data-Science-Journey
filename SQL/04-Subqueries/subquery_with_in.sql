-- =========================================
-- Topic: Subquery with IN
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
(6, 'Simran', 'Finance', 80000),
(7, 'Rohit', 'Marketing', 55000);

-- Insert Data into Departments
INSERT INTO departments VALUES
(101, 'IT'),
(102, 'HR'),
(103, 'Finance'),
(104, 'Marketing');

-- =========================================
-- Example 1:
-- Find employees working in
-- IT and HR departments
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE department IN (
    SELECT department_name
    FROM departments
    WHERE department_name IN ('IT', 'HR')
);

-- =========================================
-- Example 2:
-- Find employees from departments
-- having average salary greater than 50000
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING AVG(salary) > 50000
);

-- =========================================
-- Example 3:
-- Find employees earning salary equal to
-- salary of any employee in HR department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary IN (
    SELECT salary
    FROM employees
    WHERE department = 'HR'
);

-- =========================================
-- Example 4:
-- Find employees belonging to departments
-- that have more than one employee
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE department IN (
    SELECT department
    FROM employees
    GROUP BY department
    HAVING COUNT(*) > 1
);

-- =========================================
-- Example 5:
-- Find employees from departments listed
-- in departments table
-- =========================================

SELECT emp_name, department
FROM employees
WHERE department IN (
    SELECT department_name
    FROM departments
);

-- =========================================
-- End of File
-- =========================================