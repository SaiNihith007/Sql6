
WITH CTE AS (
    SELECT customer_id, YEAR(order_date) AS 'year', SUM(price) AS price_m
    FROM Orders GROUP BY year,customer_id
    ORDER BY customer_id
)

-- SELECT * FROM CTE

SELECT c1.customer_id FROM CTE c1
LEFT JOIN
CTE c2
ON (c1.customer_id = c2.customer_id) AND (c1.year +1 = c2.year) AND (c1.price_m < c2.price_m)
GROUP BY c1.customer_id HAVING COUNT(*) - COUNT(c2.customer_id) =1