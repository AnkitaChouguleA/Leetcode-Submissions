/* Write your T-SQL query statement below */
select e.name , b.bonus
from Employee e full outer join bonus b
on e.empid = b.empid
where b.bonus < 1000 or bonus is null

