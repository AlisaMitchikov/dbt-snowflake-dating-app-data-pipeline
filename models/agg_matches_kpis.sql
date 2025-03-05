{{ 
    config(materialized='incremental',
    unique_key = 'date') 
}}

WITH activity_data AS (
    -- (swipes, likes, messages) for the previous day
    SELECT 
        DATE(TIMESTAMP) AS activity_date,
        COUNT(CASE WHEN LOWER(ACTIVITY_TYPE) = 'swipe' THEN 1 END) AS total_swipes,
        COUNT(CASE WHEN LOWER(ACTIVITY_TYPE) = 'like' THEN 1 END) AS total_likes,
        COUNT(CASE WHEN LOWER(ACTIVITY_TYPE) = 'message sent' THEN 1 END) AS total_messages
    FROM {{ ref('dwh_fact_activity') }}
    WHERE CAST(TIMESTAMP AS DATE) = DATEADD(DAY, -1, CURRENT_DATE)
    GROUP BY DATE(TIMESTAMP)
),
match_data AS (
    -- matches for the previous day
    SELECT 
        DATE(MATCH_DATE) AS match_date,
        COUNT(1) AS total_matches
    FROM {{ ref('dwh_fact_matches') }}
    WHERE CAST(MATCH_DATE AS DATE) = DATEADD(DAY, -1, CURRENT_DATE)
    GROUP BY DATE(MATCH_DATE)
)
SELECT 
    CURRENT_DATE AS date,
    -- Total swipes
    COALESCE(ad.total_swipes, 0) AS total_swipes,
    -- Total likes
    COALESCE(ad.total_likes, 0) AS total_likes,
    -- Total matches
    COALESCE(md.total_matches, 0) AS total_matches,
    -- Total messages
    COALESCE(ad.total_messages, 0) AS total_messages,
    -- Like rate: Likes per swipe
    CASE 
        WHEN ad.total_swipes > 0 THEN COALESCE(ad.total_likes * 100.0 / ad.total_swipes, 0)
        ELSE 0 
    END AS like_rate,
    -- Match rate: Matches per like
    CASE 
        WHEN ad.total_likes > 0 THEN COALESCE(md.total_matches * 100.0 / ad.total_likes, 0)
        ELSE 0 
    END AS match_rate
FROM activity_data ad
LEFT JOIN match_data md ON ad.activity_date = md.match_date

{% if is_incremental() %}
where date >= (select max(date) from {{ this }})
{% endif %}
