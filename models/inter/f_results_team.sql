{{config(   materialized='table',
            tags='football',
            post_hook ="{{ create_nonclustered_index(columns = ['match_key'], includes = ['points']) }}"
)}}


    SELECT
        match_key
        ,match_unique_key
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
        {{ref('f_results_team_stg')}}