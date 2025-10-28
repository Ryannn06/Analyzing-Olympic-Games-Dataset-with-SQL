WITH phl_boxing AS (
    SELECT 
        team,
        sport,
        games,
    COUNT(medal) AS total_no_of_medals
    FROM athlete_event ath
    JOIN region reg
    ON ath.noc = reg.noc
    WHERE reg.region = 'Philippines'
        AND ath.sport = 'Boxing'
    GROUP BY team, sport, games
    ORDER BY total_no_of_medals DESC
)
SELECT *
FROM phl_boxing
WHERE total_no_of_medals <> 0;