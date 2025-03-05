WITH customers AS (
                        select 
                        USER_ID,
                        FIRST_NAME,
                        MIDDLE_NAME,
                        LAST_NAME,
                        DATEDIFF(YEAR, BIRTH_DATE, CURRENT_DATE) AS AGE,
                        GENDER_ID,
                        CITY_ID,
                        RELATIONSHIP_STATUS,
                        LOOKING_FOR_GENDER_GENDER_ID,
                        LOOKING_FOR_KIND_OF_RELATIONSHIP
            from {{ source('DATALAKE', 'CUSTOMERS') }}
),
activity AS (
                SELECT 
                    USER_ID,
                    COUNT(case when lower(ACTIVITY_TYPE) = 'message sent' then 1 end) AS messages_sent,
                    MAX(case when lower(ACTIVITY_TYPE) = 'login' then TIMESTAMP end) AS last_online,
                    MAX(case when lower(ACTIVITY_TYPE) = 'account created' then TIMESTAMP end) AS account_creation_date,
                    CASE 
                        WHEN COUNT(CASE WHEN lower(ACTIVITY_TYPE) = 'subscription purchased' THEN 1 END) > 0 THEN 1 
                        ELSE 0 
                    END AS is_premium   
                FROM {{ source('DWH', 'DWH_FACT_ACTIVITY') }}
                GROUP BY USER_ID
),
matches AS (
                SELECT 
                    USER1_ID AS USER_ID, 
                    COUNT(*) AS matches
                FROM {{ source('DWH', 'DWH_FACT_MATCHES') }}
                GROUP BY USER1_ID
                UNION ALL
                SELECT 
                    USER2_ID AS USER_ID, 
                    COUNT(*) AS matches
                FROM {{ source('DWH', 'DWH_FACT_MATCHES') }}
                GROUP BY USER2_ID
)
SELECT
c.USER_ID,
FIRST_NAME,
MIDDLE_NAME,
LAST_NAME,
AGE,
GENDER_ID,
CITY_ID,
RELATIONSHIP_STATUS,
LOOKING_FOR_GENDER_GENDER_ID,
LOOKING_FOR_KIND_OF_RELATIONSHIP
messages_sent,
last_online,
account_creation_date,
is_premium,
matches
FROM customers c
LEFT JOIN activity a ON a.USER_ID = c.USER_ID
LEFT JOIN matches m ON m.USER_ID = a.USER_ID




