# Write your MySQL query statement below
-- SELECT DISTINCT player_id, FIRST_VALUE(device_id) OVER (PARTITION BY player_id  ORDER BY event_date) AS device_id FROM
-- Activity
-- method2
-- SELECT a.player_id, a.device_id
-- FROM Activity a
-- WHERE a.event_date IN (SELECT MIN(b.event_date) FROM 
-- Activity b WHERE a.player_id = b.player_id)

WITH CTE AS(
    SELECT player_id, device_id, RANK() OVER(PARTITION BY player_id ORDER BY event_date) AS 'rnk'
    FROM Activity
)

SELECT c.player_id , c.device_id FROM CTE c
WHERE c.rnk = '1'



    

