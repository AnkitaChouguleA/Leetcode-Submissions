/* Write your T-SQL query statement below */
WITH firstLogin AS (
    SELECT player_id, MIN(event_date) AS first_login
    FROM activity
    GROUP BY player_id
),
nextDayLogin AS (
    SELECT a.player_id
    FROM activity a
    JOIN firstLogin f
      ON a.player_id = f.player_id
     AND a.event_date = DATEADD(day, 1, f.first_login)
)
SELECT 
    ROUND(CAST(COUNT(DISTINCT n.player_id) AS FLOAT) / COUNT(DISTINCT f.player_id), 2) AS fraction
FROM firstLogin f
LEFT JOIN nextDayLogin n
    ON f.player_id = n.player_id;
