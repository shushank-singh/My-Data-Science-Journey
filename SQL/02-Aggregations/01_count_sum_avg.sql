-- ============================================
-- Topic: Aggregation Functions
-- Functions: COUNT, SUM, AVG
-- Difficulty: Easy
-- ============================================

-- Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

-- Sum of all salaries
SELECT SUM(salary) AS total_salary
FROM employees;

-- Average salary
SELECT AVG(salary) AS avg_salary
FROM employees;