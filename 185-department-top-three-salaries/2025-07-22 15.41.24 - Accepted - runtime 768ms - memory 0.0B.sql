/* Write your T-SQL query statement below */
with cte_ranked as
(
select *, dense_rank() over(partition by e.departmentId order by e.salary desc) as rn
from Employee e 
)
select d.name as Department , e.name as Employee , e.salary
from cte_ranked e
join Department d on e.departmentId = d.id 
where rn <= 3