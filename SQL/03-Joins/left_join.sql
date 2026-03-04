-- ============================================
-- Topic      : LEFT JOIN Basics
-- Description: Get all employees with their department name (including employees without a department)
-- Difficulty : Easy
-- ============================================

SELECT
    e.employee_name,
    d.department_name
FROM employees e
LEFT JOIN departments d
    ON e.department_id = d.department_id;