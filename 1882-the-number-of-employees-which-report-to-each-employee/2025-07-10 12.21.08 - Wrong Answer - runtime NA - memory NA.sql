/* Write your T-SQL query statement below */
SELECT 
    e.reports_to AS employee_id,
    m.name,
    COUNT(*) AS reports_count,
    ROUND(AVG(e.age * 1.0), 0) AS average_age
FROM Employees e
JOIN Employees m 
    ON e.reports_to = m.employee_id
WHERE e.reports_to IS NOT NULL
GROUP BY e.reports_to, m.name

