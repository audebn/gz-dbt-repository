SELECT 
c.date_date,
ROUND (f.total_revenue - c.ads_cost,1) AS ads_margin,
f.average_basket,
f.operational_margin,
c.ads_cost,
c.ads_impression,
c.ads_clicks,
f.total_products_sold AS quantity,
f.total_revenue AS revenue,
f.total_purchase_cost AS purchase_cost,
f.total_shipping_fee AS shipping_fee,
f.total_log_costs AS logCost,
(f.total_shipping_fee + f.total_log_costs) AS ship_cost
FROM {{ ref("int_campaigns_day") }} AS c
JOIN {{ ref("finance_days") }} AS f
ON c.date_date = f.date_date
ORDER BY date_date DESC