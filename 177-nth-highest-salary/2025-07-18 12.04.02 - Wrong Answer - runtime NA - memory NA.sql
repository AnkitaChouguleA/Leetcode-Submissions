CREATE FUNCTION getNthHighestSalary(@N INT) RETURNS INT AS
BEGIN
    RETURN (
        /* Write your T-SQL query statement below. */
        select top 1 salary from
        (select salary, 
        dense_rank() over(order by salary) as rn 
        from Employee ) as ranked_salary
        where rn = @n
    );
END

--select getNthHighestSalary(2)