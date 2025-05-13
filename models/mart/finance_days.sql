SELECT 
  s.date_date,
  COUNT(DISTINCT s.orders_id) AS nb_transactions,
  SUM(s.revenue) AS total_revenue,
  SUM(s.revenue) / COUNT(DISTINCT s.orders_id) AS average_basket,
  SUM(ship.operational_margin) AS total_operational_margin,
  SUM(s.purchase_cost) AS total_purchase_cost,
  SUM(ship.shipping_fee) AS total_shipping_fee,
  SUM(ship.logCost) AS total_log_costs,
  SUM(s.quantity) AS total_products_sold
FROM {{ ref("int_sales_margin") }} AS s
JOIN {{ ref("int_orders_operational") }} AS ship
  ON s.orders_id = ship.orders_id
GROUP BY s.date_date
ORDER BY s.date_date DESC