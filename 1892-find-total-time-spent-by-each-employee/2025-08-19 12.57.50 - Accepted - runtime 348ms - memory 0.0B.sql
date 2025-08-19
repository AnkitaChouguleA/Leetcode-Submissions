/* Write your T-SQL query statement below */
/*
with cte_total as
(
    select emp_id, event_day, sum(in_time) tit, sum(out_time) tot
    from employees
    group by emp_id,event_day
)
select event_day as [day], emp_id, tot - tit as total_time
from cte_total
*/

select event_day as day, emp_id, sum(out_time-in_time) as total_time
from employees
group by event_day, emp_id
