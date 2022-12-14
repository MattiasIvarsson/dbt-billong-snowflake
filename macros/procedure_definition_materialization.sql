/*
  This materialization is used for creating procedures.
  The idea behind this materialization is for ability to define CREATE PROCEDURE statements and have DBT the necessary logic
  of deploying the procedure in a consistent manner and logic.
*/
{% materialization procedure_definition, adapter='sqlserver' %}
    {%- set full_refresh_mode = (flags.FULL_REFRESH == True) -%}
    {%- set identifier = model['alias'] -%}

{%- set target_relation = api.Relation.create(database=database,
                                               schema=schema,
                                               identifier=identifier) -%}
    --------------------------------------------------------------------------------------------------------------------

    -- setup
    {{ run_hooks(pre_hooks, inside_transaction=False) }}

    -- `BEGIN` happens here:
    {{ run_hooks(pre_hooks, inside_transaction=True) }}


    --------------------------------------------------------------------------------------------------------------------

    -- build model
    {%- call statement('main') -%}
      {{ create_stmt_fromfile(sql) }}
    {%- endcall -%}



   --------------------------------------------------------------------------------------------------------------------

    {{ run_hooks(post_hooks, inside_transaction=True) }}

    -- `COMMIT` happens here
    {{ adapter.commit() }}

    {{ run_hooks(post_hooks, inside_transaction=False) }}

    {{ return({'relations': [target_relation] }) }}

{%- endmaterialization %}
