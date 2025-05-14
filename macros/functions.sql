{% macro margin_percent(revenue, purchase_cost, decimals=2) %}
    ROUND(
        ({{ revenue }} - {{ purchase_cost }}, {{ revenue }}),
        {{ decimals }}
    ) 
{% endmacro %}