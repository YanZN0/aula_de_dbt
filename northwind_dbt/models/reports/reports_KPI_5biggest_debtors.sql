-- models/reports/reports_KPI_5biggest_deborts.sql

{{ config(
    schema='gold',
    materialized='table'
) }}

-- IMPORTS (Importações de tabelas que você irá precisar.)

with sources_cd as (
    select *
    from {{ref('stg_card_user')}}
),


sources_ct as (
    select *
    from {{ref('stg_client_user')}}
),





-- REGRAS DE NEGÓCIO (Querys com CTEs estratégicas para a área de negócios da empresa.)


filtro_2023 as (
    select
        id_client, name
    from sources_ct
        where extract(year from create_account_date) = 2023
        order by create_account_date
)



select ft.id_client, ft.name,
    MAX(cd.limite) as limite
from filtro_2023 as ft
INNER JOIN sources_cd as cd ON ft.id_client = cd.id_card
GROUP BY ft.id_client, ft.name
ORDER BY limite DESC
limit 1




