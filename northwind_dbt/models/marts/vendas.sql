{{config(
    materialized='incremental',
    unique_key='id',
    on_schema_change= 'sync_all-columns'
 )}}

with vendas as (
    select * from {{ref('stg_crm__nova_table')}}
)

select * from {{ref('stg_crm__nova_table')}}

{% if is_incremental() %}

where update_at > (select max(update_at) from {{this}})

{% endif %}