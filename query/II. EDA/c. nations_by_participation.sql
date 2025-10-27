WITH region AS(
    SELECT reg.region, ath.games 
    FROM athlete_event ath
    JOIN region reg
    ON ath.noc = reg.noc
    GROUP BY reg.region, ath.games
)
SELECT region, COUNT(games) AS total_participated_games
FROM region
GROUP BY region
ORDER BY COUNT(games) DESC, region ASC;