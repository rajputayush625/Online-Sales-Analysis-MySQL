-- STEP 1: Create and use the database
DROP DATABASE IF EXISTS online_sales_db;
CREATE DATABASE online_sales_db;
USE online_sales_db;

-- STEP 2: Drop table if exists (for clean re-run)
DROP TABLE IF EXISTS online_sales;

-- STEP 3: Create the sales table
CREATE TABLE online_sales (
    transaction_id INT,
    order_date DATE,
    total_revenue DECIMAL(10, 2)
);



-- STEP 5: Monthly Revenue and Order Volume (main task)
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    EXTRACT(MONTH FROM order_date) AS order_month,
    SUM(total_revenue) AS total_revenue,
    COUNT(DISTINCT transaction_id) AS total_orders
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = 2024
GROUP BY
    EXTRACT(YEAR FROM order_date),
    EXTRACT(MONTH FROM order_date)
ORDER BY
    order_year,
    order_month;

-- STEP 6: Total Annual Revenue
SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(total_revenue) AS annual_revenue
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = 2024
GROUP BY
    order_year;

-- STEP 7: Top 3 Months by Revenue
SELECT
    EXTRACT(MONTH FROM order_date) AS month,
    SUM(total_revenue) AS monthly_revenue
FROM
    online_sales
WHERE
    EXTRACT(YEAR FROM order_date) = 2024
GROUP BY
    month
ORDER BY
    monthly_revenue DESC
LIMIT 3;

-- STEP 8: Handle NULLs in Revenue (if any exist)
-- Check for NULL revenue rows
SELECT * FROM online_sales WHERE total_revenue IS NULL;

-- STEP 9: Month-over-Month Growth (Optional Advanced)
-- This uses a subquery with window functions (MySQL 8+ required)
WITH monthly_data AS (
    SELECT
        EXTRACT(YEAR FROM order_date) AS year,
        EXTRACT(MONTH FROM order_date) AS month,
        SUM(total_revenue) AS revenue
    FROM
        online_sales
    WHERE
        EXTRACT(YEAR FROM order_date) = 2024
    GROUP BY
        year, month
)
SELECT
    year,
    month,
    revenue,
    LAG(revenue) OVER (ORDER BY year, month) AS prev_month_revenue,
    ROUND(((revenue - LAG(revenue) OVER (ORDER BY year, month)) / LAG(revenue) OVER (ORDER BY year, month)) * 100, 2) AS revenue_growth_percent
FROM
    monthly_data;
