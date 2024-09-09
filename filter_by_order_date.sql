SELECT
    order_date,
    SUM(total_price) AS total_daily_revenue,
    AVG(total_price) AS average_order_value
FROM orders
WHERE order_date BETWEEN '2024-07-01' AND '2024-07-07'
GROUP BY order_date;
