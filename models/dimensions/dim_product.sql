MODEL (name retail.dim_product, kind FULL, grain product_id);
SELECT product_id, product_name, category, list_price
FROM retail.stg_products;
