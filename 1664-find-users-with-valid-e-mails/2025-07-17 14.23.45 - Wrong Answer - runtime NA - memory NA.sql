SELECT user_id, name, mail
FROM Users
WHERE 
    mail LIKE '%@leetcode.com' -- ends with @leetcode.com
    AND mail LIKE '[a-zA-Z0-9]%@leetcode.com' -- local-part starts with letter or digit
    AND mail NOT LIKE '%..%@leetcode.com' -- no consecutive dots
    AND mail NOT LIKE '[._%-]%@leetcode.com' -- local-part doesn't start with special char
    AND mail NOT LIKE '%[^a-zA-Z0-9._@-]%' -- no illegal characters
