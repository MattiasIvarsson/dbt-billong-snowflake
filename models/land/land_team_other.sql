{{config(materialized='view', tags=['financial','other','financial'])}}

    SELECT
        Year					AS year
        ,Country				AS country
        ,League					AS league
        ,Club					AS team
        ,Europa					AS europe_competition
        ,Europa_position		AS europe_position
        ,[European Performance]	AS europe_performance
        ,TotalGames				AS total_games
        ,Avg_attendence_League	AS avg_attendance_league
        ,Instagram_m			AS instagram_m
        ,Twitter_m				AS twitter_m
        ,Facebook_m				AS facebook_m
    FROM
        {{source('football_land', 'football_teams_data')}}