/* Write your T-SQL query statement below */
SELECT     e1.employee_id,     e1.name, 
    COUNT(e2.reports_to) AS reports_count, 
    FLOOR(AVG(1.0 * e2.age) + 0.5) AS average_age
FROM employees e1
JOIN employees e2 
    ON e1.employee_id = e2.reports_to
GROUP BY e1.employee_id, e1.name
ORDER BY e1.employee_id;

