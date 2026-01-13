with source as (
    select * from {{ source('northwind', 'shippers') }}
),

staged as (
    select *
    from source
)

select * from staged
