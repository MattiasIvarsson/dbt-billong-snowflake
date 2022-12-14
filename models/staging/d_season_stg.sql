{{config(   materialized='view',
            tags='football',
)}}

    SELECT
        MIN(match_date) AS from_date
        ,MAX(match_date) AS to_date
        ,season
    FROM
        {{ref('f_results_match_stg')}}
    GROUP BY
        season
