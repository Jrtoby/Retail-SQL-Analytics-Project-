--Top 5 customers by total purchase
SELECT TOP 5
     c.customer_id,
	 c.first_name + ' ' + c.last_name AS customer_name,
	 SUM(p.price) AS total_purchase
FROM customers AS c
JOIN sales AS s
ON c.customer_id = s.customer_id
JOIN products AS p 
ON s.product_id = p.product_id
GROUP BY c.customer_id,
         c.first_name,
		 c.last_name
ORDER BY total_purchase DESC;