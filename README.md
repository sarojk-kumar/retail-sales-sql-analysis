# Retail Sales Data Analysis using SQL

## 📌 Project Overview
This project involves analyzing a retail sales dataset using SQL to extract meaningful business insights. The workflow covers data cleaning, exploratory data analysis (EDA), and solving real-world business problems through structured SQL queries.

## 🎯 Objective
To clean, explore, and analyze retail sales data in order to answer key business questions such as top-performing categories, customer behavior, peak sales periods, and revenue trends.

## 🛠️ Tools Used
- SQL (PostgreSQL / MySQL syntax)
- Concepts: Aggregate functions, GROUP BY, CASE statements, Window functions (RANK, PARTITION BY), Date/Time functions

## 📂 Project Workflow

### 1. Data Cleaning
- Identified records with missing/null values across key fields (transaction ID, sale date, sale time, customer ID, gender, age, category, quantity, price per unit, COGS, total sale).
- Removed incomplete records to ensure data integrity before analysis.

### 2. Data Exploration
- Counted total number of sales transactions.
- Counted total unique customers.
- Identified distinct product categories in the dataset.

### 3. Business Problems Solved
The project answers 10+ real business questions using SQL, including:

| # | Business Question |
|---|---|
| 1 | Retrieve all sales made on a specific date |
| 2 | Find all Clothing category transactions with quantity > 4 in November 2022 |
| 3 | Calculate total sales and order count for each category |
| 4 | Find the average age of customers who purchased from the Beauty category |
| 5 | Find all transactions where total sale amount is greater than 1000 |
| 6 | Find total transactions by gender within each category |
| 7 | Find the best-selling month in each year based on average sales (using window functions) |
| 8 | Find the top 5 customers based on highest total sales |
| 9 | Find the number of unique customers who purchased from each category |
| 10 | Categorize orders into Morning, Afternoon, and Evening shifts and count orders per shift |

## 💡 Key Insights
- Identified top-performing product categories by total revenue.
- Found the top 5 highest-spending customers.
- Determined the best-selling month for each year using window functions.
- Analyzed customer purchase patterns by gender and category.
- Segmented orders by time of day (shift-wise analysis) to understand peak business hours.

## 📈 Skills Demonstrated
- Data Cleaning & Data Integrity Checks
- Exploratory Data Analysis (EDA)
- Aggregate Functions (SUM, AVG, COUNT)
- GROUP BY & Multi-column Grouping
- CASE Statements for Categorization
- Window Functions (RANK, PARTITION BY)
- Date/Time Functions (EXTRACT, TO_CHAR)

## 📁 Files
- `retail_sales_analysis.sql` — Contains all SQL queries used in this project (data cleaning, exploration, and business analysis).

## 🙋 About Me
**Saroj Kumar**
Data Analyst (Fresher) | B.Tech CSE
[LinkedIn](https://www.linkedin.com/in/saroj-kumar-84543b332)
