-- =====================================================
-- Retail Sales Data Analysis using SQL
-- Author: Saroj Kumar
-- =====================================================

-- =====================================================
-- 1. DATA CLEANING
-- =====================================================

-- Check for any null values across key columns
SELECT * FROM retail_sales
WHERE
    transaction_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

-- Remove records with null values to ensure data integrity
DELETE FROM retail_sales
WHERE
    transaction_id IS NULL
    OR sale_date IS NULL
    OR sale_time IS NULL
    OR customer_id IS NULL
    OR gender IS NULL
    OR age IS NULL
    OR category IS NULL
    OR quantity IS NULL
    OR price_per_unit IS NULL
    OR cogs IS NULL
    OR total_sale IS NULL;

-- =====================================================
-- 2. DATA EXPLORATION
-- =====================================================

-- View all records
SELECT * FROM retail_sales;

-- Total number of sales transactions
SELECT COUNT(*) AS total_sales FROM retail_sales;

-- Total number of unique customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM retail_sales;

-- List all distinct product categories
SELECT DISTINCT category FROM retail_sales;

-- =====================================================
-- 3. BUSINESS PROBLEMS & ANALYSIS
-- =====================================================

-- Q1: Retrieve all columns for sales made on '2022-11-05'
SELECT *
FROM retail_sales
WHERE sale_date = '2022-11-05';

-- Q2: Retrieve all transactions where category is 'Clothing'
-- and quantity sold is more than 4, in November 2022
SELECT *
FROM retail_sales
WHERE
    category = 'Clothing'
    AND TO_CHAR(sale_date, 'yyyy-mm') = '2022-11'
    AND quantity >= 4;

-- Q3: Calculate total sales and order count for each category
SELECT
    category,
    SUM(total_sale) AS total_sales_amount,
    COUNT(*) AS total_orders
FROM retail_sales
GROUP BY category;

-- Q4: Find the average age of customers who purchased from the 'Beauty' category
SELECT
    AVG(age) AS average_age
FROM retail_sales
WHERE category = 'Beauty';

-- Q5: Find all transactions where total_sale is greater than 1000
SELECT *
FROM retail_sales
WHERE total_sale > 1000;

-- Q6: Find the total number of transactions made by each gender in each category
SELECT
    gender,
    category,
    COUNT(transaction_id) AS total_transactions
FROM retail_sales
GROUP BY gender, category;

-- Q7: Calculate the average sale for each month and find the
-- best-selling month in each year (using window functions)
SELECT
    year,
    month,
    avg_sale
FROM (
    SELECT
        EXTRACT(YEAR FROM sale_date) AS year,
        EXTRACT(MONTH FROM sale_date) AS month,
        AVG(total_sale) AS avg_sale,
        RANK() OVER (
            PARTITION BY EXTRACT(YEAR FROM sale_date)
            ORDER BY AVG(total_sale) DESC
        ) AS rank
    FROM retail_sales
    GROUP BY 1, 2
) AS t1
WHERE rank = 1;

-- Q8: Find the top 5 customers based on the highest total sales
SELECT
    customer_id,
    SUM(total_sale) AS total_sales
FROM retail_sales
GROUP BY customer_id
ORDER BY total_sales DESC
LIMIT 5;

-- Q9: Find the number of unique customers who purchased items from each category
SELECT
    category,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM retail_sales
GROUP BY category;

-- Q10: Create shifts (Morning <=12, Afternoon 13-17, Evening >17)
-- and find the number of orders in each shift
SELECT
    CASE
        WHEN EXTRACT(HOUR FROM sale_time) <= 12 THEN 'Morning'
        WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 13 AND 17 THEN 'Afternoon'
        ELSE 'Evening'
    END AS shift,
    COUNT(transaction_id) AS total_orders
FROM retail_sales
GROUP BY shift
ORDER BY shift;

-- =====================================================
-- End of Project
-- =====================================================
