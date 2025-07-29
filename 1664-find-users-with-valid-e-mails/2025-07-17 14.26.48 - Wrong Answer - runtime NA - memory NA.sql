SELECT    user_id,    name,    mail
FROM    Users
WHERE
    -- Ensure the domain is exactly '@leetcode.com'
    mail LIKE '%@leetcode.com'
    AND
    -- Ensure the mail starts with a letter (A-Z or a-z)
    mail LIKE '[a-zA-Z]%'
    AND
    -- Ensure no invalid characters exist in the prefix before '@'
    -- PATINDEX returns 0 if no match is found, meaning no invalid characters
    PATINDEX('%[^a-zA-Z0-9_.-]%', SUBSTRING(mail, 1, CHARINDEX('@', mail) - 1)) = 0;
