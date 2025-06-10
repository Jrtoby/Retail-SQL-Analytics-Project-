--store with the highest total revenue
SELECT
     s.store_id,
	 s.store_name,
	 SUM(p.price) AS total_revenue
FROM
    stores AS s
JOIN sales AS sa
ON sa.store_id = s.store_id
JOIN products AS p
ON sa.product_id = p.product_id
GROUP BY
       s.store_id, s.store_name
ORDER BY
       total_revenue DESC;