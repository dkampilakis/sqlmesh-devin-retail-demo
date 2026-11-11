-- Legacy T-SQL reference. The NEW SQLMesh fact is intentionally absent.
-- Cancelled orders must be excluded; one row per order_detail_id.
INSERT INTO dbo.fact_sales (order_detail_id, order_id, customer_id, product_id, order_date, quantity, unit_price, discount_amount, net_amount)
SELECT d.order_detail_id, o.order_id, o.customer_id, d.product_id,
       o.order_date, d.quantity, d.unit_price, d.discount_amount,
       d.quantity * d.unit_price - d.discount_amount
FROM dbo.OrderDetails AS d
JOIN dbo.Orders AS o ON o.order_id = d.order_id
WHERE o.order_status = 'COMPLETED';
