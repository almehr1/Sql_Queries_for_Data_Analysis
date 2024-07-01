SELECT 
  product_category,
  SUM(quantity) AS total_quantity_sold
FROM sales
GROUP BY product_category
ORDER BY total_quantity_sold DESC
LIMIT 5;
