-- =========================================
-- Topic: Nested Subqueries
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
(103, 'Finance');

-- =========================================
-- Example 1:
-- Find employees earning more than
-- average salary of IT department
-- =========================================

SELECT emp_name, salary
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department = (
        SELECT department_name
        FROM departments
        WHERE department_name = 'IT'
    )
);

-- =========================================
-- Example 2:
-- Find employees working in department
-- with highest average salary
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE department = (
    SELECT department
    FROM employees
    GROUP BY department
    ORDER BY AVG(salary) DESC
    LIMIT 1
);

-- =========================================
-- Example 3:
-- Find employees earning maximum salary
-- among all departments
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary = (
    SELECT MAX(salary)
    FROM employees
    WHERE department = (
        SELECT department_name
        FROM departments
        WHERE department_name = 'Finance'
    )
);

-- =========================================
-- Example 4:
-- Find employees whose salary is greater
-- than minimum salary in HR department
-- =========================================

SELECT emp_name, department, salary
FROM employees
WHERE salary > (
    SELECT MIN(salary)
    FROM employees
    WHERE department = (
        SELECT department_name
        FROM departments
        WHERE department_name = 'HR'
    )
);

-- =========================================
-- End of File
-- =========================================