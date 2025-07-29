/* Write your T-SQL query statement below */
select user_id, name, mail  
from Users 
where mail like '%@leetcode.com' 
and mail not like '%#%'
and mail not like '.%'