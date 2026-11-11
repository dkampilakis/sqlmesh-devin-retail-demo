-- Legacy SQL Server T-SQL. Reference only; NOT executed by DuckDB.
-- Migration exercise: preserve SCD1/full-refresh semantics and output columns.
TRUNCATE TABLE dbo.dim_customer;
INSERT INTO dbo.dim_customer (customer_id, customer_name, country, email, is_active)
SELECT CAST(customer_id AS INT), LTRIM(RTRIM(customer_name)),
       UPPER(country), LOWER(email), CAST(is_active AS INT)
FROM dbo.Customers
WHERE customer_id IS NOT NULL;
