SELECT *
FROM athlete_event
WHERE age = (SELECT MAX(age) 
             FROM athlete_event
             WHERE medal = 'Gold')
    AND medal = 'Gold';