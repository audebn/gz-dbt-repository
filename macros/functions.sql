
 {% macro margin_percent(revenue, purchase_cost, decimals=2) %}
 ROUND (
    safe_divide({{ revenue }} - {{ purchase_cost }}, {{ revenue }})
 )
 {% endmacro %}
