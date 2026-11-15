-- Retail Sales Analysis — SQL portfolio project
-- Dataset: retail_sales_sample.csv (synthetic practice data)
-- Example table: retail_sales

-- 1. Total business KPIs
SELECT
    SUM(units * unit_price) AS total_revenue,
    SUM(units * (unit_price - unit_cost)) AS total_profit,
    SUM(units) AS units_sold,
    ROUND(
        100.0 * SUM(units * (unit_price - unit_cost))
        / NULLIF(SUM(units * unit_price), 0), 2
    ) AS profit_margin_pct
FROM retail_sales;

-- 2. Revenue and profit by region
SELECT
    region,
    SUM(units * unit_price) AS revenue,
    SUM(units * (unit_price - unit_cost)) AS profit
FROM retail_sales
GROUP BY region
ORDER BY revenue DESC;

-- 3. Product performance
SELECT
    product,
    SUM(units) AS units_sold,
    SUM(units * unit_price) AS revenue
FROM retail_sales
GROUP BY product
ORDER BY revenue DESC;

-- 4. Monthly sales trend (PostgreSQL)
SELECT
    DATE_TRUNC('month', sale_date) AS sales_month,
    SUM(units * unit_price) AS revenue
FROM retail_sales
GROUP BY DATE_TRUNC('month', sale_date)
ORDER BY sales_month;
