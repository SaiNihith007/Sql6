
SELECT player_id, event_date, SUM(games_played) OVER(PARTITION BY player_id ORDER BY event_date) AS games_played_so_far
FROM Activity 

-- SELECT a1.player_id, a1.event_date, (SELECT SUM(a2.games_played) FROM Activity a2 WHERE 
-- a1.player_id = a2.player_id AND a1.event_date >= a2.event_date) AS games_played_so_far

-- FROM Activity a1
