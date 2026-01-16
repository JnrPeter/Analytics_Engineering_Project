{{ config(
    partition_by={
        "field": "order_date",
        "data_type": "date"
    }
)}}

WITH fact_sales AS (
    SELECT * FROM {{ ref('fact_sales') }}
),

dim_customer AS (
    SELECT * FROM {{ ref('dim_customer') }}
),

dim_employees AS (
    SELECT * FROM {{ ref('dim_employees') }}
),

dim_products AS (
    SELECT * FROM {{ ref('dim_products') }}
),

dim_date AS (
    SELECT * FROM {{ ref('dim_date') }}
)

SELECT
    -- Fact Sales
    f.order_id,
    f.quantity,
    f.unit_price,
    f.discount,
    f.status_id,
    f.date_allocated,
    f.purchase_order_id,
    f.inventory_id,
    f.order_date,
    f.shipped_date,
    f.paid_date,
    f.shipper_id,

    -- Customer
    c.customer_id,
    c.company AS customer_company,
    c.last_name AS customer_last_name,
    c.first_name AS customer_first_name,
    c.email_address AS customer_email,
    c.job_title AS customer_job_title,
    c.business_phone AS customer_business_phone,
    c.home_phone AS customer_home_phone,
    c.mobile_phone AS customer_mobile_phone,
    c.fax_number AS customer_fax,
    c.address AS customer_address,
    c.city AS customer_city,
    c.state_province AS customer_state,
    c.zip_postal_code AS customer_zip,
    c.country_region AS customer_country,
    c.web_page AS customer_web_page,
    c.notes AS customer_notes,
    c.attachments AS customer_attachments,

    -- Employee
    e.employee_id,
    e.company AS employee_company,
    e.last_name AS employee_last_name,
    e.first_name AS employee_first_name,
    e.email_address AS employee_email,
    e.job_title AS employee_job_title,
    e.business_phone AS employee_business_phone,
    e.home_phone AS employee_home_phone,
    e.mobile_phone AS employee_mobile_phone,
    e.fax_number AS employee_fax,
    e.address AS employee_address,
    e.city AS employee_city,
    e.state_province AS employee_state,
    e.zip_postal_code AS employee_zip,
    e.country_region AS employee_country,
    e.web_page AS employee_web_page,
    e.notes AS employee_notes,
    e.attachments AS employee_attachments,

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

FROM fact_sales f
LEFT JOIN dim_customer c ON f.customer_id = c.customer_id
LEFT JOIN dim_employees e ON f.employee_id = e.employee_id
LEFT JOIN dim_products p ON f.product_id = p.product_id
LEFT JOIN dim_date d ON f.order_date = CAST(d.date_day AS DATE)