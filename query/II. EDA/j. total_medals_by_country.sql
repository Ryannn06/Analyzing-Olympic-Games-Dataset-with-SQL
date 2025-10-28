WITH athlete_region AS (
    SELECT ath.*, reg.region
    FROM athlete_event ath
    LEFT JOIN region reg
    ON ath.noc = reg.noc
)
SELECT 
    COALESCE(region, 'Grand Total') AS country, 
    COALESCE(medal, 'Total Medals') AS medal, 
    COUNT(*) AS totaL_no_of_medals
FROM athlete_region
WHERE medal IS NOT NULL
GROUP BY CUBE(region, medal)
ORDER BY athlete_region.region, medal, total_no_of_medals;