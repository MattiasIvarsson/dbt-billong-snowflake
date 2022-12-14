{{config(   materialized='table',tags='football')}}


WITH match_union AS (

    SELECT
        r.match_key
        ,CONCAT(match_date,team_home,team_away,'Home') AS match_unique_key
        ,r.league_key
        ,r.match_date
        ,'Home'             AS location
        ,r.team_home_key    AS team_key
        ,r.team_away_key    AS team_key_opponent
        ,r.match_no
        ,r.match_week
        ,r.season
        ,r.division
        ,r.result_full_time         AS result
        ,r.result_half_time
        ,r.points_home			    AS points
        ,r.points_half_time_home	AS points_half_time
        ,r.goals_home			    AS goals
        ,r.goals_half_time_home	    AS goals_half_time
        ,r.shots_home			    AS shots
        ,r.shots_target_home	    AS shots_target
        ,r.fouls_home			    AS fouls
        ,r.corners_home			    AS corners
        ,r.yellow_home			    AS yellow
        ,r.red_home				    AS red
    FROM
        {{ref('f_results_match_stg')}}  AS r

UNION ALL
    SELECT
        r.match_key
        ,CONCAT(match_date,team_home,team_away,'Away') AS match_unique_key
        ,r.league_key
        ,r.match_date
        ,'Away'                AS location
        ,r.team_away_key       AS team_key
        ,r.team_home_key       AS team_key_opponent
        ,r.match_no
        ,r.match_week
        ,r.season
        ,r.division
        ,r.result_full_time         AS result
        ,r.result_half_time
        ,r.points_away			    AS points
        ,r.points_half_time_away    AS points_half_time
        ,r.goals_away			    AS goals
        ,r.goals_half_time_away	    AS goals_half_time
        ,r.shots_away			    AS shots
        ,r.shots_target_away	    AS shots_target
        ,r.fouls_away			    AS fouls
        ,r.corners_away			    AS corners
        ,r.yellow_away			    AS yellow
        ,r.red_away				    AS red
    FROM
        {{ref('f_results_match_stg')}}  AS r
)

    SELECT
        match_key
        ,HASH(match_unique_key) AS match_unique_key
        ,league_key
        ,match_date
        ,location
        ,team_key
        ,team_key_opponent
        ,match_no
        ,match_week
        ,season
        ,division
        ,result
        ,result_half_time
        ,points
        ,points_half_time
        ,goals
        ,goals_half_time
        ,shots
        ,shots_target
        ,fouls
        ,corners
        ,yellow
        ,red
    FROM
        match_union
