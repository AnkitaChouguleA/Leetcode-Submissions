/* Write your T-SQL query statement below */
select id,
case when p_id is null then 'Root' 
     when exists(select 1 from tree b where b.p_id = a.id) then 'Inner'
     -- checks if id is present in p_id as parent.
     else 'Leaf'
end as 'type' 
from tree a