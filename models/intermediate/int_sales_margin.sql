SELECT
  s.orders_id,
  s.products_id,
  s.quantity,
  s.revenue,
  p.purchase_price,
  s.quantity * p.purchase_price AS purchase_cost,
  s.revenue - (s.quantity * p.purchase_price) AS margin
FROM {{ref("stg_sales")}} AS s
JOIN {{ref("stg_raw_product")}} AS p
  ON s.products_id = p.products_id