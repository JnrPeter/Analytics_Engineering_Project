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

employees AS (
    SELECT *
    FROM {{ ref('stg_employees') }}
),

customers AS (
    SELECT *
    FROM {{ ref('stg_customer') }}
)

SELECT
    customers.id AS customer_id,
    employees.id AS employee_id,
    purchase_order_details.purchase_order_id,
    products.id as product_id,
    purchase_order_details.quantity,
    purchase_order_details.unit_cost,
    purchase_order_details.date_received,
    purchase_order_details.posted_to_inventory,
    purchase_order_details.inventory_id,
    purchase_orders.supplier_id,
    purchase_orders.created_by,
    purchase_orders.submitted_date,
    purchase_orders.creation_date,
    purchase_orders.status_id,
    purchase_orders.expected_date,
    purchase_orders.shipping_fee,
    purchase_orders.taxes,
    purchase_orders.payment_date,
    purchase_orders.payment_amount,
    purchase_orders.payment_method,
    purchase_orders.notes,
    purchase_orders.approved_by,
    purchase_orders.approved_date,
    purchase_orders.submitted_by,
    CURRENT_DATETIME() AS insertion_timestamp
FROM purchase_orders
LEFT JOIN purchase_order_details ON purchase_orders.id = purchase_order_details.purchase_order_id
LEFT JOIN products ON purchase_order_details.product_id = products.id
LEFT JOIN employees ON purchase_orders.created_by = employees.id
LEFT JOIN customers ON purchase_orders.supplier_id = customers.id