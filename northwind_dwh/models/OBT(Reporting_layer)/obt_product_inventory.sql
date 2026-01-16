{{ config(
    partition_by={
        "field": "transaction_created_date",
        "data_type": "date"
    }
)}}

WITH fact_inventory AS (
    SELECT * FROM {{ ref('fact_inventory') }}
),

dim_products AS (
    SELECT * FROM {{ ref('dim_products') }}
),

dim_date AS (
    SELECT * FROM {{ ref('dim_date') }}
)

SELECT
    -- Fact Inventory
    f.inventory_id,
    f.transaction_type,
    f.transaction_created_date,
    f.transaction_modified_date,
    f.quantity,
    f.purchase_order_id,
    f.customer_order_id,
    f.comments,

    -- Product
    p.product_id,
    p.product_code,
    p.product_name,
    p.description AS product_description,
    p.supplier_company,
    p.standard_cost,
    p.list_price,
    p.reorder_level,
    p.target_level,
    p.quantity_per_unit,
    p.discontinued,
    p.minimum_reorder_quantity,
    p.category,
    p.attachments AS product_attachments,

    -- Date
    d.date_id,
    d.date_day,
    d.year,
    d.quarter,
    d.month,
    d.month_name,
    d.week_of_year,
    d.day_of_month,
    d.day_of_week,
    d.day_name,
    d.is_weekend,
    d.quarter_name,
    d.fiscal_year,

    CURRENT_DATETIME() AS insertion_timestamp

FROM fact_inventory f
LEFT JOIN dim_products p ON f.product_id = p.product_id
LEFT JOIN dim_date d ON CAST(f.transaction_created_date AS DATE) = CAST(d.date_day AS DATE)