with source as (
    select * from {{ source('northwind', 'customer') }}
),

staged as (
    select *
    from source
)

select * from staged
