select count(1) as rows_count
from {{ ref('stg_dim_customers') }}