{{config(materialized='table', tags=['football','dimension'])}}


---- JOIN ON COUNTRY DATA AND LEAGUE DATA, OR SOLIT UP TO D_COUNTRY AND D_LEAGUE.
--have more specific attributes per leage and country
-- league
-- how many teams
-- average attendence
-- average salary etc

--Population
-- etc

    SELECT DISTINCT
        league_key
        ,league
        ,country
        ,CASE WHEN league IN  ('Premier League'
                                ,'Serie A'
                                ,'Ligue 1'
                                ,'La Liga'
                                ,'Bundesliga') THEN 1 ELSE 0 END AS big_five
    FROM
        {{ref('f_results_match_stg')}}