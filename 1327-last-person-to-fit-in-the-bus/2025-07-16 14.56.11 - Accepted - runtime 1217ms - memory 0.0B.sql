/* Write your T-SQL query statement below */
with cte as
(
select turn, person_id, person_name , weight,
sum(weight) over(order by turn) as total_weight
from Queue
),
ordered_cte as
(select person_name, total_weight from cte
where total_weight <= 1000)
select top 1 person_name 
from ordered_cte
order by total_weight desc