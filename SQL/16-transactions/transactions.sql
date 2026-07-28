-- =========================================
-- Topic: Transactions (COMMIT, ROLLBACK, SAVEPOINT)
-- Database: MySQL
-- =========================================

-- Create Accounts Table
CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder VARCHAR(50),
    balance DECIMAL(10,2)
);

-- Insert Sample Data
INSERT INTO accounts VALUES
(101, 'Rahul', 10000),
(102, 'Priya', 15000),
(103, 'Aman', 8000);

-- =========================================
-- Example 1:
-- View Initial Data
-- =========================================

SELECT * FROM accounts;

-- =========================================
-- Example 2:
-- Start Transaction
-- =========================================

START TRANSACTION;

UPDATE accounts
SET balance = balance - 2000
WHERE account_id = 101;

UPDATE accounts
SET balance = balance + 2000
WHERE account_id = 102;

SELECT * FROM accounts;

-- =========================================
-- Example 3:
-- Commit Transaction
-- Changes Become Permanent
-- =========================================

COMMIT;

SELECT * FROM accounts;

-- =========================================
-- Example 4:
-- Rollback Transaction
-- Undo Changes Before Commit
-- =========================================

START TRANSACTION;

UPDATE accounts
SET balance = balance - 1000
WHERE account_id = 102;

UPDATE accounts
SET balance = balance + 1000
WHERE account_id = 103;

ROLLBACK;

SELECT * FROM accounts;

-- =========================================
-- Example 5:
-- SAVEPOINT Example
-- =========================================

START TRANSACTION;

UPDATE accounts
SET balance = balance - 500
WHERE account_id = 101;

SAVEPOINT after_first_update;

UPDATE accounts
SET balance = balance + 500
WHERE account_id = 103;

ROLLBACK TO after_first_update;

COMMIT;

SELECT * FROM accounts;

-- =========================================
-- Example 6:
-- Multiple SAVEPOINTS
-- =========================================

START TRANSACTION;

UPDATE accounts
SET balance = balance - 300
WHERE account_id = 101;

SAVEPOINT sp1;

UPDATE accounts
SET balance = balance + 300
WHERE account_id = 102;

SAVEPOINT sp2;

UPDATE accounts
SET balance = balance + 200
WHERE account_id = 103;

ROLLBACK TO sp2;

COMMIT;

SELECT * FROM accounts;

-- =========================================
-- Example 7:
-- Delete Data with Rollback
-- =========================================

START TRANSACTION;

DELETE FROM accounts
WHERE account_id = 103;

ROLLBACK;

SELECT * FROM accounts;

-- =========================================
-- Example 8:
-- Insert Data with Commit
-- =========================================

START TRANSACTION;

INSERT INTO accounts
VALUES (104, 'Neha', 12000);

COMMIT;

SELECT * FROM accounts;

-- =========================================
-- End of File
-- =========================================