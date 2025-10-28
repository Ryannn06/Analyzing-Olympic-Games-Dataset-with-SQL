WITH athlete_region AS (
    SELECT *
    FROM athlete_event
    JOIN region
    ON athlete_event.noc = region.noc
), participant_cte AS (
    SELECT
        games, 
        season,
        COUNT(DISTINCT region) AS total_participants
    FROM athlete_region
    GROUP BY games, season
) 
SELECT 
    games,
    season,
    total_participants,
    SUM(total_participants) OVER(PARTITION BY season ORDER BY games ASC 
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_total_participants,
    COALESCE(ROUND(
        ((total_participants::numeric - LAG(total_participants) OVER(PARTITION BY season ORDER BY games)::numeric)
        / NULLIF(LAG(total_participants) OVER(PARTITION BY season ORDER BY games)::numeric,0))*100, 2
    ), 0) AS growth_rate_in_pct                      
FROM participant_cte
ORDER BY games;

-- Summer olympics had signifincantly more participants 
-- as compared with Winter olympics over the years