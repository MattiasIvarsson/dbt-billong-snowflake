{{config(materialized='view', tags='football')}}


WITH union_all AS (
            SELECT * FROM {{ref('results_england_stg')}}
UNION ALL   SELECT * FROM {{ref('results_france_stg')}}
UNION ALL   SELECT * FROM {{ref('results_germany_stg')}}
UNION ALL   SELECT * FROM {{ref('results_italy_stg')}}
UNION ALL   SELECT * FROM {{ref('results_spain_stg')}}
)

    SELECT
        CONVERT(BINARY(16), HASHBYTES('MD5',CONCAT(country,league)))    AS league_key
        ,CONVERT(BINARY(16), HASHBYTES('MD5',team_home))                AS team_home_key
        ,CONVERT(BINARY(16), HASHBYTES('MD5',team_away))                AS team_away_key
        ,*
    FROM
        union_all