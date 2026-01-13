with source as (
    select * from {{ source('northwind', 'purchase_orders') }}
),

staged as (
    select *
    from source
)

select * from staged
