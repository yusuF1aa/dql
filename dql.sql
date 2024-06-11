SELECT * FROM customers;
SELECT product_name, category 
FROM products 
WHERE price BETWEEN 5000 AND 10000;
SELECT * 
FROM products 
ORDER BY price DESC;
SELECT COUNT(*) AS total_orders,
       AVG(amount) AS average_amount,
       MAX(amount) AS highest_amount,
       MIN(amount) AS lowest_amount
FROM orders;
SELECT product_id, COUNT(*) AS number_of_orders 
FROM order_items 
GROUP BY product_id;
SELECT customer_id
FROM orders
GROUP BY customer_id
HAVING COUNT(*) > 2;
SELECT DATE_FORMAT(order_date, '%Y-%m') AS month, 
       COUNT(*) AS number_of_orders
FROM orders
WHERE order_date BETWEEN '2020-01-01' AND '2020-12-31'
GROUP BY month;
SELECT orders.order_id, products.product_name, customers.customer_name, orders.order_date
FROM orders
JOIN order_items ON orders.order_id = order_items.order_id
JOIN products ON order_items.product_id = products.product_id
JOIN customers ON orders.customer_id = customers.customer_id;
SELECT *
FROM orders
WHERE order_date = DATE_SUB(CURDATE(), INTERVAL 3 MONTH);
SELECT customer_id
FROM customers
WHERE customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);
