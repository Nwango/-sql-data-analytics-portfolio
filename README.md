SQL Data Analytics Portfolio

Welcome to my SQL Data Analytics Practice Portfolio.

I am currently developing my skills in SQL and Microsoft Excel as I work toward building a career in Data Analytics.

This portfolio demonstrates my ability to translate business questions into SQL queries, analyse data, identify patterns, and communicate analytical findings clearly.

Project: Customer Sales Analysis

Project Overview

This project uses a sample customer and orders dataset to practise SQL-based business analysis.

The analysis focuses on customer purchasing behaviour, order frequency, spending, city-level revenue, and identifying customers based on specific business conditions.

Business Questions

1. Which customers have placed orders, and how much have they spent?
2. Which customers have placed at least two orders while spending less than ₦100,000?
3. Which cities have at least two customers or at least ₦100,000 in revenue?
4. Which customers have never placed an order?
5. Which customers have placed at least one order worth ₦50,000 or more?
6. Which cities generated more than ₦70,000 from orders worth ₦30,000 or more?
7. Which customers have placed at least one order?

SQL Analysis

Question 1: Customer Orders and Spending

```sql
SELECT customers.name,
       customers.city,
       COUNT(orders.order_id) AS total_orders,
       SUM(orders.amount) AS total_spent
FROM customers
LEFT JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name, customers.customer_id, customers.city
ORDER BY SUM(orders.amount) DESC;
```

Finding: Mary and Sarah recorded the highest total spending at ₦110,000 each. Mary had 3 orders, Sarah 2, Ada 2 orders and ₦80,000, David 1 order and ₦45,000, while John had no recorded orders.

Question 2: At Least Two Orders and Spending Below ₦100,000

```sql
SELECT customers.name,
       customers.city,
       COUNT(orders.order_id) AS total_orders,
       SUM(orders.amount) AS total_spent
FROM customers
INNER JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.name, customers.customer_id, customers.city
HAVING COUNT(orders.order_id) >= 2
   AND SUM(orders.amount) < 100000
ORDER BY SUM(orders.amount) DESC;
```

Finding: Ada was the only customer who placed at least 2 orders while spending less than ₦100,000. Ada placed 2 orders and spent ₦80,000.

Question 3: City-Level Customer and Sales Analysis

```sql
SELECT customers.city,
       COUNT(DISTINCT customers.customer_id),
       COUNT(orders.order_id) AS total_orders,
       SUM(orders.amount) AS total_revenue
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
GROUP BY customers.city
HAVING COUNT(DISTINCT customers.customer_id) >= 2
    OR SUM(orders.amount) >= 100000
ORDER BY SUM(orders.amount) DESC;
```

Finding: Lagos generated ₦190,000 from 5 orders and 2 customers. Abuja generated ₦110,000 from 2 orders and 2 customers. Port Harcourt generated ₦45,000 from 1 order and 1 customer.

The OR condition means a city qualifies if it has at least 2 customers or at least ₦100,000 in revenue.

Revenue by City

• Lagos: ₦190,000
• Abuja: ₦110,000
• Port Harcourt: ₦45,000

Revenue by City

Question 4: Customers Who Never Placed an Order

```sql
SELECT customers.name,
       customers.city
FROM customers
WHERE NOT EXISTS (
    SELECT orders.order_id
    FROM orders
    WHERE orders.customer_id = customers.customer_id
);
```

Finding: John from Abuja had no recorded orders.

Question 5: Customers With at Least One Order Worth ₦50,000 or More

```sql
SELECT customers.name,
       customers.city
FROM customers
WHERE EXISTS (
    SELECT orders.order_id
    FROM orders
    WHERE orders.customer_id = customers.customer_id
      AND orders.amount >= 50000
);
```

Finding: Ada, Mary, and Sarah each had at least one order worth ₦50,000 or more.

Question 6: Cities With More Than ₦70,000 From Orders of ₦30,000 or More

```sql
SELECT customers.city,
       SUM(orders.amount) AS total_revenue
FROM customers
JOIN orders
ON customers.customer_id = orders.customer_id
WHERE orders.amount >= 30000
GROUP BY customers.city
HAVING SUM(orders.amount) > 70000
ORDER BY SUM(orders.amount) DESC;
```

Finding: Lagos and Abuja generated more than ₦70,000 from orders worth ₦30,000 or more. Port Harcourt was excluded because its qualifying revenue did not exceed ₦70,000.

This also demonstrates the difference between WHERE, which filters individual rows before grouping, and HAVING, which filters grouped results.

Question 7: Customers Who Placed At Least One Order

```sql
SELECT customers.name,
       customers.city
FROM customers
WHERE EXISTS (
    SELECT orders.order_id
    FROM orders
    WHERE orders.customer_id = customers.customer_id
);
```

Finding: Ada, Mary, David, and Sarah had at least one recorded order. John had none.

SQL Concepts Practised

• SELECT
• WHERE
• ORDER BY
• GROUP BY
• HAVING
• INNER JOIN
• LEFT JOIN
• COUNT()
• COUNT(DISTINCT …)
• SUM()
• AVG()
• EXISTS
• NOT EXISTS
• Subqueries
• Filtering and conditional analysis
• Aggregation
• Business problem solving

Skills Demonstrated

• Translating business questions into SQL queries
• Working with related tables using JOINs
• Aggregating and summarising data
• Applying conditions before and after grouping
• Using subqueries to answer business questions
• Analysing customer and city-level performance
• Identifying patterns and relevant findings
• Communicating analytical findings clearly

Repository Files

• customer-sales-analysis.sql — customer-level sales analysis
• city-sales-performance.sql — city-level sales analysis
• revenue-by-city.png — revenue comparison visual

About This Portfolio

The projects in this repository are based on SQL practice and business-style analysis exercises. They demonstrate my developing ability to translate business questions into SQL queries and communicate the findings clearly.

Note: This is a personal SQL practice project using a sample dataset. The findings are observations from the practice data and are not presented as professional company experience.

  
