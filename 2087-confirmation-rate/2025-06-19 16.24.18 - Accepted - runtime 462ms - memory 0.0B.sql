SELECT 
s.user_id, 
round(ISNULL(sum(case when action = 'confirmed' then 1 else null end)* 1.0 /count(action), 0),2)
as confirmation_rate
from Signups s left join Confirmations C
on s.user_id = C.user_id
group by s.user_id
order by user_id