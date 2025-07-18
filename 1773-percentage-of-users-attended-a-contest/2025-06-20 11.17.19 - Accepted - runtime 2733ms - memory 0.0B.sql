/* Write your T-SQL query statement below */
select 
r.contest_id , 
round(count( r.contest_id) * 100/(select count(user_id) * 1.0 from Users),2) as percentage 
from Register r join Users u 
on r.user_id=u.user_id 
group by contest_id 
order by percentage desc , contest_id asc