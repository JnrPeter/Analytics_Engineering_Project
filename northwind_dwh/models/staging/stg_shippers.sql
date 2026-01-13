with source as (
    select * from {{ source('northwind', 'shippers') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
