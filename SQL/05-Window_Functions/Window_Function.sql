-- =========================================
-- Topic: Window Functions
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
-- Assign Row Number
-- =========================================

SELECT *,
ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num
FROM employees;

-- =========================================
-- Example 2:
-- Rank Employees by Salary
-- =========================================

SELECT *,
RANK() OVER(ORDER BY salary DESC) AS rank_num
FROM employees;

-- =========================================
-- Example 3:
-- Department-wise Salary Rank
-- =========================================

SELECT *,
DENSE_RANK() OVER(
    PARTITION BY department
    ORDER BY salary DESC
) AS dept_rank
FROM employees;

-- =========================================
-- Example 4:
-- Previous Employee Salary
-- =========================================

SELECT *,
LAG(salary) OVER(ORDER BY emp_id) AS previous_salary
FROM employees;

-- =========================================
-- Example 5:
-- Running Total of Salary
-- =========================================

SELECT *,
SUM(salary) OVER(ORDER BY emp_id) AS running_total
FROM employees;

-- =========================================
-- End of File
-- =========================================