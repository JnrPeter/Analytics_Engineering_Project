with source as (
    select * from {{ source('northwind', 'order_details_status') }}
),

staged as (
   select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
