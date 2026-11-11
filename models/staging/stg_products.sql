MODEL (name retail.stg_products, kind FULL);
SELECT CAST(product_id AS INTEGER) AS product_id,
       CAST(product_name AS VARCHAR) AS product_name,
       CAST(category AS VARCHAR) AS category,
       CAST(list_price AS DECIMAL(12, 2)) AS list_price
FROM retail.src_products;
