/* Write your T-SQL query statement below */
select * from Employee e1 where salary > (select salary from Emplpoyee where id = e1.managerId)