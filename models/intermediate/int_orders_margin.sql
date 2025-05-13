SELECT
  s.orders_id,
  s.date_date,
  s.revenue,
  s.quantity,
  s.quantity * p.purchase_price AS purchase_cost,
  s.revenue - (s.quantity * p.purchase_price) AS margin
FROM {{ref("int_sales_margin")}} AS sales_margin
ORDER BY s.orders_id DESC