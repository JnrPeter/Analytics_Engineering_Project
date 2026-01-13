with source as (
    select * from {{ source('northwind', 'employees') }}
),

staged as (
    select *
    from source
)

select * from staged
