{{config(materialized='table',schema='football', tags='football',enabled=false)}}

with cte as (
----England-------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,Referee
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,null 				AS HomeFoulsConceded
		,null 				AS AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA
	FROM {{ref('England')}}

------------------------Serie A 17/18---------------------------------------------------------------------------------
UNION ALL

----Spain-------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,null 				AS HomeFoulsConceded
		,null 				AS AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Spain')}}


UNION ALL


----Italy-------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,null 				AS HomeFoulsConceded
		,null 				AS AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Italy')}}


UNION ALL


----Germany-------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,null 				AS HomeFoulsConceded
		,null 				AS AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Germany')}}



UNION ALL

---- France------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,null 				AS HomeFoulsConceded
		,null 				AS AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('France')}}


UNION ALL

---- Argentina-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

	FROM {{ref('Argentina')}}

UNION ALL

---- Austria-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Austria')}}


		UNION ALL

---- Belgium------------------

SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,NULL
		,NULL
		,HomeFoulsConceded
		,AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Belgium')}}


UNION ALL

---- Brazil-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Brazil')}}

UNION ALL

---- Denmark-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Denmark')}}

UNION ALL

---- Finland-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Finland')}}

UNION ALL

	SELECT
		GameNumber
		,GameWeek
		,MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,null
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,null 					AS HomeFouls
		,null 					AS AwayFouls
		,HomeFoulsConceded
		,AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Greece')}}


UNION ALL

---- Ireland-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Ireland')}}


UNION ALL

---- Japan-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Japan')}}



UNION ALL

----Netherlands-------------------


	SELECT
		GameNumber
		,GameWeek
		,CAST(MatchDay AS DATE) AS MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,null
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,null 					AS HomeFouls
		,null 					AS AwayFouls
		,HomeFouls
		,AwayFouls
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Netherlands')}}


UNION ALL

---- Norway-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Norway')}}



UNION ALL

---- Poland-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Poland')}}



UNION ALL

----Portugal-------------------


	SELECT
		GameNumber
		,GameWeek
		,CAST(MatchDay AS DATE) AS MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,null
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,null 					AS HomeFouls
		,null 					AS AwayFouls
		,HomeFouls
		,AwayFouls
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Portugal')}}


UNION ALL

---- Romania-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Romania')}}


UNION ALL

---- Russia-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Russia')}}


UNION ALL

---- Scotland-------------------


	SELECT
		GameNumber
		,GameWeek
		,MatchDay AS MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,Referee
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,null 					AS HomeFouls
		,null 					AS AwayFouls
		,HomeFouls
		,AwayFouls
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Scotland')}}


UNION ALL

---- Sweden-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Sweden')}}

UNION ALL

---- Switzerland-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('Switzerland')}}

UNION ALL

---- Turkey-------------------


	SELECT
		GameNumber
		,GameWeek
		,MatchDay AS MatchDay
		,null 		AS MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,null
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,null 					AS HomeFouls
		,null 					AS AwayFouls
		,HomeFouls
		,AwayFouls
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA

	FROM {{ref('Turkey')}}



	UNION ALL

---- USA-------------------

SELECT
  		GameNumber
		,GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,NULL
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
		,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL
        ,NULL

		FROM {{ref('USA')}}

		)

	SELECT
		CAST(GameNumber AS varchar) + '-' + cast(MatchDay as varchar) +'-' +CAST(Country AS VARCHAR) AS match_key
		,GameNumber
		,CASE WHEN GameWeek = 100  THEN 10 ELSE GameWeek END AS GameWeek
		,MatchDay
		,MatchTime
		,Season
		,Country
		,League
		,Division
		,HomeTeam
		,AwayTeam
		,Referee
		,FullTimeHomeGoal
		,FullTimeAwayGoal
		,FullTimeResult
		,HalfTimeHomeGoal
		,HalfTimeAwayGoal
		,HalfTimeResult
		,HomeShots
		,AwayShots
		,HomeShotTarget
		,AwayShotTarget
		,HomeFouls
		,AwayFouls
		,HomeFoulsConceded
		,AwayFoulsConceded
		,HomeCorners
		,AwayCorners
		,HomeYellow
		,AwayYellow
		,HomeRed
		,AwayRed
        ,B365H
        ,B365D
        ,B365A
        ,BWH
        ,BWD
        ,BWA
        ,IWH
        ,IWD
        ,IWA
        ,LBH
        ,LBD
        ,LBA
        ,PSH
        ,PSD
        ,PSA
        ,WHH
        ,WHD
        ,WHA
        ,VCH
        ,VCD
        ,VCA
        ,Bb1X2
        ,BbMxH
        ,BbAvH
        ,BbMxD
        ,BbAvD
        ,BbMxA
        ,BbAvA
        ,BbOU
        ,BbMx_2_5
        ,BbAv_2_5
        ,BbMx_2_5_2
        ,BbAv_2_5_2
        ,BbAH
        ,BbAHh
        ,BbMxAHH
        ,BbAvAHH
        ,BbMxAHA
        ,BbAvAHA
        ,PSCH
        ,PSCD
        ,PSCA
	FROM
		cte