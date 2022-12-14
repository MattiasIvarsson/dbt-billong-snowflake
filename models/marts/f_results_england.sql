{{config(   materialized='incremental',
            tags='football',
            schema ='football',
            alias ='f_result_premier_league',
            enabled=false
)}}

 --- TEST to have all marts and simalar in another dbt project.
-- Our at least test if we could switch database during run. Just to have all Marts and endpoint in a own DATABASE


    SELECT
        f.*
    FROM
                {{ref('f_results_team')}}    AS f
    LEFT JOIN   {{ref('d_league')}}         AS c ON f.league_key = c.league_key
    WHERE
        c.country = 'England'
    AND YEAR(match_date) > 2010
    AND f.match_date >= {{var("billong_start_date_limit")}}

    {% if is_incremental() %} AND  match_date  > (SELECT MAX(match_date) FROM {{ this }}) {% endif %}