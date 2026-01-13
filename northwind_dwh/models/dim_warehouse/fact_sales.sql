{{ config(
    partition_by={
        "field": "order_date",
        "data_type": "date"
    }
)}}

WITH 
sales AS (
    SELECT * FROM {{ ref('stg_orders') }}
),

sales_details AS (
    SELECT * FROM {{ ref('stg_order_details') }}
)

SELECT
    order_id,
    product_id,
    customer_id,
    employee_id,
    shipper_id,
    quantity,
    unit_price,
    discount,
    sales.status_id,
    date_allocated,
    purchase_order_id,
    inventory_id,
    CAST(order_date AS DATE) AS order_date,
    shipped_date,
    paid_date,
    CURRENT_DATETIME() AS insertion_timestamp
FROM sales 
JOIN sales_details
    ON sales.id = sales_details.order_id
WHERE order_id IS NOT NULL
QUALIFY ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date DESC) = 1