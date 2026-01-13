with source as (
    select * from {{ source('northwind', 'orders') }}
),

staged as (
    select *
    from source
)

select * from staged
