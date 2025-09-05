/* Write your T-SQL query statement below */
select employee_id from Employees where employee_id not in (select employee_id from salaries)
union
select employee_id from salaries where employee_id not in (select employee_id from Employees)