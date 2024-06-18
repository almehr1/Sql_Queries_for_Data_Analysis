-- 1. Gesamtumsatz pro Kunde
SELECT
  customer_id,
  SUM(quantity * price) AS total_sales
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_id;

-- 2. Meistverkaufte Produkte
SELECT
  product_id,
  product_name,
  SUM(quantity) AS total_sales
FROM orders
JOIN products ON orders.product_id = products.product_id
GROUP BY product_id, product_name
ORDER BY total_sales DESC;

-- 3. Top 10 Kunden nach Umsatz
SELECT
  customer_id,
  customer_name,
  SUM(quantity * price) AS total_sales
FROM orders
JOIN customers ON orders.customer_id = customers.customer_id
GROUP BY customer_id, customer_name
ORDER BY total_sales DESC
LIMIT 10;

