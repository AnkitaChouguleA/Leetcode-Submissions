WITH cte_daily AS (
    SELECT 
        visited_on, 
        SUM(amount) AS daily_total
    FROM customer
    GROUP BY visited_on
),
cte_moving_avg AS (
    SELECT 
        visited_on,
        SUM(daily_total) OVER (
            ORDER BY visited_on 
            ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
        ) AS amount,
        CAST(
            AVG(daily_total * 1.0) OVER (
                ORDER BY visited_on 
                ROWS BETWEEN 6 PRECEDING AND CURRENT ROW
            ) AS DECIMAL(5,2)
        ) AS average_amount
    FROM cte_daily
)
SELECT *
FROM cte_moving_avg
WHERE visited_on >= (
    SELECT DATEADD(DAY, 6, MIN(visited_on)) 
    FROM cte_daily
)
ORDER BY visited_on;
