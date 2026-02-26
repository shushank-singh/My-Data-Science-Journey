-- ============================================
-- Topic      : HAVING Clause
-- Description: Filter departments with more than 5 employees
-- Difficulty : Easy
-- ============================================

SELECT
    department,
    COUNT(*) AS emp_count
FROM employees
GROUP BY department
HAVING COUNT(*) > 5;