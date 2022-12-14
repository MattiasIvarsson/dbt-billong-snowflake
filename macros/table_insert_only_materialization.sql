/*
  This materialization is used for Insert Only pattern into a table
*/
{% materialization table_insert_only , default %}

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
      {{ sql }}
    {%- endcall -%}



    {{ run_hooks(post_hooks, inside_transaction=True) }}

    -- `COMMIT` happens here
    {{ adapter.commit() }}

    {{ run_hooks(post_hooks, inside_transaction=False) }}


   --------------------------------------------------------------------------------------------------------------------
    {{ return({'relations': [target_relation] }) }}

{% endmaterialization %}
