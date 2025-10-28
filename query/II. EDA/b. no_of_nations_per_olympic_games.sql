WITH region_games AS (
    SELECT ath.games, reg.region
    FROM athlete_event ath
    JOIN region reg
    ON ath.noc = reg.noc
    GROUP BY ath.games, reg.region -- group by games, region
)
SELECT games, COUNT(*) AS total_participants
FROM region_games
GROUP BY games
ORDER BY games;