/* Write your T-SQL query statement below */
select customer_id
from Customer c
group by customer_id
having count(distinct c.product_key) = 
(select count(distinct product_key) from product)