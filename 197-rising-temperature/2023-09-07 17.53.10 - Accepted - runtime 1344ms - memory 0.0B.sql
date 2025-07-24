/* Write your T-SQL query statement below */
select w1.id as ID
from weather w1,weather w2
where w1.temperature > w2.temperature 
and datediff(day,w2.recordDate,w1.recordDate) = 1
 