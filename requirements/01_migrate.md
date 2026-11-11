# Exercise 1: Migrate legacy customer SQL
Read `legacy_sql/load_dim_customer.sql`. Create `retail.dim_customer_migrated`
in `models/dimensions/dim_customer_migrated.sql` using the existing staging model.
Preserve trim, uppercase country, lowercase email, null-key filtering, and
full-refresh behavior. Do NOT overwrite the baseline `retail.dim_customer`.
Add unit tests covering whitespace, case, and null keys; add uniqueness and
non-null audits. Show a development plan and compare migrated output with
an independently calculated expected result. Explain any differences from
baseline `retail.dim_customer` (which intentionally does not normalize fields).
