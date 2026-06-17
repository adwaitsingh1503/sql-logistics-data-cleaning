# Logistics & Supply Chain Data Standardization (SQL)

# Project Objective
To clean and standardize raw, unstructured shipment data using Google BigQuery, ensuring the dataset is primed for accurate supply chain reporting and compliance monitoring.

# mThe Challenge
The initial `dirty_shipment` dataset contained several operational data entry errors that would skew logistics metrics:
* Inconsistent capitalization across origin warehouses, destination cities, and carrier names.
* Missing critical delivery dates and destination fields.
* Negative freight weights which distort load calculations.
* Duplicate shipment entries due to system logging errors.

# SQL Techniques Applied
* **Data Imputation:** Utilized `COALESCE` to handle `NULL` values in delivery dates and destination cities, replacing them with standardized 'Not Yet Delivered' and 'Unknown' flags.
* **String Manipulation:** Applied `TRIM`, `INITCAP`, and `UPPER` functions to enforce uniform naming conventions across categorical logistics data.
* **Conditional Logic:** Built `CASE` statements to isolate negative weights, applying the `ABS()` function to correct data entry typos while converting zero-weights to `NULL` for accurate aggregation.
* **Duplicate Removal:** Deployed Common Table Expressions (CTEs) alongside the `ROW_NUMBER()` Window Function to partition data by core shipment attributes, successfully filtering out duplicate records.

# Business Impact & Next Steps
Standardizing this raw data establishes a reliable foundation for operational analytics. This clean dataset is now structured for export into Excel to build a comprehensive logistics dashboard, facilitating the accurate tracking of supply chain metrics such as lead time, freight costs, and carrier performance compliance.
