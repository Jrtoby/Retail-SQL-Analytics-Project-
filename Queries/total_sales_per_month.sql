--total sales per month
SELECT
     FORMAT(sale_date, 'MMM') AS sale_month,
	 COUNT(*) AS total_sales,
	 SUM(p.total_amount) AS total_revenue
FROM sales AS s
JOIN payments AS p
ON s.sale_id = p.sale_id
WHERE
     YEAR(s.sale_date)=YEAR(GETDATE())
GROUP BY FORMAT(sale_date, 'MMM'),
         MONTH(s.sale_date)
ORDER BY sale_month;