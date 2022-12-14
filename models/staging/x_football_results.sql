{{config(materialized='view', tags='football',enabled=false)}}

	SELECT
		match_key
		,CONVERT(BINARY(16), HASHBYTES('MD5',match_key))  as match_key_hash

		,GameNumber             AS match_no
		,GameWeek               AS match_week
		,CAST(MatchDay AS DATE) AS match_date
		,season
		,country
		,league
		,division
		,HomeTeam           AS team_home
		,AwayTeam           AS team_away
		,referee            AS referee
		,FullTimeResult     AS result_full_time
		,HalfTimeResult     AS result_half_time
		,FullTimeHomeGoal	AS goals_home
		,FullTimeAwayGoal	AS goals_away
		,HalfTimeHomeGoal	AS goals_halftime_home
		,HalfTimeAwayGoal	AS goals_halftime_away
		,CASE	WHEN FullTimeResult = 'H' THEN 3
				WHEN FullTimeResult = 'D' THEN 1
				WHEN FullTimeResult = 'A' THEN 0 END    AS points_home
		,CASE	WHEN FullTimeResult = 'A' THEN 3
				WHEN FullTimeResult = 'D' THEN 1
				WHEN FullTimeResult = 'H' THEN 0 END    AS points_away
		,CASE	WHEN HalfTimeResult = 'H' THEN 3
				WHEN HalfTimeResult = 'D' THEN 1
				WHEN HalfTimeResult = 'A' THEN 0 END    AS points_halftime_home
		,CASE	WHEN HalfTimeResult = 'A' THEN 3
				WHEN HalfTimeResult = 'D' THEN 1
				WHEN HalfTimeResult = 'H' THEN 0 END    AS points_half_time_away
		,HomeShots           AS shots_home
		,AwayShots          AS shots_away
		,HomeShotTarget     AS shots_target_home
		,AwayShotTarget     AS shots_target_away
		,HomeFouls          AS fouls_home
		,AwayFouls          AS fouls_away
		,HomeFoulsConceded  AS fouls_conceded_home
		,AwayFoulsConceded  AS fouls_conceded_away
		,HomeCorners        AS corners_home
		,AwayCorners        AS corners_away
		,HomeYellow         AS yellow_home
		,AwayYellow         AS yellow_away
		,HomeRed            AS red_home
		,AwayRed            AS red_away
        ,B365H              AS bet_365_home
        ,B365D              AS bet_355_draw
        ,B365A              AS bet_365_away
        ,BWH                AS bet_win_home
        ,BWD                AS bet_win_draw
        ,BWA		        AS bet_win_away
		,CASE WHEN Country IN ('England','Italy','France','Germany','Spain') THEN 1 ELSE 0 END AS big_five
    FROM
        {{ref('land_countries_union')}}