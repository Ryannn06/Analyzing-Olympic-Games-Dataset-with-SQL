-- null values for region table
SELECT *
FROM region
WHERE noc IS NULL
    OR region = 'NA';

-- update null regions with note column
UPDATE region
SET region = note
WHERE region = 'NA';

SELECT *
FROM athlete_event
WHERE ID IS NULL
    OR name IS NULL
    OR team IS NULL
	OR noc IS NULL
	OR games IS NULL
	OR year IS NULL
	OR season IS NULL
	OR sport IS NULL
	OR event IS NULL;
-- no null values for these key columns in athlete_event table