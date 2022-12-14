{{config(   materialized='table',
            tags='football',
            enabled=false,
            post_hook ="{{ create_nonclustered_index(columns = ['match_key'], includes = ['points_home']) }}"
)}}


    SELECT
        match_key
        ,league_key
        ,team_key_home
        ,team_key_away

        ,match_no
        ,match_week
        ,match_date
        ,season
        ,division
        ,referee
        ,result_full_time
        ,result_half_time
        ,goals_home
        ,goals_away
        ,goals_half_time_home
        ,goals_half_time_away
        ,points_home
        ,points_away
        ,points_half_time_home
        ,points_half_time_away
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
        {{ref('f_results_match_stg')}}  AS r