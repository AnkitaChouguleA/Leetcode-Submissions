WITH helper AS
(
    SELECT 
        E.name Employee, 
        E.salary Salary,
        D.name Department,
        DENSE_RANK() OVER (PARTITION BY D.id ORDER BY salary DESC) rank
    FROM Employee E JOIN Department D
    ON D.id = E.departmentId
)
SELECT 
    Employee, 
    Salary,
    Department
FROM helper
WHERE rank < 4;
