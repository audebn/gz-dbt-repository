SELECT
  orders_id,
  MIN(date_date) AS date_date,         -- par exemple, la première date de commande
  SUM(revenue) AS total_revenue,
  SUM(quantity) AS total_quantity,
  SUM(purchase_cost) AS total_cost,
  SUM(margin) AS total_margin
FROM {{ ref("int_sales_margin") }} AS sales_margin
GROUP BY orders_id
ORDER BY orders_id DESC
