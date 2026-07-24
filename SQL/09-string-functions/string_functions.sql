-- =========================================
-- Topic: String Functions
-- Database: MySQL
-- =========================================

-- Create Customers Table
CREATE TABLE customers (
    customer_id INT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    city VARCHAR(50)
);

-- Insert Data
INSERT INTO customers VALUES
(1, 'Rahul', 'Sharma', 'rahul@gmail.com', 'delhi'),
(2, 'Aman', 'Verma', 'aman@yahoo.com', 'mumbai'),
(3, 'Priya', 'Singh', 'priya@hotmail.com', 'kolkata'),
(4, 'Neha', 'Gupta', 'neha@gmail.com', 'bangalore'),
(5, 'Karan', 'Mehta', 'karan@gmail.com', 'pune');

-- =========================================
-- Example 1:
-- Convert to Uppercase
-- =========================================

SELECT
    first_name,
    UPPER(first_name) AS upper_name
FROM customers;

-- =========================================
-- Example 2:
-- Convert to Lowercase
-- =========================================

SELECT
    city,
    LOWER(city) AS lower_city
FROM customers;

-- =========================================
-- Example 3:
-- Concatenate First & Last Name
-- =========================================

SELECT
    CONCAT(first_name, ' ', last_name) AS full_name
FROM customers;

-- =========================================
-- Example 4:
-- String Length
-- =========================================

SELECT
    first_name,
    LENGTH(first_name) AS total_characters
FROM customers;

-- =========================================
-- Example 5:
-- Left Characters
-- =========================================

SELECT
    email,
    LEFT(email, 5) AS first_five_chars
FROM customers;

-- =========================================
-- Example 6:
-- Right Characters
-- =========================================

SELECT
    email,
    RIGHT(email, 9) AS domain
FROM customers;

-- =========================================
-- Example 7:
-- Extract Substring
-- =========================================

SELECT
    email,
    SUBSTRING(email, 1, 5) AS username
FROM customers;

-- =========================================
-- Example 8:
-- Replace Text
-- =========================================

SELECT
    email,
    REPLACE(email, 'gmail.com', 'company.com') AS updated_email
FROM customers;

-- =========================================
-- Example 9:
-- Remove Spaces
-- =========================================

SELECT
    TRIM('   SQL Learning   ') AS trimmed_text;

-- =========================================
-- Example 10:
-- Reverse String
-- =========================================

SELECT
    first_name,
    REVERSE(first_name) AS reversed_name
FROM customers;

-- =========================================
-- Example 11:
-- Find Position
-- =========================================

SELECT
    email,
    LOCATE('@', email) AS at_position
FROM customers;

-- =========================================
-- Example 12:
-- Repeat String
-- =========================================

SELECT
    REPEAT('SQL ', 3) AS repeated_text;

-- =========================================
-- Example 13:
-- Pad String
-- =========================================

SELECT
    LPAD(customer_id, 5, '0') AS padded_id
FROM customers;

-- =========================================
-- Example 14:
-- Count Characters
-- =========================================

SELECT
    first_name,
    CHAR_LENGTH(first_name) AS characters
FROM customers;

-- =========================================
-- Example 15:
-- Full Customer Information
-- =========================================

SELECT
    CONCAT(
        UPPER(first_name),
        ' ',
        UPPER(last_name),
        ' - ',
        LOWER(city)
    ) AS customer_info
FROM customers;

-- =========================================
-- End of File
-- =========================================