-- Total Sales
SELECT SUM(Weekly_Sales) AS Total_Sales FROM walmart;

-- Sales by Store
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC;

-- Holiday vs Non-Holiday Sales
SELECT Holiday_Flag, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Holiday_Flag;

-- Monthly Sales Trend
SELECT MONTH(Date) AS Month, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Month;

-- Top 5 Stores
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC
LIMIT 5;

-- Low Performing Stores
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales ASC
LIMIT 5;

-- Temperature Impact
SELECT ROUND(Temperature), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Temperature);

-- Unemployment Impact
SELECT ROUND(Unemployment), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Unemployment);
