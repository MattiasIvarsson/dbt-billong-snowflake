{% macro create_initial_tables() %}
{#
---- INTENT: Initial create of tables, mainly for LAND_STORE
----    - tables are created if they do not exists
----    - they must be persistent and not-recreated in any means by dbt
#}
{% do run_query(create_table_store_store_test2()) %};
{% do run_query(create_table_store_store_test3()) %};
{% endmacro %}