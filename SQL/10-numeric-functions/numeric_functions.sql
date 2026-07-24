-- =========================================
-- Topic: Numeric Functions
-- Database: MySQL
-- =========================================

-- Create Products Table
CREATE TABLE products (
    product_id INT,
    product_name VARCHAR(50),
    price DECIMAL(10,2),
    discount DECIMAL(5,2)
);

-- Insert Data
INSERT INTO products VALUES
(1, 'Laptop', 59999.99, 10.50),
(2, 'Mouse', 799.49, 5.25),
(3, 'Keyboard', 1499.75, 8.00),
(4, 'Monitor', 12999.99, 12.50),
(5, 'Headphones', 2499.50, 7.75);

-- =========================================
-- Example 1:
-- Absolute Value
-- =========================================

SELECT ABS(-250) AS absolute_value;

-- =========================================
-- Example 2:
-- Round Price
-- =========================================

SELECT
    product_name,
    price,
    ROUND(price) AS rounded_price
FROM products;

-- =========================================
-- Example 3:
-- Round to 1 Decimal Place
-- =========================================

SELECT
    product_name,
    ROUND(price, 1) AS rounded_price
FROM products;

-- =========================================
-- Example 4:
-- Ceiling Value
-- =========================================

SELECT
    product_name,
    price,
    CEIL(price) AS ceiling_price
FROM products;

-- =========================================
-- Example 5:
-- Floor Value
-- =========================================

SELECT
    product_name,
    price,
    FLOOR(price) AS floor_price
FROM products;

-- =========================================
-- Example 6:
-- Power Function
-- =========================================

SELECT POWER(5, 2) AS square_value;

-- =========================================
-- Example 7:
-- Square Root
-- =========================================

SELECT SQRT(144) AS square_root;

-- =========================================
-- Example 8:
-- Modulus
-- =========================================

SELECT
    product_id,
    MOD(product_id, 2) AS remainder
FROM products;

-- =========================================
-- Example 9:
-- Random Number
-- =========================================

SELECT RAND() AS random_number;

-- =========================================
-- Example 10:
-- Truncate Value
-- =========================================

SELECT
    product_name,
    TRUNCATE(price, 1) AS truncated_price
FROM products;

-- =========================================
-- Example 11:
-- Calculate Discount Amount
-- =========================================

SELECT
    product_name,
    price,
    discount,
    ROUND(price * discount / 100, 2) AS discount_amount
FROM products;

-- =========================================
-- Example 12:
-- Final Price After Discount
-- =========================================

SELECT
    product_name,
    price,
    discount,
    ROUND(price - (price * discount / 100), 2) AS final_price
FROM products;

-- =========================================
-- Example 13:
-- Sign of Number
-- =========================================

SELECT
    SIGN(-25) AS negative,
    SIGN(0) AS zero,
    SIGN(35) AS positive;

-- =========================================
-- Example 14:
-- Greatest & Least Value
-- =========================================

SELECT
    GREATEST(15, 40, 28, 75) AS greatest_value,
    LEAST(15, 40, 28, 75) AS least_value;

-- =========================================
-- Example 15:
-- PI Value
-- =========================================

SELECT PI() AS pi_value;

-- =========================================
-- End of File
-- =========================================