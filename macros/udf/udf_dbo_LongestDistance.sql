{% macro create_udf_dbo_LongestDistance() %}
CREATE OR ALTER FUNCTION [dbo].[LongestDistance](@input1 [nvarchar](4000), @input2 [nvarchar](4000))
RETURNS FLOAT  WITH EXECUTE AS CALLER, RETURNS NULL ON NULL INPUT
AS
BEGIN
	 RETURN	[dbo].[Similarity](@input1,@input2, 3, 0.0, 0.0)
END
{% endmacro %}