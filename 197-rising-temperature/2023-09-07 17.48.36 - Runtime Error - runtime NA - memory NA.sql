/* Write your T-SQL query statement below */
/*select w1.id 
from weather w1
join weather w2
on datediff(dd,w1.recordDate,w2.recordDate) = 1
where w1.temperature > w2.temperature */
 
SELECT w1.id
FROM Weather w1
JOIN Weather w2 ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature