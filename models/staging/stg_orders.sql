MODEL (name retail.stg_orders, kind FULL);
SELECT CAST(order_id AS INTEGER) AS order_id,
       CAST(customer_id AS INTEGER) AS customer_id,
       CAST(order_date AS DATE) AS order_date,
       CAST(order_status AS VARCHAR) AS order_status
FROM retail.src_orders;
