/* Write your T-SQL query statement below */
WITH cte_rating_cnt AS (
    SELECT 
        u.user_id, 
        u.name, 
        COUNT(mr.rating) AS rating_cnt
    FROM users u
    LEFT JOIN movierating mr ON u.user_id = mr.user_id 
    GROUP BY u.user_id, u.name
),
user_rated_greatest_number AS (
    SELECT TOP 1 name 
    FROM cte_rating_cnt
    ORDER BY rating_cnt DESC, name
),
cte_movie_rating AS (
    SELECT 
        m.title, 
        AVG(CAST(mr.rating AS FLOAT)) AS avg_rating
    FROM MovieRating mr 
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
    GROUP BY m.title
),
highest_rated_movie AS (
    SELECT TOP 1 title 
    FROM cte_movie_rating
    ORDER BY avg_rating DESC, title
)
-- Final result
SELECT name AS results FROM user_rated_greatest_number
UNION ALL
SELECT title FROM highest_rated_movie;
