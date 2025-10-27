-- add helper column
ALTER TABLE athlete_event ADD COLUMN row_number integer;

-- row_number over duplicates
WITH duplicate AS (
    SELECT 
        ctid,
        ROW_NUMBER() OVER(
            PARTITION BY id, name, sex, age, height, weight, team,
                         noc, games, year, season, city, sport, event, medal
        ) AS rn
    FROM athlete_event
)

-- update athelete_event row_number column from duplicate cte's result
UPDATE athlete_event
SET row_number = duplicate.rn
FROM duplicate
WHERE athlete_event.ctid = duplicate.ctid;

-- scan duplicate rows
SELECT * FROM athlete_event
WHERE row_number >= 2;

SELECT * FROM athlete_event
WHERE name = 'Lecointre';

-- delete duplicate rows;
DELETE 
FROM athlete_event
WHERE row_number >= 2;

-- remove helper column
ALTER TABLE athlete_event
DROP COLUMN row_number;

SELECT * FROM athlete_event;