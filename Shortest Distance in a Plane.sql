
-- WITH CTE AS (
--     SELECT p1.x AS x1, p1.y AS y1 ,p2.x AS x2, p2.y AS y2, ROUND(SQRT( POW(p2.x-p1.x,2) + POW(p2.y-p1.y,2) ),2) AS 'dist'
--     FROM Point2D p1
--     CROSS JOIN
--     Point2D p2
-- )


-- SELECT MIN(dist) AS shortest
-- FROM CTE
-- WHERE x1!=x2 OR y1!=y2

SELECT MIN(ROUND(SQRT(POW(p2.x - p1.x , 2) + POW(p2.y - p1.y, 2)),2)) AS 'shortest' 
FROM point2D p1 
INNER JOIN point2D p2 
ON 
    (p1.x <= p2.x AND p1.y < p2.y) OR
    (p1.x <= p2.x AND p1.y > p2.y) OR
    (p1.x > p2.x AND p1.y = p2.y);
