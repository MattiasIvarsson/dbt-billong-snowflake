{% macro create_dbo_udfGetOnlyNumeric() %}
CREATE OR ALTER FUNCTION [dbo].[udfGetOnlyNumeric]
	(@String NVARCHAR(100))
RETURNS NVARCHAR(100)
WITH SCHEMABINDING
AS
BEGIN
	WHILE PATINDEX('%[^0-9]%', @String) > 0
		SET @String = REPLACE(@String, SUBSTRING(@String,PATINDEX('%[^0-9]%', @String),1),'')
		WHILE PATINDEX('%+%', @String) > 0
			SET @String = REPLACE(@String, SUBSTRING(@String,PATINDEX('%[^0-9]%', @String),1),'')

	Return @String
END
{% endmacro %}