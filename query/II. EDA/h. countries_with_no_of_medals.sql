WITH medal_region AS (
    SELECT reg.region, ath.medal
    FROM region reg
    JOIN athlete_event ath
    ON reg.noc = ath.noc
)
SELECT 
    region AS country,
    COUNT(medal) as total_no_of_medals,
    DENSE_RANK() OVER(ORDER BY COUNT(medal) DESC) AS rank
FROM medal_region
GROUP BY region
ORDER BY total_no_of_medals DESC;