-- =========================================
-- Topic: Correlated Subqueries
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
(5, 'Karan', 'HR', 45000),
(6, 'Simran', 'Finance', 80000);

-- =========================================
-- Example 1:
-- Find employees earning more than
-- average salary of their department
-- =========================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary > (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- =========================================
-- Example 2:
-- Find employees with highest salary
-- in each department
-- =========================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary = (
    SELECT MAX(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- =========================================
-- Example 3:
-- Find employees earning less than
-- department average salary
-- =========================================

SELECT emp_name, department, salary
FROM employees e1
WHERE salary < (
    SELECT AVG(salary)
    FROM employees e2
    WHERE e1.department = e2.department
);

-- =========================================
-- Example 4:
-- Find employees who are the only person
-- in their department with that salary
-- =========================================

SELECT emp_name, department, salary
FROM employees e1
WHERE 1 = (
    SELECT COUNT(*)
    FROM employees e2
    WHERE e1.department = e2.department
    AND e1.salary = e2.salary
);

-- =========================================
-- End of File
-- =========================================