with source as (
    select * from {{ source('northwind', 'invoices') }}
),

staged as (
   select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
