{{ config(
    partition_by={
        "field": "creation_date",
        "data_type": "date"
    }
)}}

WITH purchase_orders AS (
    SELECT *
    FROM {{ ref('stg_purchase_order') }}
),
purchase_order_details AS (
    SELECT *
    FROM {{ ref('stg_purchase_order_details') }}
),
products AS (
    SELECT *
    FROM {{ ref('stg_products') }}
),
order_details AS (
    SELECT *
    FROM {{ ref('stg_order_details') }}
),
orders AS (
    SELECT *
    FROM {{ ref('stg_orders') }}
),
employees AS (
    SELECT *
    FROM {{ ref('stg_employees') }}
),
customers AS (
    SELECT *
    FROM {{ ref('stg_customer') }}
)

SELECT
    c.id AS customer_id,
    e.id AS employee_id,
    pod.purchase_order_id,
    p.id AS product_id,
    pod.quantity,
    pod.unit_cost,
    pod.date_received,
    pod.posted_to_inventory,
    pod.inventory_id,
    po.supplier_id,
    po.created_by,
    po.submitted_date,
    CAST(po.creation_date AS DATE) AS creation_date,
    po.status_id,
    po.expected_date,
    po.shipping_fee,
    po.taxes,
    po.payment_date,
    po.payment_amount,
    po.payment_method,
    po.notes,
    po.approved_by,
    po.approved_date,
    po.submitted_by,
    CURRENT_DATETIME() AS insertion_timestamp
FROM purchase_orders po
LEFT JOIN purchase_order_details pod ON po.id = pod.purchase_order_id
LEFT JOIN products p ON pod.product_id = p.id
LEFT JOIN order_details od ON p.id = od.product_id
LEFT JOIN orders o ON od.order_id = o.id
LEFT JOIN employees e ON po.created_by = e.id
LEFT JOIN customers c ON o.customer_id = c.id
QUALIFY ROW_NUMBER() OVER (PARTITION BY pod.purchase_order_id ORDER BY po.creation_date DESC) = 1