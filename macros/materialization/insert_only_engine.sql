{%- macro insert_only_engine( kwargs) -%}
{#
---- INTENT: core part of insert only new/changed rows
---- ARGS:
----    - columns (list) the list of columns to itemize
----    - qualifier(string) the entity qualifier. default is no qualifier.
----    - cteThis : all rows from target table with a Row_Number added (in DESC order, latest row for an entity first)
----    - cteLatest : only latest rows from cteThis (Latest -> RowNo=1)

---- RETURNS: string of printed column entries. Note that last entry does not get a comma.
#}

with cteThis as
(

select
    {{kwargs.column_BK}},
    {{print_columns(kwargs.column_list)}},
    {{kwargs.column_HSH}},
	ROW_NUMBER () OVER (PARTITION BY {{kwargs.column_BK}} ORDER BY {{kwargs.column_LDTS}} DESC) As RowNo
from
	{{ this }}
)
,cteLatest as
(
	select
		{{kwargs.column_BK}},
		{{print_columns(kwargs.column_list)}},
		{{kwargs.column_HSH}}
	FROM
		cteThis
	WHERE
		RowNo = 1
)
,cteSource as
(
SELECT
	{{kwargs.column_BK}},
	{{print_columns(kwargs.column_list)}},
	{{kwargs.column_HSH}}
FROM
	{{kwargs.source}}
)
insert into {{kwargs.target}}
({{kwargs.column_BK}}, {{print_columns(kwargs.column_list)}}, {{kwargs.column_HSH}}, LDTS)
SELECT
	{{kwargs.column_BK}},
	{{print_columns(kwargs.column_list)}},
	{{kwargs.column_HSH}},
	'{{ var("ldts") }}' AS LDTS
FROM
	cteSource src
WHERE
	NOT EXISTS( SELECT trg.{{kwargs.column_BK}} FROM cteLatest trg WHERE trg.{{kwargs.column_BK}} = src.{{kwargs.column_BK}} AND trg.{{kwargs.column_HSH}} = src.{{kwargs.column_HSH}} )


{% endmacro %}
