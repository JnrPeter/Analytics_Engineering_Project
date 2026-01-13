with source as (
    select * from {{ source('northwind', 'privileges') }}
),

staged as (
   select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
