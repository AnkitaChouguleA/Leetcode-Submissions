/* Write your T-SQL query statement below */
Select email from person group by email having count(*) > 1