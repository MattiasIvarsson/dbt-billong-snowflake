{% macro print_list_item(items, qualifier=None) %}
{#
---- INTENT: prints out items in comma seperated list
---- ARGS:
----    - items (list) the list of values to itemize, for ex to generate an IN-clause IN('1','2','3')
----    - qualifier(string) the entity qualifier. default is no qualifier.
---- RETURNS: string of printed items. Note that last entry does not get a comma.
#}
    {% if items | length > 0 %}
        {%- for itm in items -%}
             {{qualifier if qualifier != None else ''}}{{itm}}{{qualifier if qualifier != None else ''}} {{',' if not loop.last}}
        {%- endfor %}
    {% endif %}
{% endmacro %}
