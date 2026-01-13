with source as (
    select * from {{ source('northwind', 'purchase_order_details') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
