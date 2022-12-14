{% macro hash_columns(columns, algorithm='SHA2_256', delimiter='|') %}
{#
---- INTENT: SQl Server HASH of columns
---- ARGS:
----    - columns (list) the list of columns to itemize
----    - delimiter(string) the entity delimiter. default is |.
---- RETURNS: SQL string of HASHBYTES column entries. Note that last entry does not get a comma.
#}
    CONVERT([binary](32),HASHBYTES('{{algorithm}}',
        {{print_concat_columns(columns) }}
    ))

{% endmacro %}


