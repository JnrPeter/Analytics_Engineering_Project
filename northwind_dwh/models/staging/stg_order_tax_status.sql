with source as (
    select * from {{ source('northwind', 'orders_tax_status') }}
),

staged as (
    select *
    from source
)

select * from staged
