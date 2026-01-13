with source as (
    select * from {{ source('northwind', 'inventory_transaction_types') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
