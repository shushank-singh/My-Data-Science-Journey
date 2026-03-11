-- ============================================
-- Topic      : FULL OUTER JOIN Basics
-- Description: Show all employees and all departments (matched or unmatched)
-- Difficulty : Easy
-- ============================================

SELECT
    e.employee_name,
    d.department_name
FROM employees e
FULL OUTER JOIN departments d
    ON e.department_id = d.department_id;