WITH 
sales AS (
    SELECT * FROM {{ ref('stg_orders') }}
)

,

sales_details AS (
    SELECT  * FROM {{ ref('stg_order_details') }}
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
order_date,
shipped_date,
paid_date,
CURRENT_DATETIME() AS insertion_timestamp
FROM sales 
JOIN sales_details
ON sales.id = sales_details.order_id
