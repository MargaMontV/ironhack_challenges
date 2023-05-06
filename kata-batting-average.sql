SELECT
yk.player_name AS "player_name",
yk.games AS "games",
CAST(ROUND((CAST(yk.hits AS decimal) / CAST(yk.at_bats AS decimal)), 3) AS text) AS "batting_average"
FROM
yankees AS yk
WHERE yk.at_bats >= 100
ORDER BY "batting_average" DESC;