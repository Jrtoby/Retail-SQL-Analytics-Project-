-- which employees have the highest sales
SELECT
     e.employee_id,
	 e.first_name + ' ' + e.last_name AS employee_name,
	 SUM(py.total_amount) AS total_sales
FROM employees AS e
JOIN sales AS s
ON e.employee_id = s.employee_id
JOIN payments AS py
ON s.sale_id = py.sale_id
GROUP BY 
       e.employee_id, e.last_name, e.first_name
ORDER BY
       total_sales DESC;