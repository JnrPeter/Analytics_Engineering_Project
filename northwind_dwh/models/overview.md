{% docs __overview__ %}
# Welcome to the Northwind Data Warehouse Documentation

This documentation site contains comprehensive information about our Northwind Traders data warehouse built with dbt. Our project transforms raw OLTP data into a dimensional model optimized for analytics and reporting.

## Navigation Guide

### Sources Section
**Click on "northwind"** to view our raw data sources from BigQuery that feed the pipeline.

### Projects Section
This shows the dbt packages and dependencies used in the project:
- **northwind_dwh** - Our main data warehouse project


### Project Tab (Main Navigation)
**Click on the "northwind_dwh" folder to expand and view all models** organized by our three-layer architecture:
- `staging/` - Light cleaning and standardization from raw sources
- `dim_warehouse/` - Star schema with dimensions and facts
- `OBT(Reporting_layer)/` - Wide tables for direct reporting consumption

### Database Tab
Browse the actual BigQuery dataset structure showing how our models materialize across `stg_northwind`, `dwh_northwind`, and `dm_northwind`.

### Graph Exploration
Click the blue graph icon (bottom-right) to visualize data lineage and model dependencies. This shows how raw Northwind data flows through staging to dimensional models to OBTs.

## Project Overview

Northwind Traders is an export-import company trading specialty foods worldwide. This data warehouse modernizes their reporting by separating OLTP from analytics workloads.

**Business Processes Supported:**
- Sales Tracking
- Sales Agent Performance
- Inventory Management
- Customer Behaviour Monitoring

## Data Architecture

### 📥 **Staging Layer (`stg_northwind`)**
Light transformations from raw data lake
- 17 staging models
- Source: `dl_northwind`

### 🏛️ **Dimensional Model (`dwh_northwind`)**
Star schema optimized for analytics

**Dimensions:**
- `dim_customer` - Customer master data
- `dim_employees` - Sales agents and staff
- `dim_products` - Product catalog with supplier info
- `dim_date` - Date dimension for time analysis

**Facts:**
- `fact_sales` - Sales transactions (order line level)
- `fact_inventory` - Inventory movements
- `fact_purchase_order` - Procurement transactions

### 📊 **Data Marts (`dm_northwind`)**
Wide tables for reporting tools

- `obt_sales_overview` - Sales analysis with customer, employee, product context
- `obt_customer_reporting` - Purchase order analysis
- `obt_product_inventory` - Inventory tracking with product details

## Data Quality & Testing

Automated tests ensure data integrity:
- **Unique tests** - Primary keys validated
- **Not null tests** - Required fields enforced
- **Relationship tests** - Foreign keys reference valid dimension records

## Technical Highlights

- **Kimball methodology** - Star schema dimensional modeling
- **Table partitioning** - BigQuery cost optimization on date columns
- **Deduplication** - QUALIFY pattern for data integrity


## Technology Stack

| Layer | Tool |
|-------|------|
| Storage | Google BigQuery |
| Transformation | dbt-core 1.11.2 |
| Documentation | dbt docs |
| Version Control | GitHub |

---

*Built using dbt, BigQuery, and modern analytics engineering practices*

**Developer**: Peter Enning Junior - Data Analyst 
**Portfolio**: [jnrpeter.github.io](https://jnrpeter.github.io/)
{% enddocs %}