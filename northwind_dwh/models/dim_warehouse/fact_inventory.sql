{{ config(
    partition_by={
        "field": "transaction_created_date",
        "data_type": "date"
    }
)}}

WITH inventory AS (
    SELECT *
    FROM {{ ref('stg_inventory_transactions') }}
)

SELECT
    id AS inventory_id,
    transaction_type,
    CAST(transaction_created_date AS DATE) AS transaction_created_date,
    transaction_modified_date,
    product_id,
    quantity,
    purchase_order_id,
    customer_order_id,
    comments,
    CURRENT_DATETIME() AS insertion_timestamp
FROM inventory
QUALIFY ROW_NUMBER() OVER (PARTITION BY id ORDER BY transaction_created_date DESC) = 1