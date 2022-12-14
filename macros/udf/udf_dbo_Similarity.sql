{% macro create_udf_dbo_Similarity() %}
CREATE OR ALTER FUNCTION [dbo].[Similarity](@input1 [nvarchar](4000), @input2 [nvarchar](4000), @method [tinyint], @containmentBias [float], @minScoreHint [float])
RETURNS [float] WITH EXECUTE AS CALLER, RETURNS NULL ON NULL INPUT
AS
EXTERNAL NAME [Microsoft.MasterDataServices.DataQuality].[Microsoft.MasterDataServices.DataQuality.SqlClr].[Similarity]
{% endmacro %}