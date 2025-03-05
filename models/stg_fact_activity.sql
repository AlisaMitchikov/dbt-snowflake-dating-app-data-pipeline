select 
TIMESTAMP,
USER_ID,
ACTIVITY as activity_type,
from {{ source('DATALAKE', 'APP_EVENTS') }} as a
where lower(ACTIVITY) not like '%purchased%' and lower(ACTIVITY) <> 'match'
and date(TIMESTAMP) >= dateadd(day,-5,date(getdate()))