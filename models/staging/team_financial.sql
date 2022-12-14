{{config(materialized='view', tags=['football','financial'])}}

    SELECT
        year
        ,country
        ,CASE	WHEN league = 'Bundesliga'		THEN 'Bundesliga'
		        WHEN league = 'La Liga'			THEN 'LaLiga'
		        WHEN league = 'Ligue 1'			THEN 'Ligue1'
		        WHEN league = 'Premier League'	THEN 'PremierLeague'
		        WHEN league = 'Serie A'			THEN 'SerieA'			END AS league
        ,team
        ,enterprice_value_m
        ,total_revenue_m_euro
        ,broadcasting_m_euro
        ,match_day_m_euro
        ,commercial_m_euro
        ,net_income_m_euro
        ,wage_m_euro
        --,brand_value_m_dollar
        --,brand_value_m_euro
        --,sponsor_annaul_m
        --,sponsor
        --,kit_annual
        --,kit_manufacturer
        --,owner
        --,owner_country
        --,owner_major_field
        --,stadium_naming_rights
    FROM
        {{ref('land_team_financial')}}