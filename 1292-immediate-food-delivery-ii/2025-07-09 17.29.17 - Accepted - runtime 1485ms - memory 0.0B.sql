/* Write your T-SQL query statement below */
WITH cte AS (
    SELECT *, 
        CASE 
            WHEN order_date = customer_pref_delivery_date THEN 'immediate'
            ELSE 'scheduled' END AS schedule_type,
        ROW_NUMBER() OVER(PARTITION BY customer_id ORDER BY order_date) AS rn
    FROM Delivery
)
SELECT ROUND(100.0 * SUM(CASE WHEN schedule_type = 'immediate' THEN 1 ELSE 0 END)/ 
    COUNT(*), 2) AS immediate_percentage
FROM cte
WHERE rn = 1;
