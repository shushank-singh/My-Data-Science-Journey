-- =========================================
-- Topic: Triggers
-- Database: MySQL
-- =========================================

-- Create Employees Table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Create Employee Log Table
CREATE TABLE employee_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    action_type VARCHAR(20),
    emp_id INT,
    emp_name VARCHAR(50),
    action_time DATETIME
);

-- Insert Sample Data
INSERT INTO employees VALUES
(1, 'Rahul', 'IT', 60000),
(2, 'Aman', 'HR', 45000),
(3, 'Priya', 'Finance', 75000);

-- =========================================
-- Example 1:
-- BEFORE INSERT Trigger
-- =========================================

DELIMITER $$

CREATE TRIGGER before_employee_insert
BEFORE INSERT
ON employees
FOR EACH ROW
BEGIN
    IF NEW.salary < 0 THEN
        SET NEW.salary = 0;
    END IF;
END $$

DELIMITER ;

-- Test
INSERT INTO employees VALUES
(4, 'Neha', 'IT', -5000);

SELECT * FROM employees;

-- =========================================
-- Example 2:
-- AFTER INSERT Trigger
-- Log New Employee
-- =========================================

DELIMITER $$

CREATE TRIGGER after_employee_insert
AFTER INSERT
ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_logs (
        action_type,
        emp_id,
        emp_name,
        action_time
    )
    VALUES (
        'INSERT',
        NEW.emp_id,
        NEW.emp_name,
        NOW()
    );
END $$

DELIMITER ;

-- Test
INSERT INTO employees VALUES
(5, 'Karan', 'HR', 50000);

SELECT * FROM employee_logs;

-- =========================================
-- Example 3:
-- AFTER UPDATE Trigger
-- =========================================

DELIMITER $$

CREATE TRIGGER after_employee_update
AFTER UPDATE
ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_logs (
        action_type,
        emp_id,
        emp_name,
        action_time
    )
    VALUES (
        'UPDATE',
        NEW.emp_id,
        NEW.emp_name,
        NOW()
    );
END $$

DELIMITER ;

-- Test
UPDATE employees
SET salary = 65000
WHERE emp_id = 1;

SELECT * FROM employee_logs;

-- =========================================
-- Example 4:
-- AFTER DELETE Trigger
-- =========================================

DELIMITER $$

CREATE TRIGGER after_employee_delete
AFTER DELETE
ON employees
FOR EACH ROW
BEGIN
    INSERT INTO employee_logs (
        action_type,
        emp_id,
        emp_name,
        action_time
    )
    VALUES (
        'DELETE',
        OLD.emp_id,
        OLD.emp_name,
        NOW()
    );
END $$

DELIMITER ;

-- Test
DELETE FROM employees
WHERE emp_id = 2;

SELECT * FROM employee_logs;

-- =========================================
-- Example 5:
-- Show All Triggers
-- =========================================

SHOW TRIGGERS;

-- =========================================
-- Example 6:
-- Show Trigger Definition
-- =========================================

SHOW CREATE TRIGGER after_employee_insert;

-- =========================================
-- Example 7:
-- Drop Trigger
-- =========================================

DROP TRIGGER IF EXISTS before_employee_insert;
DROP TRIGGER IF EXISTS after_employee_insert;
DROP TRIGGER IF EXISTS after_employee_update;
DROP TRIGGER IF EXISTS after_employee_delete;

-- =========================================
-- End of File
-- =========================================