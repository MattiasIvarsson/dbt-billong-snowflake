{% macro get_variables_list(column_name,table_ref, where_ref) %}

--SQL QUERY
    {% set sql_query %}
    SELECT
        {#Print columns creates a list of columns from input table#}
        {{print_columns(column_name)}}
    FROM
        {{table_ref}}
    {#If where_ref is defined or not #}
    {% if where_ref is defined %}
    WHERE {{where_ref}}
    {% else %}
    NONE
    {% endif %}
    {% endset %}
{% set results = run_query(sql_query) %}
{%- if execute -%}

    {% set results_list = [] %}
    {% for col in results %}
    {{ results_list.append(col) }}
    {% endfor %}

 {% else %}
    {% set results_list = [] %}
{% endif %}

{{return(results_list)}}

{% endmacro %}
