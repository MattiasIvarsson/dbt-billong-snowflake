
  create or replace  view BILLONG.land.land_team_financial
  
   as (
    

SELECT
		Year						AS year
		,Country					AS country
		,League						AS league
		,Club						AS team
		,Enterprise_Value_M			AS enterprice_value_m
		,Total_Revenue_M_euro		AS total_revenue_m_euro
		,Broadcasting_m_euro		AS broadcasting_m_euro
		,Match_day_m_euro			AS match_day_m_euro
		,Commercial_m_euro			AS commercial_m_euro
		,[ Net_income_m_euro]		AS net_income_m_euro
		,Wage_m_euro				AS wage_m_euro
		,Brand_Value_m_dollar		AS brand_value_m_dollar
		,BrandValue_m_euro			AS brand_value_m_euro
		,Sponsor_annual_m_			AS sponsor_annaul_m
		,Sponsor					AS sponsor
		,kit_annual					AS kit_annual
		,kit_manufacturer			AS kit_manufacturer
		,owner						AS owner
		,OwnerCountry				AS owner_country
		,OwnerMajorField			AS owner_major_field
		,[StadiumNaming_rights]		AS stadium_naming_rights
FROM
    BILLONG_LAND.dbo.football_teams_data_financial
  );
