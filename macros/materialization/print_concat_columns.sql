{% macro print_concat_columns(columns, delimiter='|') %}
{#
---- INTENT: prints out columns in comma separated list for
---- ARGS:
----    - columns (list) the list of columns to HAHBYTES. ISNULL check in the generated code/string
----    - delimiter(string) the entity delimiter. default is |.
---- RETURNS: string of printed column entries. Note that last entry does not get a comma.
#}
    {% if columns | length ==1 %}
        {%- for col in columns -%}
            ISNULL(CAST( {{col}} AS VARCHAR(8000)),'')
        {%- endfor %}
    {% elif columns | length > 1 %}
        CONCAT_WS( '{{delimiter}}' ,
        {%- for col in columns -%}
                ISNULL(CAST( {{col}} AS VARCHAR(8000)),''){{',' if not loop.last}}
        {%- endfor %}
        )
    {% endif %}
{% endmacro %}
