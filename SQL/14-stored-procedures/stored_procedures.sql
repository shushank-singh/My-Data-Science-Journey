-- =========================================
-- Topic: Stored Procedures
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
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
-- Create a Simple Stored Procedure
-- =========================================

DELIMITER $$

CREATE PROCEDURE GetAllEmployees()
BEGIN
    SELECT *
    FROM employees;
END $$

DELIMITER ;

-- Execute Procedure
CALL GetAllEmployees();

-- =========================================
-- Example 2:
-- Procedure with IN Parameter
-- =========================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesByDepartment(
    IN dept_name VARCHAR(50)
)
BEGIN
    SELECT *
    FROM employees
    WHERE department = dept_name;
END $$

DELIMITER ;

CALL GetEmployeesByDepartment('IT');

-- =========================================
-- Example 3:
-- Procedure with IN Parameter
-- Minimum Salary
-- =========================================

DELIMITER $$

CREATE PROCEDURE GetEmployeesBySalary(
    IN min_salary INT
)
BEGIN
    SELECT *
    FROM employees
    WHERE salary >= min_salary;
END $$

DELIMITER ;

CALL GetEmployeesBySalary(60000);

-- =========================================
-- Example 4:
-- Procedure with OUT Parameter
-- Employee Count
-- =========================================

DELIMITER $$

CREATE PROCEDURE GetEmployeeCount(
    OUT total_employees INT
)
BEGIN
    SELECT COUNT(*)
    INTO total_employees
    FROM employees;
END $$

DELIMITER ;

CALL GetEmployeeCount(@total);
SELECT @total AS total_employees;

-- =========================================
-- Example 5:
-- Procedure with INOUT Parameter
-- Increase Salary
-- =========================================

DELIMITER $$

CREATE PROCEDURE IncreaseSalary(
    INOUT current_salary INT
)
BEGIN
    SET current_salary = current_salary + 5000;
END $$

DELIMITER ;

SET @salary = 60000;
CALL IncreaseSalary(@salary);
SELECT @salary AS updated_salary;

-- =========================================
-- Example 6:
-- Show Stored Procedures
-- =========================================

SHOW PROCEDURE STATUS
WHERE Db = DATABASE();

-- =========================================
-- Example 7:
-- Show Procedure Definition
-- =========================================

SHOW CREATE PROCEDURE GetAllEmployees;

-- =========================================
-- Example 8:
-- Drop Stored Procedure
-- =========================================

DROP PROCEDURE IF EXISTS GetAllEmployees;
DROP PROCEDURE IF EXISTS GetEmployeesByDepartment;
DROP PROCEDURE IF EXISTS GetEmployeesBySalary;
DROP PROCEDURE IF EXISTS GetEmployeeCount;
DROP PROCEDURE IF EXISTS IncreaseSalary;

-- =========================================
-- End of File
-- =========================================