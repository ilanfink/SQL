--############
-- Question 1:
-- Write a SELECT statement that joins the Categories table to the Products table and returns these columns: 
-- category_name, 
-- product_name, 
-- list_price.
-- Sort the result set by the category_name column and then by the product_name column in ascending sequence.

SELECT c.category_name, p.product_name, p.list_price
FROM 
    categories AS c
        INNER JOIN 
    products AS p ON c.category_id = p.category_id
ORDER BY c.category_name, p.product_name ASC;

--############
-- Question 2:
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: 
-- first_name, 
-- last_name, 
-- line1, 
-- city, 
-- state, 
-- zip_code.
-- Return one row for each address for the customer with an email address of
-- allan.sherwood@yahoo.com
-- Sort the result set by the zip_code column in ascending sequence.

SELECT 
    c.first_name,
    c.last_name,
    a.line1,
    a.city,
    a.state,
    a.zip_code

FROM
    customers AS c
        INNER JOIN
    addresses AS a ON c.customer_id = a.customer_id
WHERE
    c.email_address = 'allan.sherwood@yahoo.com'; 
    
--############
-- Question 3:
-- Write a SELECT statement that joins the Customers table to the Addresses table and returns these columns: 
-- first_name, 
-- last_name, 
-- line1, 
-- city, 
-- state, 
-- zip_code.
-- Return one row for each customer, but only return addresses that are the shipping address for a customer.
-- Sort the result set by the zip_code column in ascending sequence

SELECT 
    c.first_name,
    c.last_name,
    a.line1,
    a.city,
    a.state,
    a.zip_code
FROM
    customers AS c
        INNER JOIN
    addresses AS a ON c.customer_id = a.customer_id
WHERE
    (c.customer_id = a.customer_id)
        AND (c.shipping_address_id = a.address_id)
ORDER BY a.zip_code ASC;

--############
-- Question 4:
-- Write a SELECT statement that joins the Customers, Orders, Order_Items, and Products tables. 
-- This statement should return these columns: last_name, first_name, order_date, product_name, item_price, discount_amount, and quantity.
-- Use aliases for the tables.
-- Sort the final result set by the last_name, order_date, and product_name columns.

SELECT 
    c.last_name,
    c.first_name,
    o.order_date,
    p.product_name,
    oi.item_price,
    oi.discount_amount,
    oi.quantity
FROM
    customers c
        INNER JOIN
    orders o ON c.customer_id = o.customer_id
        INNER JOIN
    order_items oi ON o.order_id = oi.order_id
        INNER JOIN
    products p ON oi.product_id = p.product_id
ORDER BY c.last_name , o.order_date , p.product_name;

--############
-- Question 5:
-- Use the UNION operator to generate a result set consisting of three columns from the Orders table:
--  ship_status
--  order_id
--  order_date
--  A calculated column that contains a value of SHIPPED or NOT SHIPPED
--  The order_id column
--  The order_date column
--  If the order has a value in the ship_date column, the ship_status column should contain a value of SHIPPED. Otherwise, it should contain a value of NOT SHIPPED.
--  Sort the final result set by the order_date column.

SELECT 
    'SHIPPED' AS 'ship_status',
    order_id,
    order_date
FROM
    orders
WHERE
    ship_date IS NOT NULL 
UNION SELECT 
    'NOT SHIPPED' AS 'Ship Status',
    order_id AS 'order_id',
    order_date
FROM
    orders
WHERE
    ship_date IS NULL
ORDER BY order_date;
