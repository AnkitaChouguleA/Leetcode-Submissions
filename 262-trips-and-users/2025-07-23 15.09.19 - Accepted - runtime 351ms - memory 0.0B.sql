SELECT
    request_at as Day,
    ROUND(SUM(CASE WHEN status LIKE 'cancelled%' THEN 1 ELSE 0 END) * 1.0 / COUNT(*) * 1.0, 2) as 'Cancellation Rate'
FROM
    Trips t
JOIN Users uc
    ON t.client_id = uc.users_id
JOIN Users ud
    ON t.driver_id = ud.users_id
WHERE
    uc.banned = 'No'
    AND ud. banned = 'No'
    AND request_at BETWEEN '2013-01-01' AND '2013-10-03'
GROUP BY
    request_at
ORDER BY
    request_at

-- WITH cte_a AS (
--     -- Only include trips where both client and driver are not banned
--     SELECT * 
--     FROM Trips
--     WHERE client_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
--       AND driver_id NOT IN (SELECT users_id FROM Users WHERE banned = 'Yes')
-- ), 
-- cte_total_cnt AS (
--     -- Count total unbanned requests per day
--     SELECT request_at, COUNT(*) AS cnt_total_request
--     FROM cte_a 
--     GROUP BY request_at
-- ),
-- cte_cancelled_cnt AS (
--     -- Count unbanned cancelled requests per day
--     SELECT request_at, COUNT(*) AS cnt_cancelled
--     FROM cte_a
--     WHERE status IN ('cancelled_by_driver', 'cancelled_by_client')
--     GROUP BY request_at
-- )
-- SELECT 
--     t.request_at AS Day,
--     ROUND(1.0 * ISNULL(c.cnt_cancelled, 0) / t.cnt_total_request, 2) AS [Cancellation Rate]
-- FROM cte_total_cnt t LEFT JOIN cte_cancelled_cnt c 
-- ON t.request_at = c.request_at
-- WHERE t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
-- ORDER BY t.request_at;
