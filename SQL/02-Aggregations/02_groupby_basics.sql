-- ============================================
-- Topic      : GROUP BY Basics
-- Description: Count employees per department
-- Difficulty : Easy
-- ============================================

SELECT
    department,
    COUNT(*) AS emp_count
FROM employees
GROUP BY department;