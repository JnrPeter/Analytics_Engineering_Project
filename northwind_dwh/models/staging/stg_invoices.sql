with source as (
    select * from {{ source('northwind', 'invoices') }}
),

staged as (
    select *
    from source
)

select * from staged
