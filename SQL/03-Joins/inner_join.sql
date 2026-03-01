-- ============================================
-- Topic      : INNER JOIN Basics
-- Description: Get employee name with department name
-- Difficulty : Easy
-- ============================================

SELECT
    e.employee_name,
    d.department_name
FROM employees e
INNER JOIN departments d
    ON e.department_id = d.department_id;