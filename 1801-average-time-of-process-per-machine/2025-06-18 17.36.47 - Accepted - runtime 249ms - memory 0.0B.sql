/* Write your T-SQL query statement below */
select a.machine_id,round(avg(b.timestamp - a.timestamp ),3 ) processing_time
from Activity a
join Activity b
on a.machine_id = b.machine_id
and a.process_id = b.process_id 
and a.activity_type = 'start' 
and b.activity_type  = 'end'
group by a.machine_id