# SQLMesh + Devin: Retail data mart demo

A deliberately **partially implemented** teaching repository. The baseline has four
CSV seed models, four staging models, two dimensions, audits and unit tests.
The fact model and migration model are intentionally absent: Devin should create them.

## Windows PowerShell setup

```powershell
cd C:\development
Expand-Archive -Path .\sqlmesh-devin-retail-demo.zip -DestinationPath .\ -Force
cd .\sqlmesh-devin-retail-demo
python -m venv .venv
.\.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
sqlmesh info
sqlmesh test
sqlmesh plan dev
```

The zip contains a top-level `sqlmesh-devin-retail-demo` folder. If you extracted
it elsewhere, change the `cd` commands accordingly. In `sqlmesh plan dev`, review
and apply the proposed development plan when prompted. `db.db` is created locally.
If `sqlmesh` is not on PATH, use `.\.venv\Scripts\sqlmesh.exe`.

**Do not run `sqlmesh init`** inside this repository: it is already scaffolded.

## Baseline model DAG

- `src_customers` -> `stg_customers` -> `dim_customer`
- `src_products` -> `stg_products` -> `dim_product`
- `src_orders` -> `stg_orders`
- `src_order_details` -> `stg_order_details`

All model names are prefixed `retail.`. `seeds/*.csv` contains only synthetic data.
There are five orders and six order lines; order 1003 is CANCELLED.
Expected completed order-line count is **5**; completed net sales is **1870**.

## Demo sequence

1. **Baseline**: run `sqlmesh info`, `sqlmesh test`, and `sqlmesh plan dev`.
2. **Migration**: give Devin `prompts/01_migrate.txt`. Expected output is a new
   `dim_customer_migrated` model, not a replacement of baseline `dim_customer`.
3. **Modification**: reset to baseline or branch separately; give Devin
   `prompts/02_modify.txt`. Verify thresholds and cancelled-order exclusions.
4. **Generation**: branch from the baseline (or merge the enhancement after
   reviewing it); give Devin `prompts/03_generate.txt`.
5. Review Git diff, tests, DAG, SQLMesh development plan and pull request.

**For reproducible demos, start each exercise from a clean baseline Git branch.**
The exercises are deliberately independent; do not assume all three changes
can be merged without resolving overlapping design decisions.

## Acceptance criteria

- Migration: output semantics match the T-SQL reference (including normalization).
- Modification: correct GOLD/SILVER/BRONZE boundaries; no duplicated customers.
- Generation: one fact per completed order line, no cancelled rows, net total 1870.
- All changes: SQLMesh tests, audits and development plan reviewed; no prod deploy.

## Known limitations

- SQLMesh was not executable in the environment used to assemble this archive.
  The repository is based on documented SQLMesh syntax, but **live SQLMesh
  validation has not been performed**. Run the commands above before demo day.
- The example uses static CSV seeds and DuckDB, not real SQL Server/Synapse.
- No production CDC, deletion handling, SCD2, scheduler or credential setup.
- The customer segment exercise has no GOLD/SILVER customers in the baseline
  seed data. Devin must test boundaries using controlled unit-test fixtures.
- SQLMesh's `grain` is metadata; it does not itself enforce a uniqueness constraint.

## References

- https://sqlmesh.readthedocs.io/en/stable/quickstart/cli/
- https://sqlmesh.readthedocs.io/en/stable/concepts/models/seed_models/
- https://sqlmesh.readthedocs.io/en/stable/concepts/tests/
