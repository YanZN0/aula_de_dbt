-- IMPORTS (Importações de tabelas que você irá precisar.)

with sources as (

    select * from {{ ref('raw_crm_card_user')}}

)


-- LOGICA DE NEGÓCIO ( + CTEs com o foco em modificações e atualizações, para limpar, renomear colunas e padronizar dados.)  


select 
    id_card,
    name,
    number_cpf,
    customer_id,
    limite,
    expiration_date,
    negative_value
from
    sources

