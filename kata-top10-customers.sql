SELECT 
cu.customer_id AS "customer_id",
cu.email AS "email",
COUNT(pa.payment_id) AS "payments_count",
CAST(SUM(pa.amount) AS float) AS "total_amount"
FROM
customer AS cu
INNER JOIN payment AS pa ON cu.customer_id = pa.customer_id
GROUP BY cu.customer_id
ORDER BY CAST(SUM(pa.amount) AS float) DESC
LIMIT 10