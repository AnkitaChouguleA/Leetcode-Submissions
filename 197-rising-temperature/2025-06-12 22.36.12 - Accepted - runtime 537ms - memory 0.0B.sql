/* Write your T-SQL query statement below */
SELECT today.id
FROM Weather yesterday
CROSS JOIN Weather today
WHERE DATEDIFF(DAY, yesterday.recordDate, today.recordDate) = 1
    AND today.temperature > yesterday.temperature
;

/*
select pr.id from
(
select id, temperature, lag(temperature) over(order by recordDate) as prev_temp
) as pr
where pr.temperature > pr.prev_temp
*/