{{ 
    config(materialized='incremental',
    unique_key = 'date') 
}}

WITH daily_activity AS (
    -- DAU
    SELECT DISTINCT USER_ID, CAST(TIMESTAMP AS DATE) AS activity_date
    FROM {{ ref('dwh_fact_activity') }}
    WHERE LOWER(ACTIVITY_TYPE) = 'login'
    AND CAST(TIMESTAMP AS DATE) = DATEADD(DAY, -1, CURRENT_DATE)
),
monthly_activity AS (
    -- MAU
    SELECT DISTINCT USER_ID, CAST(TIMESTAMP AS DATE) AS activity_date
    FROM {{ ref('dwh_fact_activity') }}
    WHERE LOWER(ACTIVITY_TYPE) = 'login' 
    AND CAST(TIMESTAMP AS DATE) >= DATEADD(DAY, -30, CURRENT_DATE)
),
revenue AS (
    -- ARPU
    SELECT USER_ID, SUM(AMOUNT_USD) AS total_revenue
    FROM {{ ref('dwh_fact_revenue') }}
    WHERE TRANSACTION_DATE >= DATEADD(DAY, -30, CURRENT_DATE)
    GROUP BY USER_ID
),
churn AS (
    -- Churn Rate
    SELECT DISTINCT a.USER_ID
    FROM monthly_activity a
    LEFT JOIN monthly_activity b ON a.USER_ID = b.USER_ID AND b.activity_date = CURRENT_DATE
    WHERE a.activity_date < DATEADD(DAY, -30, CURRENT_DATE) AND b.activity_date IS NULL
)
SELECT 
    CURRENT_DATE AS date,
    -- DAU: Distinct users active today
    (SELECT COUNT(*) FROM daily_activity) AS dau,
    -- MAU: Distinct users active in the last 30 days
    (SELECT COUNT(*) FROM monthly_activity) AS mau,
    -- ARPU: Average revenue per user in the last 30 days
    COALESCE(AVG(r.total_revenue), 0) AS arpu,
    -- Churn Rate: Percentage of churned users
    COALESCE(COUNT(c.USER_ID) * 100.0 / (SELECT COUNT(*) FROM monthly_activity), 0) AS churn_rate
FROM revenue r
LEFT JOIN churn c ON r.USER_ID = c.USER_ID

{% if is_incremental() %}
where date >= (select max(date) from {{ this }})
{% endif %}
