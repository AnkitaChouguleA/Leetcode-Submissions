/* Write your T-SQL query statement below */
select stock_name, 
sum(case when operation = 'Sell' then price
    when operation = 'Buy' then -price
    end 
    ) as capital_gain_loss 
from stocks 
group by stock_name   
order by 2 desc