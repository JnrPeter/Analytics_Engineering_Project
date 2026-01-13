with source as (
    select * from {{ source('northwind', 'suppliers') }}
),

staged as (
    select *
    from source
)

select * from staged
