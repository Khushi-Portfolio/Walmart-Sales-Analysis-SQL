# Walmart Sales Analysis using SQL

## 📊 Project Overview

This project focuses on analyzing Walmart sales data using SQL to uncover business insights. The dataset contains store-level weekly sales along with external factors such as temperature, fuel price, CPI, and unemployment.

The objective is to transform raw data into meaningful insights that help understand sales performance and business trends.
---
## 🎯 Objectives
* Perform data cleaning and preprocessing
* Convert inconsistent date formats into SQL DATE format
* Analyze sales trends across stores and time
* Identify top-performing and low-performing stores
* Evaluate the impact of external factors on sales
---
## 🗂️ Dataset Information
The dataset includes the following columns:
* Store
* Date
* Weekly_Sales
* Holiday_Flag
* Temperature
* Fuel_Price
* CPI
* Unemployment
---
## 🔧 Data Cleaning
* The Date column was initially stored as text in `DD-MM-YYYY` format
* Converted into proper DATE format using SQL:

```sql
UPDATE walmart
SET Date = STR_TO_DATE(Date, '%d-%m-%Y');

ALTER TABLE walmart
MODIFY Date DATE;
```

---

## 📊 SQL Analysis

### 1. Total Sales

```sql
SELECT SUM(Weekly_Sales) AS Total_Sales FROM walmart;
```

---

### 2. Sales by Store

```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC;
```

---

### 3. Holiday vs Non-Holiday Sales

```sql
SELECT Holiday_Flag, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Holiday_Flag;
```
### 4. Monthly Sales Trend
```sql
SELECT MONTH(Date) AS Month, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Month;
```
### 5. Top 5 Stores
```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales DESC
LIMIT 5;
```
### 6. Low Performing Stores
```sql
SELECT Store, SUM(Weekly_Sales) AS Sales
FROM walmart
GROUP BY Store
ORDER BY Sales ASC
LIMIT 5;
```
### 7. External Factors Impact
```sql
SELECT ROUND(Temperature), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Temperature);

SELECT ROUND(Unemployment), AVG(Weekly_Sales)
FROM walmart
GROUP BY ROUND(Unemployment);
```
## 📈 Key Insights
* Certain stores contribute significantly higher sales than others
* Sales patterns differ during holiday and non-holiday periods
* Monthly trends indicate seasonal variations
* External factors like temperature and unemployment influence sales
* Some stores consistently underperform and require attention
---
## 🛠️ Tools & Technologies
* SQL (MySQL)
* Excel (Data Preparation)
* phpMyAdmin
---
## 💡 Conclusion
This project demonstrates how SQL can be used to analyze real-world business data and generate actionable insights. It highlights skills in data cleaning, querying, and interpreting results for decision-making.
Khushikumar Shahukara
Aspiring Business Analyst | Marketing Analyst
