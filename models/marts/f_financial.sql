{{config(   materialized='table',
            tags='financial',
            schema='financial')}}

    SELECT * FROM {{ref('f_financial_team')}}

