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


-- Top user by rating count (lexicographically smaller in case of tie)
-- SELECT TOP 1 name AS results
-- FROM Users u
-- JOIN MovieRating mr ON u.user_id = mr.user_id
-- GROUP BY u.name
-- ORDER BY COUNT(*) DESC, u.name;

-- Top movie by average rating in Feb 2020 (lexicographically smaller in case of tie)
-- UNION ALL
-- SELECT TOP 1 m.title AS results
-- FROM Movies m
-- JOIN MovieRating mr ON m.movie_id = mr.movie_id
-- WHERE YEAR(mr.created_at) = 2020 AND MONTH(mr.created_at) = 2
-- GROUP BY m.title
-- ORDER BY AVG(CAST(mr.rating AS FLOAT)) DESC, m.title;
