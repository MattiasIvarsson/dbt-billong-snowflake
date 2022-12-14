{{config(materialized='view',tags='admin',schema ='admin')}}

WITH monitoring AS (

	SELECT
		CAST(s.deployment_started_at AS DATE)										AS log_date
		,s.deployment_started_at													AS log_datetime
		,c.is_working_day															AS working_day
		,l.event_schema																AS event_project
		,s.model																	AS event_model
		,DENSE_RANK() OVER(PARTITION BY CAST(s.deployment_started_at AS DATE) ORDER BY  d.deployment_started_at ) AS event_order
		,CASE	WHEN event_schema IN('staging','inter')						THEN 'Core'
				WHEN event_schema IN('marts','football')					THEN 'Marts' ELSE 'Core' END AS event_group
		,DATEDIFF(MILLISECOND,	s.deployment_started_at,s.deployment_completed_at)	AS run_time_msecond
		,DATEDIFF(SECOND,		s.deployment_started_at,s.deployment_completed_at)	AS run_time_second
		,s.deployment_started_at													AS event_started
		,s.deployment_completed_at													AS event_ended
		,d.models_deployed															AS tot_run_models
		,d.deployment_started_at													AS tot_event_start
		,d.deployment_completed_at													AS tot_event_end
		,DENSE_RANK () OVER (   ORDER BY l.invocation_id)							AS log_id
		,l.invocation_id															AS invocation_id
		,DATEDIFF(MILLISECOND,	d.deployment_started_at,d.deployment_completed_at)	AS tot_run_time_msecond
		,DATEDIFF(SECOND,		d.deployment_started_at,d.deployment_completed_at)	AS tot_run_time_second

	FROM
				{{ref('stg_dbt_model_deployments')}}    AS s
	LEFT JOIN	{{ref('stg_dbt_audit_log')}}			AS l ON l.invocation_id = s.invocation_id AND s.model = l.event_model AND l.event_name = 'model deployment started'
	LEFT JOIN	{{ref('stg_dbt_deployments')}} 	        AS d ON s.invocation_id = d.invocation_id
	LEFT JOIN	{{ref('d_calendar')}} 	                AS c ON CAST(s.deployment_started_at AS DATE) = c.date_key

)

	SELECT
		*
	FROM
		monitoring
	WHERE
		log_date	> GETDATE()-360