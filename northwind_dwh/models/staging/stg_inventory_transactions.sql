with source as (
    select * from {{ source('northwind', 'inventory_transactions') }}
),

staged as (
    select *
    from source
)

select * from staged
