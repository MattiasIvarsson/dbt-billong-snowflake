{% macro print_columns_dict(columns_list) %}
{#
---- INTENT: prints out columns in comma seperated list
---- ARGS:
----    - columns list the column items (dictionary) to itemize
---- RETURNS: string of printed column entries. Note that last entry does not get a comma.
#}
    {% if columns_list | length > 0 %}
        {%- for dictItem in columns_list -%}
            {{dictItem['name']}} {{dictItem['type']}}{{',' if not loop.last}}
        {%- endfor -%}
    {% endif %}
{% endmacro %}

