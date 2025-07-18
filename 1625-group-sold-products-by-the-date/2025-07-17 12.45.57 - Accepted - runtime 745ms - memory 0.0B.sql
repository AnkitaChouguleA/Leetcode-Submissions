/* Write your T-SQL query statement below */
select dp.sell_date, count(dp.product) as num_sold ,
string_agg(dp.product,',') WITHIN GROUP (ORDER BY Product) AS Products
from 
(
    select distinct sell_date , product from Activities 
) dp
group by sell_date

