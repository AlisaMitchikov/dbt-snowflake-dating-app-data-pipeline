{{ 
    config(materialized='incremental',
    unique_key = ['match_date','user1_id','user2_id'],
    incremental_strategy='merge') 
}}

select *
from {{ ref('stg_fact_matches') }}

{% if is_incremental() %}
where match_date >= (select max(match_date) from {{ this }})
{% endif %}
