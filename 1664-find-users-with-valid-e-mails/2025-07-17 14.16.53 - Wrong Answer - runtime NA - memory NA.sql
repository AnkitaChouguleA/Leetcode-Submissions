SELECT user_id, name, mail
FROM Users
WHERE 
    mail LIKE '%@leetcode.com' -- ends with @leetcode.com
    AND mail LIKE '[a-zA-Z0-9][a-zA-Z0-9._-]*@leetcode.com' -- valid local-part
    AND mail NOT LIKE '%[^a-zA-Z0-9._@-]%' -- no illegal characters
    AND mail NOT LIKE '[_.-]%@leetcode.com' -- cannot start with invalid character
    AND mail NOT LIKE '%..%@leetcode.com'  -- no consecutive dots
