/* Write your T-SQL query statement below */
select v.customer_id, count(v.visit_id )  count_no_trans
from visits v full join transactions t
on v.visit_id = t.visit_id
where t.transaction_id  is null
group by v.customer_id
order by count_no_trans