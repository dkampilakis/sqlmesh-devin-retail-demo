---
name: sqlmesh-retail
description: Retail SQLMesh data mart development, migration and verification
---
# Retail SQLMesh engineering instructions
- Read README.md and the relevant requirements/*.md before coding.
- Work on a new Git branch. Do not deploy to production or push to main.
- Explain your plan and assumptions before editing.
- SQLMesh model names use `retail.`; files are under models/{sources,staging,dimensions,facts}.
- Use DuckDB dialect and SQLMesh MODEL statements; never put T-SQL TRUNCATE/INSERT
  statements into executable SQLMesh models.
- Grain must be explicit and tested. For facts use order_detail_id.
- Do not silently change existing output columns or business rules.
- Avoid cyclic dependencies, especially dim_customer <-> fact_sales.
- Implement unit tests and relevant audits; tests should include edge cases.
- Run `sqlmesh info`, `sqlmesh test`, and `sqlmesh plan dev` (or equivalent
  non-interactive plan preview). Capture actual output; never invent passing results.
- Do not run `sqlmesh plan prod` or apply a production plan.
- Summarize files changed, design decisions, test results, and remaining risks.
