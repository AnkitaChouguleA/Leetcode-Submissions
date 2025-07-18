/* Write your T-SQL query statement below */
select customer_id
from Customer c
join Product p
on c.product_key  = p.product_key 
group by customer_id
having count(distinct c.product_key) = 2