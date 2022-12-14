{% macro star_new(from, relation_alias=False, except=[], col_nm_prefix=False) -%}
    
    {%- do dbt_utils_sqlserver._is_relation(from, 'star') -%}

    {#-- Prevent querying of db in parsing mode. This works because this macro does not create any new refs. #}
    {%- if not execute -%}
        {{ return('') }}
    {% endif %}

    {%- set include_cols = [] %}
    {%- set cols = adapter.get_columns_in_relation(from) -%}
    {%- for col in cols -%}

        {%- if col.column not in except -%}
            {% set _ = include_cols.append(col.column) %}

        {%- endif %}
    {%- endfor %}

    {%- for col in include_cols %}

        {% if col_nm_prefix %}{{col_nm_prefix}}{{(col)}} = {% endif %}
        {% if relation_alias %} {{ relation_alias }}.{% endif %} {{ dbt_utils_sqlserver.identifier(col) }} {% if not loop.last %},
        {% endif %}

    {%- endfor -%}
{%- endmacro %}
