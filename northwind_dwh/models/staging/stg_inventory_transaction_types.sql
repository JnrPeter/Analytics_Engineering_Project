with source as (
    select * from {{ source('northwind', 'inventory_transaction_types') }}
),

staged as (
    select *
    from source
)

select * from staged
