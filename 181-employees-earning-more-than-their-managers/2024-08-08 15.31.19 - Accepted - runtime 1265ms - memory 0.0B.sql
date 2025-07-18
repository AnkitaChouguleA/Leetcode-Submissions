/* Write your T-SQL query statement below */
select e.name as Employee from Employee e
join Employee m
on e.managerid = m.id and e.salary > m.salary