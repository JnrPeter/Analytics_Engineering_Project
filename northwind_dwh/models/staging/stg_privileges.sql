with source as (
    select * from {{ source('northwind', 'privileges') }}
),

staged as (
    select *
    from source
)

select * from staged
