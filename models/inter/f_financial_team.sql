{{config(   materialized='table',
            tags='financial',
)}}


    SELECT
        f.year
        ,c.league_key
        ,t.team_key
        ,f.league
        ,f.team
        ,f.enterprice_value_m
        ,f.total_revenue_m_euro
        ,f.broadcasting_m_euro
        ,f.match_day_m_euro
        ,f.commercial_m_euro
        ,f.net_income_m_euro
        ,f.wage_m_euro
    FROM
                {{ref('team_financial')}}   AS f
    LEFT JOIN   {{ref('d_league')}}         AS c    ON f.country = c.country   AND f.league = c.league
    LEFT JOIN   {{ref('d_team')}}           AS t    ON f.country = c.country   AND f.league = c.league AND f.team = t.team






