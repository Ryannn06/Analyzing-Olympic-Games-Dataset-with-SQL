WITH distinct_games(distinct_games) AS (
    SELECT DISTINCT games
    FROM athlete_event
)
SELECT *
FROM distinct_games
ORDER BY distinct_games ASC;

-- Result: There are 51 games in total