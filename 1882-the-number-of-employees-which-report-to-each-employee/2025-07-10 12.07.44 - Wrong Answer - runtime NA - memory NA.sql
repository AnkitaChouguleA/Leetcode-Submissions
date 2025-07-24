/* Write your T-SQL query statement below */
select e.reports_to employee_id , 
m.name as name,
count(e.employee_id) as reports_count ,
round(avg(e.age * 1.0),0) as average_age 
from Employees e
join Employees m
on e.reports_to = m.employee_id
group by e.reports_to , m.name
