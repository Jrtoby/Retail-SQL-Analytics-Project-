-- Total Revenue
SELECT SUM(total_amount) AS total_revenue FROM sales;

-- Total Transactions
SELECT COUNT(*) AS total_transactions FROM sales;

-- Average Transaction Value
SELECT AVG(total_amount) AS avg_transaction_value FROM sales;

-- Total Customers
SELECT COUNT(DISTINCT customer_id) AS total_customers FROM sales;

-- Best Performing Store
SELECT TOP(1) store_id, SUM(total_amount) AS revenue
FROM sales
GROUP BY store_id
ORDER BY revenue DESC;