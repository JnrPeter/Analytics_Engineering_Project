with source as (
    select * from {{ source('northwind', 'order_details') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
