/* Write your T-SQL query statement below */
with consecutive_num as
(
select num,
lead(num,1,0) over(order by id) as num1,
lead(num,2,0) over(order by id) as num2
from logs
),
num_cnt as
(
    select num,
    case when num=num1 and num=num2 then 1 else 0
    end as is_consecutive_three
    from consecutive_num
)
select distinct num ConsecutiveNums  from num_cnt
where is_consecutive_three = 1