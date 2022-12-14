{{config(materialized='view', tags=['football','big_five','germany'])}}


WITH germany_union AS (
	SELECT
 		match_key
		,match_no
		,match_week
		,match_date
		,season
		,country
		,league
		,division
		,team_home
		,team_away
		,referee
		,result_full_time
		,result_half_time
		,goals_home
		,goals_away
		,goals_half_time_home
		,goals_half_time_away
		,shots_home
		,shots_away
		,shots_target_home
		,shots_target_away
		,fouls_home
		,fouls_away
		,corners_home
		,corners_away
		,yellow_home
		,yellow_away
		,red_home
		,red_away
    FROM
        {{ref('land_germany_2000_2019')}}
UNION ALL
	SELECT
 		match_key
 		,ROW_NUMBER() OVER(PARTITION BY season ORDER BY match_date,match_time,team_home ) AS match_no
		,NULL AS match_week
		,match_date
		,season
		,country
		,league
		,division
		,team_home
		,team_away
		,referee
		,result_full_time
		,result_half_time
		,goals_home
		,goals_away
		,goals_half_time_home
		,goals_half_time_away
		,shots_home
		,shots_away
		,shots_target_home
		,shots_target_away
		,fouls_home
		,fouls_away
		,corners_home
		,corners_away
		,yellow_home
		,yellow_away
		,red_home
		,red_away
    FROM
        {{ref('land_germany_2019_2022')}}
)

    SELECT
		CONVERT(BINARY(16), HASHBYTES('MD5',match_key))  as match_key
		,match_no
		,match_week
		,match_date
		,season
		,country
		,league
		,division
		,team_home
		,team_away
        ,CAST(referee AS VARCHAR(1)) AS referee		,result_full_time
		,result_half_time
		,goals_home
		,goals_away
		,goals_half_time_home
		,goals_half_time_away
		,CASE	WHEN result_full_time = 'H' THEN 3
				WHEN result_full_time = 'D' THEN 1
				WHEN result_full_time = 'A' THEN 0 END    AS points_home
		,CASE	WHEN result_full_time = 'A' THEN 3
				WHEN result_full_time = 'D' THEN 1
				WHEN result_full_time = 'H' THEN 0 END    AS points_away
		,CASE	WHEN result_half_time = 'H' THEN 3
				WHEN result_half_time = 'D' THEN 1
				WHEN result_half_time = 'A' THEN 0 END    AS points_half_time_home
		,CASE	WHEN result_half_time = 'A' THEN 3
				WHEN result_half_time = 'D' THEN 1
				WHEN result_half_time = 'H' THEN 0 END    AS points_half_time_away
		,shots_home
		,shots_away
		,shots_target_home
		,shots_target_away
		,fouls_home
		,fouls_away
		,corners_home
		,corners_away
		,yellow_home
		,yellow_away
		,red_home
		,red_away
	FROM
	    germany_union
