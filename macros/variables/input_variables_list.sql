
{% macro input_variables_list(column_list,ref_table,where_variable) %}

def input_variables_list(column_list,ref_table,where_variable)

{% set column_list_var      = (column_list) %}
{% set ref_table_var        = (ref_table) %}
{% set where_variable_var   = (where_variable) %}

--SPECIFIY WHICH TABLE AND COLUMNS

{% set variable_list = get_variables_list( column_list_var, ref_table_var, where_variable_var)      %}

{% if variable_list |length %}
    {{return(variable_list) }}
 {% else %}
    {{return([['0','0','0']]) }}
 {% endif %}
{% endmacro %}



