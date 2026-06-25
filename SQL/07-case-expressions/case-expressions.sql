-- =========================================
-- Topic: CASE Expressions
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
-- Categorize Employees by Salary
-- =========================================

SELECT
    emp_name,
    salary,
    CASE
        WHEN salary >= 70000 THEN 'High Salary'
        WHEN salary >= 50000 THEN 'Medium Salary'
        ELSE 'Low Salary'
    END AS salary_category
FROM employees;

-- =========================================
-- Example 2:
-- Department Bonus Percentage
-- =========================================

SELECT
    emp_name,
    department,
    salary,
    CASE
        WHEN department = 'IT' THEN salary * 0.20
        WHEN department = 'Finance' THEN salary * 0.15
        WHEN department = 'HR' THEN salary * 0.10
        ELSE 0
    END AS bonus
FROM employees;

-- =========================================
-- Example 3:
-- CASE with ORDER BY
-- Show IT Employees First
-- =========================================

SELECT *
FROM employees
ORDER BY
CASE
    WHEN department = 'IT' THEN 1
    WHEN department = 'Finance' THEN 2
    ELSE 3
END;

-- =========================================
-- Example 4:
-- CASE with Aggregate Function
-- Count Employees by Salary Category
-- =========================================

SELECT
    COUNT(CASE WHEN salary >= 70000 THEN 1 END) AS high_salary,
    COUNT(CASE WHEN salary BETWEEN 50000 AND 69999 THEN 1 END) AS medium_salary,
    COUNT(CASE WHEN salary < 50000 THEN 1 END) AS low_salary
FROM employees;

-- =========================================
-- Example 5:
-- CASE Inside SUM()
-- Total Salary of IT Department
-- =========================================

SELECT
    SUM(
        CASE
            WHEN department = 'IT' THEN salary
            ELSE 0
        END
    ) AS total_it_salary
FROM employees;

-- =========================================
-- Example 6:
-- Update Salary Grade
-- =========================================

SELECT
    emp_name,
    department,
    salary,
    CASE
        WHEN salary >= 75000 THEN 'A'
        WHEN salary >= 60000 THEN 'B'
        WHEN salary >= 45000 THEN 'C'
        ELSE 'D'
    END AS grade
FROM employees;

-- =========================================
-- End of File
-- =========================================