{{config(materialized='table', tags=['football','dimension'])}}

---- JOIN ON TEAM DATA
-- Stadium
-- Capacity
-- City
-- Region
-- Shirt Color
-- Website
-- Nicknames


WITH team_step1 AS (
    SELECT DISTINCT
        team_home_key   AS team_key
        ,team_home      AS team
        ,country
        ,league
    FROM
        {{ref('f_results_match_stg')}}

UNION ALL
    SELECT DISTINCT
        team_away_key   AS team_key
        ,team_away      AS team
        ,country
        ,league
    FROM
        {{ref('f_results_match_stg')}}
)

    SELECT DISTINCT
         team_key
        ,team
        ,country
        ,league
        ,CASE WHEN league IN  ('Premier League'
                                ,'Serie A'
                                ,'Ligue 1'
                                ,'La Liga'
                                ,'Bundesliga') THEN 1 ELSE 0 END AS big_five
    FROM
        team_step1