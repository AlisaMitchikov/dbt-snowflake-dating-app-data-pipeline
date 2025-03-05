select *
from {{ source('DATALAKE', 'GENDERS') }}