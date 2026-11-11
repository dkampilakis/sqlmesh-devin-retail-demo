# Exercise 3: Generate new fact_sales
Create `retail.fact_sales`, grain `order_detail_id` (one row per order line).
Columns: order_detail_id, order_id, customer_id, product_id, order_date,
quantity, unit_price, discount_amount, net_amount.
Join `retail.stg_orders` and `retail.stg_order_details` and filter to COMPLETED.
Use `retail.dim_customer` and `retail.dim_product` for FK validation, but avoid
joining dimensions in a way that duplicates facts. Reject orphan keys in audits.
Net amount = quantity * unit_price - discount_amount. Test cancellation,
multiple lines, null keys, duplicates, and zero discounts.
For this small immutable CSV demo, first implement FULL and prove correctness.
Then propose an INCREMENTAL_BY_UNIQUE_KEY variant with `order_detail_id` as
unique key; explain how updates, deletes, and late-arriving changes would be
handled and test the approach before adopting it. Do not claim that a one-time
CSV load proves production incremental semantics.
