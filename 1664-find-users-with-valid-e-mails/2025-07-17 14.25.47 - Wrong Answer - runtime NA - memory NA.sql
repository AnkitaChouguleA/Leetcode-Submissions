SELECT user_id, name, mail
FROM Users
WHERE 
    mail LIKE '%@leetcode.com' AND
    mail LIKE '[a-zA-Z0-9][a-zA-Z0-9._-]*@leetcode.com' AND
    mail NOT LIKE '%[^a-zA-Z0-9._@-]%' AND
    mail NOT LIKE '[_-]%@leetcode.com'
