CREATE EXTENSION IF NOT EXISTS tablefunc;
SELECT 
    * ,
    COALESCE("Gold", 0) + COALESCE("Silver", 0) + COALESCE("Bronze", 0) AS total_medals
FROM CROSSTAB($$
    WITH medal_region AS (
        SELECT reg.region, ath.medal
        FROM region reg
        JOIN athlete_event ath
        ON reg.noc = ath.noc
    )
    SELECT 
        region AS country,
        medal,
        COUNT(medal) as total_medal
    FROM medal_region
    WHERE medal IS NOT NULL
    GROUP BY region, medal
    $$, 
    $$ VALUES ('Gold'), ('Silver'), ('Bronze') $$
) AS ct (Country VARCHAR,
           "Gold" INT,
           "Silver" INT,
           "Bronze" INT)
ORDER BY total_medals DESC;

