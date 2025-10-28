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
    ORDER BY games
) 
SELECT 
    games,
    season,
    total_participants,
    SUM(total_participants) OVER(PARTITION BY season ORDER BY games ASC 
                                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS rolling_total_participants
FROM participant_cte;

-- Summer olympics had more participants 
-- as compared with Winter olympics over the years