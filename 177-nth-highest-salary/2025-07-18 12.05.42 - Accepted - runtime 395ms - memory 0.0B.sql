Create Function getNthHighestSalary(@n int)
returns int 
as
BEGIN 
    Return ( 
        Select top(1) Salary 
    from (
        Select Salary, DENSE_RANK() OVER (order by salary DESC) as D_Rank 
        from Employee 
    ) e
    where D_Rank = @n
    )
end