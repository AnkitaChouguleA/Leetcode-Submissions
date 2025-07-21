/* Write your T-SQL query statement below */
with cte_highest_salary_rank
as (
select d.name as Department , e.name Employee , e.Salary ,
    dense_rank() over(partition by d.name order by e.salary desc) as rn
from Employee e join Department d on e.departmentId = d.id
)
select Department, Employee, salary
from cte_highest_salary_rank
where rn=1
