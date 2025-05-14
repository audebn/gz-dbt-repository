SELECT
  s.date_date AS date_date,
  s.orders_id AS orders_id,
  s.products_id AS products_id,
  s.quantity AS quantity,
  s.revenue AS revenue,
  p.purchase_price AS purchase_price,
  s.quantity * p.purchase_price AS purchase_cost,
 {{ margin_percent('revenue', 'purchase_price') }}.margin_percent as margin_percent
FROM {{ ref("stg_sales") }} AS s
JOIN {{ ref("stg_raw_product") }} AS p
  ON s.products_id = p.products_id