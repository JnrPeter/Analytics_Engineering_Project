WITH inventory AS (
    SELECT *
    FROM {{ ref('stg_inventory_transactions') }}
)

SELECT
    id AS inventory_id,
    transaction_type,
    transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments
FROM inventory