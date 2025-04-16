# 📊 Sales Trend Analysis Using SQL

## 📁 Repository Contents
This repository includes the following files and folders:

- `online_sales_sql_ready.csv` — Cleaned dataset ready for SQL import.
- `online_sales_analysis.sql` — Complete SQL script with advanced sales trend analysis.
- `README.md` — Documentation of the project and what was implemented.
- `Result_tables/` — Folder containing screenshots of the query results (e.g., monthly revenue, top months, revenue growth).

## 🧠 What I Did

- Prepared and cleaned the original dataset to ensure it was suitable for SQL import.
- Created a new MySQL database and table for storing online sales data.
- Wrote a detailed SQL script that includes:
  - Dropping and creating database/table for clean execution.
  - Import-ready schema matching the dataset.
  - Aggregation to calculate monthly revenue and unique order count using `SUM()` and `COUNT(DISTINCT ...)`.
  - Filtering for a specific year (`2024`) using `EXTRACT(YEAR FROM order_date)`.
  - Sorting data by year and month with `ORDER BY`.
  - Additional queries for:
    - Annual revenue totals
    - Top 3 revenue-generating months
    - NULL value checks
    - Month-over-month revenue growth using window functions (`LAG()`).

This SQL-based analysis helps uncover revenue trends, seasonal order volume, and sales performance over time.

## 📤 How to Use

1. Import `online_sales_sql_ready.csv` into MySQL.
2. Run `online_sales_analysis.sql` using MySQL Workbench or CLI.
3. Refer to `Result_tables` for example outputs and screenshots of result sets.
