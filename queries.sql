-- ==============================
-- WALMART SQL PROJECT
-- ==============================

-- 1. CREATE DATABASE
CREATE DATABASE walmart_db;
USE walmart_db;

-- ==============================
-- 2. CREATE TABLE
-- ==============================
CREATE TABLE walmart (
Store INT,
Date VARCHAR(20),   -- initially as text
Weekly_Sales FLOAT,
Holiday_Flag INT,
Temperature FLOAT,
Fuel_Price FLOAT,
CPI FLOAT,
Unemployment FLOAT
);

-- ==============================
-- 3. DATA CLEANING
-- ==============================

-- Convert Date from text to DATE format
UPDATE walmart
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

-- Change column type to DATE
ALTER TABLE walmart
MODIFY Date DATE;

-- ==============================
-- 4. DATA VALIDATION
-- ==============================

-- Total number of records
SELECT COUNT(*) AS total_rows FROM walmart;

-- ==============================
-- 5. DATA ANALYSIS
-- ==============================

-- 5.1 Total Sales
SELECT SUM(Weekly_Sales) AS Total_Sales
FROM walmart;

-- 5.2 Sales by Store
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC;

-- 5.3 Holiday vs Non-Holiday Sales
SELECT Holiday_Flag, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Holiday_Flag;

-- 5.4 Monthly Sales Trend
SELECT MONTH(Date) AS Month, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Month
ORDER BY Month;

-- 5.5 Top 5  Stores
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC
LIMIT 5;

-- 5.6 Lowest Performing Stores
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales ASC
LIMIT 5;

-- ==============================
-- 6. EXTERNAL FACTOR ANALYSIS
-- ==============================

-- 6.1 Temperature Impact on Sales
SELECT ROUND(Temperature), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Temperature);

-- 6.2 Unemployment Impact on Sales
SELECT ROUND(Unemployment), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Unemployment);
-- ==============================
-- END OF PROJECT
-- ==============================
