SELECT user_id, email
FROM Users
WHERE email LIKE '%@%.com'
  AND LEN(email) - LEN(REPLACE(email, '@', '')) = 1
  AND LEFT(email, CHARINDEX('@', email) - 1) NOT LIKE '%[^a-zA-Z0-9_]%'
  AND SUBSTRING(
        email,
        CHARINDEX('@', email) + 1,
        LEN(email) - CHARINDEX('@', email) - 4
      ) NOT LIKE '%[^a-zA-Z]%'
ORDER BY user_id ASC;