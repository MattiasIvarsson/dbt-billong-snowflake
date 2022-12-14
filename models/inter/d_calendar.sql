WITH datelimit AS(
	select
		CAST( '2000-01-01' AS DATE) AS StartDate,
		CAST( '2030-01-02' AS DATE) AS EndDate
)
,n AS (
	SELECT n FROM (VALUES(0),(1),(2),(3),(4),(5),(6),(7),(8),(9)) t(n)
	)
,gen AS(

	SELECT
		TOP (SELECT DATEDIFF(DAY,(SELECT StartDate FROM datelimit), (SELECT EndDate FROM datelimit)))
		[date_key]=CONVERT(DATE,DATEADD(DAY,ROW_NUMBER() OVER(ORDER BY (SELECT 1))-1,(SELECT StartDate FROM datelimit)))
	FROM
				n AS deka
	CROSS JOIN	n AS hecto
	CROSS JOIN	n AS kilo
	CROSS JOIN	n AS tenK
	CROSS JOIN	n AS hundredK
)
, gen_step2 AS (
    SELECT
		 date_key																																AS date_key
		,date_key																																as calendar_date
        ,MONTH(date_key) 																														AS month
		,YEAR(date_key) 																														AS year
		,LEFT(date_key,7) 																														AS yearmonth
		,CONCAT(YEAR(date_key),'-', DATEPART(QUARTER,   date_key )) 																			AS yearquarter
		,CASE WHEN date_key = CONVERT(date, DATEADD(MONTH, DATEDIFF(MONTH, 0,  date_key ), 0))                              THEN 1 ELSE 0 END	AS first_day_of_month
		,CASE WHEN date_key = EOMONTH(date_key)                                                                             THEN 1 ELSE 0 END	AS last_day_of_month
   	 	,DATENAME(MONTH,     date_key ) 																										AS month_name
   	 	,DATEPART(WEEK,      date_key ) 																										AS week
   	 	,DATEPART(ISO_WEEK,  date_key ) 																										AS iso_week
   	 	,DATEPART(WEEKDAY,   date_key ) 																										AS day_of_week
        ,1+(DATEPART(dw, date_key)+@@DATEFIRST-2)%7																								AS day_of_week_swe
   	 	,DATEPART(QUARTER,   date_key ) 																										AS quarter
   	 	,CASE WHEN date_key = CONVERT(date, DATEADD(YEAR, DATEDIFF(YEAR,  0,  date_key ), 0))                              THEN 1 ELSE 0 END	AS first_day_of_year
   	 	,CONVERT(date, DATEADD(MONTH, DATEDIFF(MONTH, 0,  date_key ), 0)) 																		AS first_date_of_month
		,EOMONTH(date_key) 																														AS last_date_of_month
   	 	,CONVERT(date, DATEADD(YEAR,  DATEDIFF(YEAR,  0,  date_key ), 0)) 																		AS first_date_of_year
		,CONVERT(date, DATEADD(MONTH, DATEDIFF(MONTH, 0,  DATEADD(MONTH, 1, date_key)), 0)) 													AS first_date_of_next_month
		,DATEADD(DAY, 1, EOMONTH(date_key, -2))																									AS first_day_prev_month	-- FIRST day previous month
	    ,EOMONTH(date_key, -1)																													AS last_day_prev_month
		,CASE WHEN YEAR(date_key) = YEAR(GETDATE()) and MONTH(date_key) = MONTH(GETDATE())                                  THEN 1 ELSE 0 END	AS is_current_month
		,CASE WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -1, GETDATE()),'yyyy-MM')								THEN 1 ELSE 0 END	AS is_prev_month
		,CASE WHEN YEAR(date_key) = YEAR(GETDATE())										                                    THEN 1 ELSE 0 END	AS is_current_year
	    ,CASE WHEN YEAR(date_key) = YEAR(GETDATE())-1									                                    THEN 1 ELSE 0 END	AS is_prev_year
	    ,CASE WHEN YEAR(date_key) = YEAR(GETDATE())		AND date_key <= GETDATE()		                                    THEN 1 ELSE 0 END	AS ytd
	    ,CASE WHEN YEAR(date_key) = YEAR(GETDATE())-1	AND date_key <= GETDATE()-365	                                    THEN 1 ELSE 0 END	AS lytd
        ,CASE WHEN date_key BETWEEN DATEADD(MONTH,DATEDIFF(MONTH, 0,DATEADD(MONTH,-3,GETDATE())),0)  AND EOMONTH(GETDATE())	THEN 1 ELSE 0 END	AS is_prev_3_months
        ,CASE WHEN date_key BETWEEN DATEADD(MONTH,DATEDIFF(MONTH, 0,DATEADD(MONTH,-6,GETDATE())),0)  AND EOMONTH(GETDATE())	THEN 1 ELSE 0 END	AS is_prev_6_months
	    ,CASE WHEN date_key BETWEEN DATEADD(MONTH,DATEDIFF(MONTH, 0,DATEADD(MONTH,-12,GETDATE())),0) AND EOMONTH(GETDATE())	THEN 1 ELSE 0 END	AS is_prev_12_months
	    ,CASE WHEN date_key BETWEEN DATEADD(MONTH,DATEDIFF(MONTH, 0,DATEADD(MONTH,-24,GETDATE())),0) AND EOMONTH(GETDATE())	THEN 1 ELSE 0 END	AS is_prev_24_months
	    ,CASE WHEN date_key BETWEEN DATEADD(MONTH,DATEDIFF(MONTH, 0,DATEADD(MONTH,-36,GETDATE())),0) AND EOMONTH(GETDATE())	THEN 1 ELSE 0 END	AS is_prev_36_months
		,CASE WHEN CAST(GETDATE() AS DATE)		= date_key																	THEN 1 ELSE 0 END	AS today_flag
		,CASE WHEN CAST(GETDATE()-1 AS DATE)	= date_key																	THEN 1 ELSE 0 END	AS yesterday_flag
		,CASE WHEN DATEDIFF(WK,date_key,GETDATE()) = 0																		THEN 1 ELSE 0 END	AS current_week
		,CASE WHEN DATEDIFF(WK,date_key,GETDATE()) = 1																		THEN 1 ELSE 0 END	AS prev_week
		,CASE WHEN DATEPART(WEEKDAY,   date_key) in (1, 7)                                                                  THEN 0 ELSE 1 END	AS is_working_day

        ,CASE WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -12, GETDATE()),'yyyy-MM')                            THEN 1 ELSE 0 END     AS is_current_month_last
        ,CASE WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -13, GETDATE()),'yyyy-MM')                            THEN 1 ELSE 0 END     AS is_prev_month_last
		,CASE WHEN CONCAT_WS('-',YEAR(date_key), DATEPART(QUARTER, date_key )) = CONCAT_WS('-', YEAR(GETDATE()), DATEPART(QUARTER, GETDATE()) ) THEN 1 ELSE 0 END AS current_quarter
		,CASE WHEN CONCAT(YEAR(date_key),'-', DATEPART(QUARTER, date_key )) = CONCAT(YEAR(dateadd(QUARTER,-1,GETDATE())),'-', DATEPART(QUARTER,   dateadd(QUARTER,-1,GETDATE()) )) THEN 1 ELSE 0 END AS prev_quarter
		,CASE	WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -1, GETDATE()),'yyyy-MM') THEN 1
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -2, GETDATE()),'yyyy-MM') THEN 2
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -3, GETDATE()),'yyyy-MM') THEN 3
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -4, GETDATE()),'yyyy-MM') THEN 4
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -5, GETDATE()),'yyyy-MM') THEN 5
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -6, GETDATE()),'yyyy-MM') THEN 6
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -7, GETDATE()),'yyyy-MM') THEN 7
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -8, GETDATE()),'yyyy-MM') THEN 8
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -9, GETDATE()),'yyyy-MM') THEN 9
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -10, GETDATE()),'yyyy-MM') THEN 10
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -11, GETDATE()),'yyyy-MM') THEN 11
				WHEN FORMAT(date_key,'yyyy-MM') = FORMAT(DATEADD(MONTH, -12, GETDATE()),'yyyy-MM') THEN 12	ELSE 0	END AS prev_month_no
    FROM
	    gen g
)
SELECT
     date_key
    ,calendar_date
    ,s.season AS football_season
    ,year
    ,quarter
    ,yearquarter
    ,month
    ,month_name
    ,yearmonth
    ,first_day_of_month
    ,last_day_of_month
    ,week
    ,iso_week
    ,day_of_week
    ,first_day_of_year
    ,first_date_of_month
    ,last_date_of_month
    ,first_date_of_year
    ,first_date_of_next_month
    ,is_current_year
    ,is_prev_year
    ,ytd
    ,lytd
    ,is_current_month
    ,is_prev_month
    ,is_prev_6_months
    ,is_prev_12_months
    ,is_prev_24_months
    ,is_prev_36_months
    ,today_flag
    ,yesterday_flag
    ,current_week
    ,prev_week
    ,is_working_day
    ,DATEDIFF(DAY,date_key,MIN(CASE WHEN  is_working_day = 1 THEN date_key END) OVER(ORDER BY date_key ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING))	AS days_to_next_working_day
    ,MIN(CASE when is_working_day = 1 THEN date_key end) over(order by date_key ROWS BETWEEN 1 FOLLOWING AND UNBOUNDED FOLLOWING)							AS next_working_day
    ,first_day_prev_month
    ,last_day_prev_month
	,is_current_month_last
    ,is_prev_month_last
	,current_quarter
	,prev_quarter
    ,prev_month_no
FROM
            gen_step2 AS c
LEFT JOIN {{ref('d_season_stg')}}   AS s ON c.date_key BETWEEN s.from_date AND s.to_date

