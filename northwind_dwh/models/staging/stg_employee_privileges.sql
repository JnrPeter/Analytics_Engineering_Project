with source as (
    select * from {{ source('northwind', 'employee_privileges') }}
),

staged as (
    select *,current_datetime() AS insertion_timestamp
    from source
)

select * from staged
