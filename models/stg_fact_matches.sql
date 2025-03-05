select 
TIMESTAMP as match_date,
MATCH_SOURCE,
USER_ID as user1_id,
USER_ID_MATCHED as user2_id
from {{ source('DATALAKE', 'APP_EVENTS') }} as a
where lower(ACTIVITY) = 'match'
and date(TIMESTAMP) >= dateadd(day,-5,date(getdate()))