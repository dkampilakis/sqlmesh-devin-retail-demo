MODEL (name retail.stg_order_details, kind FULL);
SELECT CAST(order_detail_id AS INTEGER) AS order_detail_id,
       CAST(order_id AS INTEGER) AS order_id,
       CAST(product_id AS INTEGER) AS product_id,
       CAST(quantity AS INTEGER) AS quantity,
       CAST(unit_price AS DECIMAL(12, 2)) AS unit_price,
       CAST(discount_amount AS DECIMAL(12, 2)) AS discount_amount
FROM retail.src_order_details;
