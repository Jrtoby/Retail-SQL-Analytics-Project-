-- breakdown of payment methods
SELECT
     payment_method,
	 COUNT(*) AS total_transaction,
	 SUM(total_amount) AS total_revenue
FROM
    payments
GROUP BY payment_method
ORDER BY total_revenue DESC;