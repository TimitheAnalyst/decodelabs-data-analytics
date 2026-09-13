-- Project 3: SQL Data Analysis
-- Dataset: E-commerce Orders (1200 rows)

-- 1. Basic SELECT + WHERE: list delivered orders
SELECT "OrderID", "Product", "TotalPrice"
FROM orders
WHERE "OrderStatus" = 'Delivered';

-- 2. SELECT + WHERE + ORDER BY: delivered orders sorted by value, highest first
SELECT "OrderID", "Product", "TotalPrice"
FROM orders
WHERE "OrderStatus" = 'Delivered'
ORDER BY "TotalPrice" DESC;

-- 3. GROUP BY + COUNT: number of orders per product
SELECT "Product", COUNT(*) AS total_orders
FROM orders
GROUP BY "Product"
ORDER BY total_orders DESC;

-- 4. GROUP BY + SUM + AVG: revenue and average order value per product
SELECT "Product", 
       SUM("TotalPrice") AS total_revenue,
       ROUND(AVG("TotalPrice"), 2) AS avg_order_value
FROM orders
GROUP BY "Product"
ORDER BY total_revenue DESC;

-- 5. HAVING: products with total revenue above 180,000
SELECT "Product", 
       SUM("TotalPrice") AS total_revenue,
       ROUND(AVG("TotalPrice"), 2) AS avg_order_value
FROM orders
GROUP BY "Product"
HAVING SUM("TotalPrice") > 180000
ORDER BY total_revenue DESC;

-- 6. Subquery: each product's revenue as a percentage of total company revenue
SELECT "Product", 
       SUM("TotalPrice") AS total_revenue,
       ROUND(
         SUM("TotalPrice") * 100.0 / (SELECT SUM("TotalPrice") FROM orders), 
         2
       ) AS pct_of_total_revenue
FROM orders
GROUP BY "Product"
ORDER BY pct_of_total_revenue DESC; 