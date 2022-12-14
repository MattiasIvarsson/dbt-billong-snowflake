{{config(materialized='view',alias='f_team_other', tags=['other','financial'])}}

	SELECT
		year
		,country
        ,CASE	WHEN league = 'Bundesliga'		THEN 'Bundesliga'
		        WHEN league = 'La Liga'			THEN 'LaLiga'
		        WHEN league = 'Ligue 1'			THEN 'Ligue1'
		        WHEN league = 'Premier League'	THEN 'PremierLeague'
		        WHEN league = 'Serie A'			THEN 'SerieA'			END AS league
		,team
		,europe_competition
		,europe_position
		,europe_performance
		,total_games
		,avg_attendance_league
		,instagram_m
		,twitter_m
		,facebook_m
    FROM
        {{ref('land_team_other')}}