-- City Sales Performance Analysis
-- SQL Data Analytics Practice Portfolio

-- Business Question:
-- Identify cities with at least 2 customers OR at least ₦100,000
-- in revenue, and compare their sales performance.

SELECT
    customers.city,
    COUNT(DISTINCT customers.customer_id) AS unique_customers,
    COUNT(orders.order_id) AS total_orders,
    SUM(orders.amount) AS total_revenue,
    AVG(orders.amount) AS average_order_value
FROM customers
JOIN orders
    ON customers.customer_id = orders.customer_id
GROUP BY
    customers.city
HAVING
    COUNT(DISTINCT customers.customer_id) >= 2
    OR SUM(orders.amount) >= 100000
ORDER BY
    SUM(orders.amount) DESC;


-- Key Findings:
-- Lagos: 2 unique customers, 5 orders, ₦190,000 revenue,
-- ₦38,000 average order value.
--
-- Abuja: 2 unique customers, 2 orders, ₦110,000 revenue,
-- ₦55,000 average order value.
--
-- Lagos generated higher total revenue, while Abuja had
-- the higher average order value.
--
-- Port Harcourt was excluded because it had only 1 customer
-- and ₦45,000 in revenue.