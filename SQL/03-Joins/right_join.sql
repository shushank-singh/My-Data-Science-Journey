-- ============================================
-- Topic      : RIGHT JOIN Basics
-- Description: Get employee name with department name (show all departments)
-- Difficulty : Easy
-- ============================================

SELECT
    e.employee_name,
    d.department_name
FROM employees e
RIGHT JOIN departments d
    ON e.department_id = d.department_id;