with source as (
    select * from {{ source('northwind', 'purchase_order_details') }}
),

staged as (
    select *
    from source
)

select * from staged
