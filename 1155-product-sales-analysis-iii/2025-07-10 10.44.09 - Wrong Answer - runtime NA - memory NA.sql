/* Write your T-SQL query statement below */
with cte as
(
select product_id, [year],
dense_rank() over(partition by product_id order by year) as rn,
quantity , price
from sales
)
select 
product_id, [year] first_year, 
sum(quantity) quantity, 
sum( price ) price
from cte
where rn = 1
group by product_id, year