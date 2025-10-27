WITH sport_games AS (
    -- count sports with total plays
    SELECT sport, COUNT(DISTINCT games) AS total_played_games
    FROM athlete_event
    GROUP BY sport
), filter_sport AS (
    SELECT sp.sport, sp.total_played_games, ae.games
    FROM sport_games sp
    JOIN athlete_event ae
    ON sp.sport = ae.sport
    WHERE total_played_games = 1
    GROUP BY sp.sport, sp.total_played_games, ae.games
)
SELECT sport, games, total_played_games
FROM filter_sport
ORDER BY sport ASC;



