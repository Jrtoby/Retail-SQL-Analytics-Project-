--Creating a database called retail analysis
CREATE DATABASE retail_analysis;
USE retail_analysis;

--creating a customers table
CREATE TABLE customers(
customer_id INT PRIMARY KEY,
first_name VARCHAR(50),
last_name VARCHAR(50),
email VARCHAR(100),
phone VARCHAR(20),
join_date DATE
);

--creating a product table
CREATE TABLE products(
product_id INT PRIMARY KEY,
name VARCHAR(100),
category VARCHAR(50),
price DECIMAL(10,2)
);

--creating a stores table
CREATE TABLE stores(
store_id INT PRIMARY KEY,
store_name VARCHAR(100),
city VARCHAR(50),
region VARCHAR(50)
);

--creating an employees table
CREATE TABLE employees(
employees_id INT PRIMARY KEY,
first_namr VARCHAR(50),
last_name VARCHAR(50),
store_id INT,
position VARCHAR(50),
hire_date DATE,
FOREIGN KEY (store_id) REFERENCES stores(store_id)
);

--creatin a seles table
CREATE TABLE sales(
sale_id INT PRIMARY KEY,
sale_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
product_id INT,
FOREIGN KEY (product_id) REFERENCES products(product_id),
store_id INT,
FOREIGN KEY (store_id) REFERENCES stores(store_id),
employee_id INT,
FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
quantity INT
);

--creating a payment table
CREATE TABLE payments(
payment_id INT PRIMARY KEY,
sale_id INT,
FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
payment_method VARCHAR(30),
total_amount DECIMAL(10,2)
);

-- importing files into the customers table
BULK INSERT customers
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- retrieving the customers table structure to better understand error message
sp_help customers;

-- expanding the phone column structure to avoid the truncation error
ALTER TABLE customers
ALTER COLUMN phone VARCHAR(50);

-- importing data into the employees table
BULK INSERT employees
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\employees.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--importing data into the payments table
BULK INSERT payments
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\payments.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--importing data into the products table
BULK INSERT products
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\products.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--importing data into the sales table
BULK INSERT sales
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\sales.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

--importing data into the stores table
BULK INSERT stores
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\stores.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

-- retrieving the imported data infomation to confirm proper importation.
SELECT
      *
	  FROM payments;

--RETRIEVING DATA FROM CONSUMERS TABLE TO TACKLE THE ANALYTICAL QUESTIONS
SELECT
     *
	 FROM customers;

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

-- Number of customers per city
SELECT
      city,
	  COUNT(*) AS customer_count
FROM
    stores
GROUP BY city
ORDER BY customer_count DESC;

--Average amount spent per customers
SELECT
     c.customer_id,
     c.first_name + ' ' + c.last_name AS customer_name,
	 AVG( p.price * s.quantity) AS average_spent_per_customer
FROM 
    customers AS c
JOIN 
    sales AS s
ON c.customer_id = s.customer_id
JOIN 
    products AS p
ON s.product_id = p.product_id
GROUP BY
       c.customer_id,c.first_name,c.last_name
ORDER BY
       average_spent_per_customer DESC;

--RETRIEVING DATA FROM PRODUCTS TABLE TO TACKLE THE ANALYTICAL QUESTIONS
SELECT
     *
	 FROM products;

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

--average price by category
SELECT
      category,
	  AVG(price) AS avg_price
FROM
    products
GROUP BY 
        category;

--RETRIEVING DATA FROM STORES TABLE TO TACKLE THE ANALYTICAL QUESTIONS
SELECT
     *
	 FROM stores;

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

--number of employees per store
SELECT
     store_id,
	 COUNT(*) AS employee_count
FROM
    employees
GROUP BY
       store_id;

--RETRIEVING DATA FROM EMPLOYEES TABLE TO TACKLE THE ANALYTICAL QUESTIONS
SELECT
     *
	 FROM employees;

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

--average tenure of employees(in years)
SELECT
      AVG(DATEDIFF(YEAR, hire_date, GETDATE())) AS avg_yearly_tenure
FROM
    employees
GROUP BY 
       store_id;

--employees not linked to any sales
SELECT
     e.employee_id,
	 e.first_name + ' ' + e.last_name AS employee_name,
	 e.store_id
FROM
    employees AS e
LEFT JOIN sales AS s
ON e.employee_id = s.employee_id
WHERE s.employee_id IS NULL;

--RETRIEVING DATA FROM SALES TABLE TO TACKLE THE ANALYTICAL QUESTIONS
SELECT
     *
	 FROM sales;

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

--day of the week with most sales
SELECT
     FORMAT(s.sale_date, 'dddd') AS day_of_week,
	 DATEPART(WEEKDAY, s.sale_date) AS day_number,
	 COUNT(*) AS total_transaction,
	 SUM(p.total_amount) AS total_sales
FROM
    sales AS s
JOIN
    payments AS p
ON s.sale_id = p.sale_id
GROUP BY
       FORMAT(s.sale_date, 'dddd'),
	   DATEPART(WEEKDAY, s.sale_date)
ORDER BY
       total_sales DESC;

 --RETRIEVING DATA FROM PAYMENTS TABLE TO TACKLE THE ANALYTICAL QUESTIONS
 SELECT
      *
	  FROM payments;

-- breakdown of payment methods
SELECT
     payment_method,
	 COUNT(*) AS total_transaction,
	 SUM(total_amount) AS total_revenue
FROM
    payments
GROUP BY payment_method
ORDER BY total_revenue DESC;

--any missing or zero payment?
SELECT
     *
	 FROM payments
WHERE total_amount IS NULL OR total_amount = 0;

-- revenue per payment method overtime 
SELECT
     FORMAT(s.sale_date, 'yyyy-MM') AS year_month,
	 p.payment_method,
	 COUNT(*) AS transaction_count,
	 SUM(p.total_amount) AS total_revenue,
	 SUM(p.total_amount) / COUNT(DISTINCT DAY(s.sale_date)) AS avg_daily_revenue
FROM
    payments AS p
JOIN sales AS s
ON p.sale_id = s.sale_id
GROUP BY
      FORMAT(s.sale_date, 'yyyy-MM'),
	  p.payment_method
ORDER BY
       year_month,
	   total_revenue DESC;