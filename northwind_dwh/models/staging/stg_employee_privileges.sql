with source as (
    select * from {{ source('northwind', 'employee_privileges') }}
),

staged as (
    select *
    from source
)

select * from staged
