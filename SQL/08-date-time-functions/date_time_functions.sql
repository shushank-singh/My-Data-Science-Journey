-- =========================================
-- Topic: Date & Time Functions
-- Database: MySQL
-- =========================================

-- Create Orders Table
CREATE TABLE orders (
    order_id INT,
    customer_name VARCHAR(50),
    order_date DATE,
    order_time TIME,
    created_at DATETIME
);

-- Insert Data
INSERT INTO orders VALUES
(1, 'Rahul', '2025-01-10', '10:30:00', '2025-01-10 10:30:00'),
(2, 'Aman', '2025-02-15', '14:20:00', '2025-02-15 14:20:00'),
(3, 'Priya', '2025-03-05', '09:10:00', '2025-03-05 09:10:00'),
(4, 'Neha', '2025-04-12', '18:45:00', '2025-04-12 18:45:00'),
(5, 'Karan', '2025-05-20', '11:15:00', '2025-05-20 11:15:00');

-- =========================================
-- Example 1:
-- Current Date
-- =========================================

SELECT CURDATE();

-- =========================================
-- Example 2:
-- Current Time
-- =========================================

SELECT CURTIME();

-- =========================================
-- Example 3:
-- Current Date & Time
-- =========================================

SELECT NOW();

-- =========================================
-- Example 4:
-- Extract Year, Month and Day
-- =========================================

SELECT
    customer_name,
    order_date,
    YEAR(order_date) AS year,
    MONTH(order_date) AS month,
    DAY(order_date) AS day
FROM orders;

-- =========================================
-- Example 5:
-- Extract Hour, Minute and Second
-- =========================================

SELECT
    customer_name,
    created_at,
    HOUR(created_at) AS hour,
    MINUTE(created_at) AS minute,
    SECOND(created_at) AS second
FROM orders;

-- =========================================
-- Example 6:
-- Date Difference
-- Days Since Order
-- =========================================

SELECT
    customer_name,
    order_date,
    DATEDIFF(CURDATE(), order_date) AS days_passed
FROM orders;

-- =========================================
-- Example 7:
-- Add Days
-- =========================================

SELECT
    customer_name,
    order_date,
    DATE_ADD(order_date, INTERVAL 10 DAY) AS delivery_date
FROM orders;

-- =========================================
-- Example 8:
-- Subtract Months
-- =========================================

SELECT
    customer_name,
    order_date,
    DATE_SUB(order_date, INTERVAL 1 MONTH) AS previous_month
FROM orders;

-- =========================================
-- Example 9:
-- Format Date
-- =========================================

SELECT
    customer_name,
    DATE_FORMAT(order_date, '%d-%m-%Y') AS formatted_date
FROM orders;

-- =========================================
-- Example 10:
-- Month Name
-- =========================================

SELECT
    customer_name,
    MONTHNAME(order_date) AS month_name
FROM orders;

-- =========================================
-- Example 11:
-- Day Name
-- =========================================

SELECT
    customer_name,
    DAYNAME(order_date) AS day_name
FROM orders;

-- =========================================
-- Example 12:
-- Last Day of Month
-- =========================================

SELECT
    customer_name,
    LAST_DAY(order_date) AS month_end
FROM orders;

-- =========================================
-- Example 13:
-- Timestamp Difference (Days)
-- =========================================

SELECT
    customer_name,
    TIMESTAMPDIFF(
        DAY,
        order_date,
        CURDATE()
    ) AS total_days
FROM orders;

-- =========================================
-- Example 14:
-- Extract Date from DATETIME
-- =========================================

SELECT
    customer_name,
    DATE(created_at) AS only_date
FROM orders;

-- =========================================
-- Example 15:
-- Extract Time from DATETIME
-- =========================================

SELECT
    customer_name,
    TIME(created_at) AS only_time
FROM orders;

-- =========================================
-- End of File
-- =========================================