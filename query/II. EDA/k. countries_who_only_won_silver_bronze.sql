CREATE EXTENSION IF NOT EXISTS tablefunc;

SELECT 
    country,
    COALESCE(gold, 0) AS gold,
    COALESCE(silver, 0) AS silver,
    COALESCE(bronze, 0) AS bronze,
    COALESCE(gold, 0) + COALESCE(silver, 0) + COALESCE(bronze, 0) AS total_no_of_medals
FROM Crosstab($$
    SELECT 
        reg.region AS country,
        ath.medal,
        COUNT(ath.medal)
    FROM athlete_event ath
    LEFT JOIN region reg
    ON reg.noc = ath.noc
    WHERE medal IN ('Silver', 'Bronze')
        AND reg.region NOT IN (
            SELECT DISTINCT reg2.region
            FROM athlete_event ath2
            JOIN region reg2
            ON ath2.noc = reg2.noc
            WHERE medal = 'Gold'
            GROUP BY reg2.region
        )
    GROUP BY reg.region, ath.medal
    $$,
    $$ VALUES ('Gold'), ('Silver'),('Bronze')$$
) AS ct(
    Country VARCHAR,
    Gold INT,
    Silver INT,
    Bronze INT
)
ORDER BY total_no_of_medals DESC;