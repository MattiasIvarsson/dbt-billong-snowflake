{{config(materialized='view', tags=['football','spain'])}}

    SELECT
        CONCAT(date,HomeTeam,AwayTeam) AS match_key
        ,date       AS match_date
        ,Time		AS match_time
        ,CASE	WHEN date BETWEEN '2021-08-01' AND '2022-06-01' THEN '2021/2022'
                WHEN date BETWEEN '2020-08-01' AND '2021-06-01' THEN '2020/2021'
                WHEN date BETWEEN '2019-08-01' AND '2020-07-31' THEN '2019/2020' END AS season
        ,'Spain'			AS country
        ,'La Liga'          AS league
        ,1					AS division
        ,HomeTeam			AS team_home
        ,AwayTeam			AS team_away
        ,NULL               AS referee
        ,FTR				AS result_full_time
        ,HTR				AS result_half_time
        ,FTHG				AS goals_home
        ,FTAG				AS goals_away
        ,HTHG				AS goals_half_time_home
        ,HTAG				AS goals_half_time_away
        ,HS					AS shots_home
        ,[AS]				AS shots_away
        ,HST				AS shots_target_home
        ,AST				AS shots_target_away
        ,HF					AS fouls_home
        ,AF					AS fouls_away
        ,HC					AS corners_home
        ,AC					AS corners_away
        ,HY					AS yellow_home
        ,AY					AS yellow_away
        ,HR					AS red_home
        ,AR					AS red_away
    FROM
        {{source('football_land', 'spain_2019_2022')}}