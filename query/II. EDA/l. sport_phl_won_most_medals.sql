SELECT 
    sport,
    COUNT(medal) AS total_no_of_medals
FROM athlete_event ath
JOIN region reg
ON ath.noc = reg.noc
WHERE reg.region = 'Philippines'
GROUP BY sport 
ORDER BY total_no_of_medals DESC
LIMIT 1;