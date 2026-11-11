MODEL (name retail.stg_customers, kind FULL);
SELECT CAST(customer_id AS INTEGER) AS customer_id,
       CAST(customer_name AS VARCHAR) AS customer_name,
       CAST(country AS VARCHAR) AS country,
       CAST(email AS VARCHAR) AS email,
       CAST(is_active AS INTEGER) AS is_active
FROM retail.src_customers;
