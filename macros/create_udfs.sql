{% macro create_udfs() %}
{% do run_query(create_dbo_udfGetOnlyNumeric()) %};
{% do run_query(create_dbo_DelimitedSplit8K()) %};
{% do run_query(create_dbo_ConvertFirstLetterinCapital()) %};
{% do run_query(create_udf_dbo_Similarity()) %};
{% do run_query(create_udf_dbo_JaccDistance()) %};
{% do run_query(create_udf_dbo_JaroDistance()) %};
{% do run_query(create_udf_dbo_LevDistance()) %};
{% do run_query(create_udf_dbo_LongestDistance()) %};
{% endmacro %}