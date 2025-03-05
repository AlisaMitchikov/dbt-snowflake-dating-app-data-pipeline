{% snapshot dwh_dim_customers_snapshot %}

{{
  config(
    target_schema='DWH',
    unique_key='user_id',
    strategy='check',
    check_cols=[   
                "USER_ID",
                "ACCOUNT_CREATION_DATE",
                "AGE",
                "CITY_ID",
                "FIRST_NAME",
                "GENDER_ID",
                "IS_PREMIUM",
                "LAST_NAME",
                "LAST_ONLINE",
                "LOOKING_FOR_GENDER_GENDER_ID",
                "MATCHES",
                "MESSAGES_SENT",
                "MIDDLE_NAME",
                "RELATIONSHIP_STATUS",
]
  )
}}

SELECT * 
FROM {{ ref('dwh_dim_customers') }}

{% endsnapshot %}



