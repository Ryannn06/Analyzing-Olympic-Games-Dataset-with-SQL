SELECT 
    name, 
    team, 
    COUNT(medal) AS total_gold_medals,
    DENSE_RANK() OVER(ORDER BY COUNT(medal) DESC)
FROM athlete_event
WHERE medal = 'Gold'
GROUP BY name, team
ORDER BY total_gold_medals DESC
LIMIT 10;