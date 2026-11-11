AUDIT (name assert_positive_customer_id);
SELECT * FROM @this_model WHERE customer_id IS NULL OR customer_id <= 0;

AUDIT (name assert_unique_customer_id);
SELECT customer_id FROM @this_model GROUP BY customer_id HAVING COUNT(*) > 1;
