with rename as (
    select
        *
    from
        {{ref('raw_crm__nova_table')}}
)

select * from rename