-- Customer Sales Analysis
-- SQL Data Analytics Practice Portfolio

-- Business Question:
-- Identify high-value customers who placed at least 2 orders
-- and have an average order value of at least ₦40,000.

SELECT
    customers.name,
    customers.city,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.amount) AS total_spent,
    AVG(orders.amount) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.name,
    customers.customer_id,
    customers.city
HAVING
    COUNT(orders.order_id) >= 2
    AND AVG(orders.amount) >= 40000
ORDER BY
    SUM(orders.amount) DESC;


-- Key Findings:
-- Sarah: 2 orders, ₦110,000 total spent, ₦55,000 average order value.
-- Ada: 2 orders, ₦80,000 total spent, ₦40,000 average order value.
--
-- Mary was excluded because although she placed 3 orders and
-- spent ₦110,000, her average order value was approximately ₦36,667.