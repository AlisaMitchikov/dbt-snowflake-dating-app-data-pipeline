select *
from {{ source('DATALAKE', 'CITIES') }}