
  create or replace  view BILLONG.land.land_france_2000_2019
  
   as (
    

    SELECT
        CONCAT(MatchDay,HomeTeam,AwayTeam)          AS match_key
        ,GameNumber                                 AS match_no
        ,GameWeek                                   AS match_week
        ,CAST(MatchDay AS DATE)                     AS match_date
        --,MatchTime
        ,Season                                     AS season
        ,Country                                    AS country
        ,REPLACE(REPLACE(League,' "',''),'"','')    AS league
        ,Division                                   AS division
        ,HomeTeam                                   AS team_home
        ,AwayTeam                                   AS team_away
        ,CASE WHEN Referee			='NULL' THEN NULL ELSE Referee				END AS referee
        ,CASE WHEN FullTimeResult	='NULL' THEN NULL ELSE FullTimeResult		END AS result_full_time
        ,CASE WHEN HalfTimeResult	='NULL' THEN NULL ELSE HalfTimeResult		END AS result_half_time
        ,CASE WHEN FullTimeHomeGoal	='NULL' THEN NULL ELSE FullTimeHomeGoal		END AS goals_home
        ,CASE WHEN FullTimeAwayGoal	='NULL' THEN NULL ELSE FullTimeAwayGoal		END AS goals_away
        ,CASE WHEN HalfTimeHomeGoal	='NULL' THEN NULL ELSE HalfTimeHomeGoal		END AS goals_half_time_home
        ,CASE WHEN HalfTimeAwayGoal	='NULL' THEN NULL ELSE HalfTimeAwayGoal		END AS goals_half_time_away

        ,CASE WHEN HomeShots		='NULL' THEN NULL ELSE HomeShots			END AS shots_home
        ,CASE WHEN AwayShots		='NULL' THEN NULL ELSE AwayShots			END AS shots_away
        ,CASE WHEN HomeShotTarget	='NULL' THEN NULL ELSE HomeShotTarget		END AS shots_target_home
        ,CASE WHEN AwayShotTarget	='NULL' THEN NULL ELSE AwayShotTarget		END AS shots_target_away
        ,CASE WHEN HomeFouls		='NULL' THEN NULL ELSE HomeFouls			END AS fouls_home
        ,CASE WHEN AwayFouls		='NULL' THEN NULL ELSE AwayFouls			END AS fouls_away
        ,CASE WHEN HomeCorners		='NULL' THEN NULL ELSE HomeCorners			END AS corners_home
        ,CASE WHEN AwayCorners		='NULL' THEN NULL ELSE AwayCorners			END AS corners_away
        ,CASE WHEN HomeYellow		='NULL' THEN NULL ELSE HomeYellow			END AS yellow_home
        ,CASE WHEN AwayYellow		='NULL' THEN NULL ELSE AwayYellow			END AS yellow_away
        ,CASE WHEN HomeRed			='NULL' THEN NULL ELSE HomeRed				END AS red_home
        ,CASE WHEN AwayRed			='NULL' THEN NULL ELSE AwayRed				END AS red_away
    FROM
        BILLONG_LAND.dbo.France_2000_2019
  );
