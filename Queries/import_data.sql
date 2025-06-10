-- importing files into the customers table
BULK INSERT customers
FROM 'C:\\Users\\user\\Documents\Data sets\Retail store sales\customers.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);

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
