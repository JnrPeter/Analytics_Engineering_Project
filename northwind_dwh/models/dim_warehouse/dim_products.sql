WITH products AS (
    SELECT * 
    FROM {{ ref('stg_products') }}
),

suppliers AS (
    SELECT 
        CAST(id AS STRING) AS id, 
        company
    FROM {{ ref('stg_suppliers') }}
)

SELECT
    products.id AS product_id,
    product_code,
    product_name,
    description,
    company AS supplier_company,
    standard_cost,
    list_price,
    reorder_level,
    target_level,
    quantity_per_unit,
    discontinued,
    minimum_reorder_quantity,
    category,
    attachments,
    CURRENT_DATETIME() AS insertion_timestamp
FROM products 
LEFT JOIN suppliers 
    ON products.supplier_ids = suppliers.id
    AND products.supplier_ids NOT LIKE '%;%'