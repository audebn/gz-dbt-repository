with source as (
  select * from {{ source('raw', 'sales') }}
),

renamed as (
  select 
    CAST(date_date AS DATE) AS date_date,
    orders_id, 
    pdt_id as products_id, 
    revenue, 
    quantity
  from source
)

select * from renamed