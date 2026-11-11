MODEL (name retail.dim_customer, kind FULL, grain customer_id, audits (assert_positive_customer_id, assert_unique_customer_id));
SELECT customer_id, customer_name, country, email, is_active
FROM retail.stg_customers;
