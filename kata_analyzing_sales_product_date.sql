SELECT 
pd.name AS "product_name",
EXTRACT(YEAR FROM ss.date) AS "year",
EXTRACT(MONTH FROM ss.date) AS "month",
EXTRACT(DAY FROM ss.date) AS "day",
SUM(sd.count * pd.price) AS "total"
FROM 
products AS pd
INNER JOIN sales_details AS sd ON sd.product_id = pd.id
INNER JOIN sales AS ss ON ss.id = sd.sale_id
GROUP BY 1,
ROLLUP(2, 3, 4)
ORDER BY 1;      