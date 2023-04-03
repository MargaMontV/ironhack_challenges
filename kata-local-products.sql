SELECT
pd.country AS "country",
COUNT(pd.id) AS "products"
FROM
products AS pd
WHERE pd.country IN ('United States of America', 'Canada')
GROUP BY pd.country
ORDER BY COUNT(pd.id) DESC; 