{{ config(materialized='table') }}

SELECT
    100 AS revenue,
    40 AS purchase_cost,
    {{ margin_percent(100, 40) }} AS margin_pct
