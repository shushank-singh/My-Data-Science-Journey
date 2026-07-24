-- =========================================
-- Topic: Set Operators
-- Database: MySQL
-- =========================================

-- Create Students Table
CREATE TABLE students (
    student_id INT,
    student_name VARCHAR(50)
);

-- Create Alumni Table
CREATE TABLE alumni (
    student_id INT,
    student_name VARCHAR(50)
);

-- Insert Data into Students
INSERT INTO students VALUES
(1, 'Rahul'),
(2, 'Aman'),
(3, 'Priya'),
(4, 'Neha');

-- Insert Data into Alumni
INSERT INTO alumni VALUES
(3, 'Priya'),
(4, 'Neha'),
(5, 'Karan'),
(6, 'Simran');

-- =========================================
-- Example 1:
-- UNION
-- Combine Results (Remove Duplicates)
-- =========================================

SELECT * FROM students
UNION
SELECT * FROM alumni;

-- =========================================
-- Example 2:
-- UNION ALL
-- Combine Results (Keep Duplicates)
-- =========================================

SELECT * FROM students
UNION ALL
SELECT * FROM alumni;

-- =========================================
-- Example 3:
-- INTERSECT Equivalent in MySQL
-- Common Records Using INNER JOIN
-- =========================================

SELECT s.*
FROM students s
INNER JOIN alumni a
ON s.student_id = a.student_id;

-- =========================================
-- Example 4:
-- INTERSECT Equivalent
-- Using EXISTS
-- =========================================

SELECT *
FROM students s
WHERE EXISTS (
    SELECT 1
    FROM alumni a
    WHERE s.student_id = a.student_id
);

-- =========================================
-- Example 5:
-- EXCEPT Equivalent in MySQL
-- Students Not in Alumni
-- =========================================

SELECT *
FROM students
WHERE student_id NOT IN (
    SELECT student_id
    FROM alumni
);

-- =========================================
-- Example 6:
-- EXCEPT Equivalent
-- Using LEFT JOIN
-- =========================================

SELECT s.*
FROM students s
LEFT JOIN alumni a
ON s.student_id = a.student_id
WHERE a.student_id IS NULL;

-- =========================================
-- Example 7:
-- Alumni Not in Students
-- =========================================

SELECT *
FROM alumni
WHERE student_id NOT IN (
    SELECT student_id
    FROM students
);

-- =========================================
-- Example 8:
-- UNION with ORDER BY
-- =========================================

SELECT * FROM students
UNION
SELECT * FROM alumni
ORDER BY student_name;

-- =========================================
-- Example 9:
-- UNION of Names Only
-- =========================================

SELECT student_name
FROM students
UNION
SELECT student_name
FROM alumni;

-- =========================================
-- Example 10:
-- Count Total Unique People
-- =========================================

SELECT COUNT(*) AS total_people
FROM (
    SELECT * FROM students
    UNION
    SELECT * FROM alumni
) AS combined;

-- =========================================
-- End of File
-- =========================================