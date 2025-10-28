Use online_sales;

select * from online_sales_dataset;

-- Monthly Revenue and Order Volume
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount), 2) AS monthly_revenue,
    COUNT(DISTINCT order_id) AS order_volume
FROM online_sales_dataset
GROUP BY year, month
ORDER BY year, month;

-- Top 3 Months by Sales
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount), 2) AS monthly_revenue
FROM online_sales_dataset
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- Revenue by Category
SELECT
    category,
    ROUND(SUM(amount), 2) AS total_revenue
FROM online_sales_dataset
GROUP BY category
ORDER BY total_revenue DESC;


-- Average Order Value per Month
SELECT
    EXTRACT(YEAR FROM order_date) AS year,
    EXTRACT(MONTH FROM order_date) AS month,
    ROUND(SUM(amount) / COUNT(DISTINCT order_id), 2) AS avg_order_value
FROM online_sales_dataset
GROUP BY year, month
ORDER BY year, month;