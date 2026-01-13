with source as (
    select * from {{ source('northwind', 'orders_status') }}
),

staged as (
    select *
    from source
)

select * from staged
