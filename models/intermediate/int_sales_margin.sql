SELECT
  s.orders_id,
  s.pdt_id,
  s.quantity,
  s.revenue,
  p.purchase_price,
  -- Nouvelle colonne : coût d'achat total
  s.quantity * p.purchase_price AS purchase_cost,
  s.revenue - (s.quantity*p.purchase_cost) AS margin
FROM {{ source('raw', 'sales') }} AS s
JOIN {{ source('raw', 'product') }} AS p
  ON s.pdt_id = p.products_id
