{% macro create_table_store_store_test3() %}

{% set table_definition =
    {
    'schema' : 'store',
   'table' : 'store_test3',
    'column_BK' : {'name' :  'ID' , 'type' : '[int] NOT NULL'},
    'column_HSH' : 'HSHCOLS',
    'column_LDTS' : 'LDTS',
    'column_definitions' :
    [
        {'name' :  'Namn' , 'type' : 'varchar(100) NOT NULL'},
        { 'name' : 'Age' , 'type' : 'int NULL'}
    ]
    }
%}

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[{{table_definition.schema}}].[{{table_definition.table}}]') AND type in (N'U'))
BEGIN
	CREATE TABLE [{{table_definition.schema}}].[{{table_definition.table}}](
		[{{table_definition.column_BK['name']}}] {{table_definition.column_BK['type']}},

        {{print_columns_dict(table_definition.column_definitions)}},

		{{ add_table_history_columns()  }},
		INDEX cci_{{table_definition.schema}}_{{table_definition.table}} CLUSTERED COLUMNSTORE
	) ON [PRIMARY]
END

;
DROP INDEX IF EXISTS {{table_definition.schema}}.{{table_definition.table}}.nci_{{table_definition.schema}}_{{table_definition.table}}_{{table_definition.column_BK['name']}}_{{table_definition.column_LDTS}}
;
CREATE NONCLUSTERED INDEX [nci_{{table_definition.schema}}_{{table_definition.table}}_{{table_definition.column_BK['name']}}_{{table_definition.column_LDTS}}] ON [{{table_definition.schema}}].[{{table_definition.table}}]
(
	[{{table_definition.column_BK['name']}}] ASC,
	[{{table_definition.column_LDTS}}] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
;
{% endmacro %}