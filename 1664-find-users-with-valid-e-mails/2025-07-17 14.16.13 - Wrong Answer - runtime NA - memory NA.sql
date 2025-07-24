/* Write your T-SQL query statement below */
SELECT user_id, name, mail
FROM Users
WHERE mail LIKE '%@leetcode.com'
  AND mail LIKE '[a-zA-Z]%'  -- prefix starts with a letter
  AND mail NOT LIKE '%[^a-zA-Z0-9._@-]%' -- disallow invalid characters



