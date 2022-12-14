{% macro column_trim_clean_nonprintable_char(column) %}
{#
---- INTENT: trim spaces and remove non-printable characters
--           tab, cr, lf
---- ARGS:
----    - column: column name to clean
#}
    TRIM( REPLACE(REPLACE(REPLACE({{column}}, CHAR(9),''), CHAR(10),''),CHAR(13),'') )
{% endmacro %}