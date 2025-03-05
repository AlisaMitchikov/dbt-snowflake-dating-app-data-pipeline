{% macro to_currency(base_currency, conversion_rate) %}
    round({{base_currency}}/{{conversion_rate}},2)
{% endmacro %}
