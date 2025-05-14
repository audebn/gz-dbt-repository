SELECT 
s.orders_id,
date_date,
shipping_fee,
logCost, 
ship_cost,
margin + shipping_fee - logCost- ship_cost AS operational_margin
FROM {{ ref("stg_raw_ship") }} AS s
JOIN {{ref("int_orders_margin")}} AS m 
ON s.orders_id = m.orders_id