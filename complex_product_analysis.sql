WITH TopSellingProducts AS (
  SELECT 
    products.product_name, 
    SUM(order_items.quantity) AS total_quantity
  FROM 
    products
  INNER JOIN order_items ON products.product_id = order_items.product_id
  GROUP BY products.product_name
  ORDER BY total_quantity DESC
  LIMIT 5
),
CustomerPurchasePatterns AS (
  SELECT 
    customers.customer_name, 
    COUNT(DISTINCT orders.order_id) AS total_orders, 
    AVG(orders.total_amount) AS average_order_value
  FROM 
    customers
  INNER JOIN orders ON customers.customer_id = orders.customer_id
  GROUP BY customers.customer_name
)
SELECT 
  TopSellingProducts.product_name, 
  CustomerPurchasePatterns.customer_name, 
  CustomerPurchasePatterns.total_orders, 
  CustomerPurchasePatterns.average_order_value
FROM 
  TopSellingProducts
INNER JOIN CustomerPurchasePatterns ON TopSellingProducts.product_name IN (
  SELECT 
    products.product_name
  FROM 
    products
  INNER JOIN order_items ON products.product_id = order_items.product_id
  INNER JOIN orders ON order_items.order_id = orders.customer_id
  WHERE 
    orders.customer_id = CustomerPurchasePatterns.customer_id
);
