--best selling products (by quantity sold)
SELECT
     p.product_id,
	 p.category,
     SUM(s.quantity) AS units_sold
FROM
    products AS p
JOIN
    sales AS s
ON p.product_id = s.product_id
GROUP BY 
       P.product_id, P.category
ORDER BY
       units_sold DESC;