with sources as (
    select * from {{ ref('raw_crm_client_user')}}

)

select 
    id_client,
    name,
    email,
    number,
    number_cpf,
    country_sigle,
    create_account_date
from
    sources
