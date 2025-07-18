/* Write your T-SQL query statement below */
select user_id, name, mail  
from Users 
WHERE mail LIKE '[a-zA-Z]%'      -- starts with a letter
  AND mail LIKE '%@leetcode.com' -- ends with @leetcode.com
  AND mail NOT LIKE '%#%'        -- does not contain #
