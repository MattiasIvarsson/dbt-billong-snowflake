{{config(   materialized='incremental',
            tags='football',
            schema ='football',
            alias ='f_results_team',
            enabled=false)}}

    SELECT
        f.*
    FROM
        {{ref('f_results_team')}}    AS f
    WHERE
        YEAR(match_date) > 2010
    {% if is_incremental() %} AND  match_date  > (SELECT MAX(match_date) FROM {{ this }}) {% endif %}