# Exercise 2: Change customer dimension
Enhance `retail.dim_customer` with `customer_segment` based on lifetime
COMPLETED sales (all orders, all details): GOLD if net sales > 10000;
SILVER if net sales >= 2000 and <= 10000; BRONZE otherwise.
Cancelled orders must not count. Customers with no completed sales are BRONZE.
Use quantity * unit_price - discount_amount; avoid duplicate customer rows.
Retain existing output columns. Prefer a reusable upstream aggregation model;
never use the new `fact_sales` as input because it is not yet present.
Add boundary tests for 0, 2000, 10000 and 10000.01, and tests for cancelled
orders and multiple order lines. Discuss whether segment should be calculated
from full history or a rolling window; use full history for this exercise.
