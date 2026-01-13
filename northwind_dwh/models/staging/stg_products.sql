with source as (
    select * from {{ source('northwind', 'products') }}
),

staged as (
    select *
    from source
)

select * from staged
