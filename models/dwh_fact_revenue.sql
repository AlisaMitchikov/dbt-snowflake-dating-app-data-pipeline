{{ 
    config(materialized='incremental',
    unique_key = ['transaction_date','USER_ID'],
    incremental_strategy='merge') 
}}

select *
from {{ ref('stg_fact_revenue') }}

{% if is_incremental() %}
where TRANSACTION_DATE >= (select max(TRANSACTION_DATE) from {{ this }})
{% endif %}
