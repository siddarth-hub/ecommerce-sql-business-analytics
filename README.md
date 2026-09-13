# E-Commerce SQL Business Analytics

70 business-driven SQL queries against a 10-table e-commerce schema — covering filtering, aggregation, joins, subqueries, CTEs, views, set operations, and window functions.

## About This Project

ABC E-Commerce is a fictional online retail platform. This project simulates a real analyst workflow: given a relational schema and a list of stakeholder questions (sales performance, customer behavior, employee productivity, inventory, and returns), write the SQL to answer each one.

**Scope note:** the dataset is a small, structured schema (10 tables, ~130 total rows) built specifically to exercise a wide range of SQL techniques end-to-end — not a live production dataset. The goal here is breadth and correctness across SQL concepts, not scale. Some queries (e.g. category-level ranking) will return a smaller result set than they would against a larger catalog, since this seed data has only 1–2 products per category.

**Database:** PostgreSQL 16. Every query in this repo has been executed against a live PostgreSQL instance loaded with the seed data below — not just checked for syntax.

## Schema

| Table | Description |
|---|---|
| Customers | Registered platform users |
| Employees | Staff, with a self-referencing `ManagerID` for reporting hierarchy |
| Categories | Product categories (Electronics, Fashion, etc.) |
| Suppliers | Vendors supplying products |
| Products | Catalog items, linked to Category and Supplier |
| Orders | Customer orders, linked to Customer and handling Employee |
| OrderItems | Line items per order |
| Payments | Payment records per order |
| Shippers | Shipping carriers |
| Returns | Product return records |

Full DDL: `schema/schema.sql`

## Query Breakdown

| Category | Count | File | Example |
|---|---|---|---|
| Data Exploration & Filtering | 11 | `01_data_exploration.sql` | Products priced between ₹500–₹3,000 |
| Aggregations & Grouping | 12 | `02_aggregations.sql` | Revenue by category |
| CASE Logic & String Functions | 6 | `03_case_and_string_functions.sql` | Categorize products as Budget/Medium/Premium/Luxury |
| Date Functions & NULL Handling | 6 | `04_dates_and_nulls.sql` | Days taken for shipping per order |
| Joins (inner, left, cross, self) | 10 | `05_joins.sql` | Customers who never placed an order |
| Subqueries | 6 | `06_subqueries.sql` | Customers who spend more than the average customer |
| CTEs & Views | 6 | `07_ctes_and_views.sql` | Reusable monthly sales report |
| Set Operations | 4 | `08_set_operations.sql` | Repeat customers across 2024 and 2025 (INTERSECT) |
| Window Functions | 9 | `09_window_functions.sql` | Top 3 products per category, running sales total, customer spending tiers via `NTILE(4)` |

Full list of all 70 questions with descriptions: `docs/business_questions.md`

## A Note on the Employee Hierarchy

The original schema didn't include a manager/reporting-line column, but one of the business questions asks for an employee-manager hierarchy. Rather than skip it, I extended the schema with a self-referencing `Employees.ManagerID` column (`schema/schema.sql`), populated via a window-function-driven update (`data/seed_data.sql`): for each department, the earliest-hired employee is set as that department's manager (`ManagerID = NULL`), and everyone else in the department reports to them. This runs against real data — verified against a live PostgreSQL 16 instance — rather than staying hypothetical.

## How to Run

```bash
psql -U your_user -d your_database -f schema/schema.sql
psql -U your_user -d your_database -f data/seed_data.sql
psql -U your_user -d your_database -f queries/01_data_exploration.sql
# ...repeat for any/all query files
```

## Tools

- PostgreSQL 16
- Standard SQL — no ORM or external libraries

## Repo Structure

```
├── schema/
│   └── schema.sql              # DDL for all 10 tables, including Employees.ManagerID
├── data/
│   └── seed_data.sql           # Seed data (INSERT statements) + manager hierarchy population
├── queries/
│   ├── 01_data_exploration.sql
│   ├── 02_aggregations.sql
│   ├── 03_case_and_string_functions.sql
│   ├── 04_dates_and_nulls.sql
│   ├── 05_joins.sql
│   ├── 06_subqueries.sql
│   ├── 07_ctes_and_views.sql
│   ├── 08_set_operations.sql
│   └── 09_window_functions.sql
└── docs/
    └── business_questions.md   # All 70 questions, grouped and described
```
    └── business_questions.md   # All 70 questions, grouped and described
```
