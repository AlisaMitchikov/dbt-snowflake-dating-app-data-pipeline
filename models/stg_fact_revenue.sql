with conversion as (
                    select DATE, CONVERSION_RATE
                    from FIRST_SNOWFLAKE_DATABASE.DATALAKE.USD_CONVERSION_RATE
)
select 
TIMESTAMP as transaction_date,
USER_ID,
ACTIVITY as transaction_type,
AMOUNT_NIS,
{{to_currency('AMOUNT_NIS','conversion.CONVERSION_RATE')}} as AMOUNT_USD,
PAYMENT_METHOD
from {{ source('DATALAKE', 'APP_EVENTS') }} as a
left join conversion on conversion.DATE = date(a.TIMESTAMP)
where lower(ACTIVITY) like '%purchased%'
and date(TIMESTAMP) >= dateadd(day,-5,date(getdate()))

