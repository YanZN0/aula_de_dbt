-- models/reports/reports_client_old_customer_with_higher_limit.sql

{{ config(
    schema='gold',
    materialized='table'
) }}

-- IMPORTS (Importações de tabelas que você irá precisar.)


with sources_ct as (
    select *
    from {{ref('stg_client_user')}}
)


-- REGRAS DE NEGÓCIO ( Querys, CTE's, estratégicas para a empresa)


select 
    id_client, 
    name, 
    create_account_date
from sources_ct
WHERE extract(year from create_account_date) = 2023
ORDER BY create_account_date
limit 10



