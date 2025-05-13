with source as (
  select * from {{ source('raw', 'ship') }}
),

renamed as (
  select
    orders_id,
    cast(shipping_fee as FLOAT64) as shipping_fee,
    logCost,
    cast(ship_cost as FLOAT64) as ship_cost,
  from source
)

select * from renamed
