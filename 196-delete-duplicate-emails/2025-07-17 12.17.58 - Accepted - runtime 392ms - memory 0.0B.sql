/* Write your T-SQL query statement below */
with cte_ranked as
(select id, email , row_number() over(partition by email order by id) as rn
from Person),
duplicate_id as(
    select id from cte_ranked where rn > 1
)
delete from person 
where id in (select id from duplicate_id)