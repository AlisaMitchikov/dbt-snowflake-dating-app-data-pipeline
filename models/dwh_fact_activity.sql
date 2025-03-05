{{ 
    config(materialized='incremental',
    unique_key = ['TIMESTAMP','USER_ID'],
    incremental_strategy='merge') 
}}

select *
from {{ ref('stg_fact_activity') }}

{% if is_incremental() %}
where TIMESTAMP >= (select max(TIMESTAMP) from {{ this }})
{% endif %}