with source as (
    select * from {{ source('northwind', 'order_details') }}
),

staged as (
    select *
    from source
)

select * from staged
