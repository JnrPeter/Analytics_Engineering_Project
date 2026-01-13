with source as (
    select * from {{ source('northwind', 'order_details_status') }}
),

staged as (
    select *
    from source
)

select * from staged
