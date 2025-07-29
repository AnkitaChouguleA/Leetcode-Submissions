/* Write your T-SQL query statement below */
select activity_date as [day], 
count(distinct session_id) as active_users 
from activity
where activity_date between dateadd(day,-29,'2019-07-27') and '2019-07-27'
group by activity_date
order by 1