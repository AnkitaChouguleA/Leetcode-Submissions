/* Write your T-SQL query statement below */
-- Get top 3 highest paid employees per department
WITH cte_ranked AS (
    SELECT 
        d.name AS Department, 
        e.name AS Employee,
        e.salary,
        DENSE_RANK() OVER (
            PARTITION BY e.departmentId 
            ORDER BY e.salary DESC
        ) AS rn
    FROM Employee e JOIN Department d ON e.departmentId = d.id
)
SELECT Department, Employee, salary
FROM cte_ranked
WHERE rn <= 3;
