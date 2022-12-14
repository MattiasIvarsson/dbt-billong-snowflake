{% macro create_udf_dbo_JaroDistance() %}
CREATE OR ALTER FUNCTION [dbo].[JaroDistance](@input1 [nvarchar](4000), @input2 [nvarchar](4000))
RETURNS FLOAT  WITH EXECUTE AS CALLER, RETURNS NULL ON NULL INPUT
AS
BEGIN
	 RETURN	[dbo].[Similarity](@input1,@input2, 2, 0.0, 0.0)
END
{% endmacro %}