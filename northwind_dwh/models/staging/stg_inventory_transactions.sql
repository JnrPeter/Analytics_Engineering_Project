with source as (
    select * from {{ source('northwind', 'inventory_transactions') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
