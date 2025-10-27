SELECT games, COUNT(DISTINCT sport) AS total_no_of_sports
FROM athlete_event
GROUP BY games
ORDER BY total_no_of_sports DESC, games ASC;