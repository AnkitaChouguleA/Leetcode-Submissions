SELECT
    user_id,
    name,
    mail
FROM
    Users
WHERE
    -- 1. Ensure the email ends exactly with '@leetcode.com' (case-sensitive)
    mail COLLATE Latin1_General_CS_AS LIKE '%@leetcode.com'
    AND
    -- 2. Ensure the '@' symbol is only present once and is correctly positioned
    -- This checks if the character at the position (Length of mail - Length of '@leetcode.com') is '@'
    -- and implicitly ensures there are no other '@' symbols before it in the prefix.
    SUBSTRING(mail, LEN(mail) - LEN('@leetcode.com') + 1, 1) = '@'
    AND
    -- 3. Ensure the prefix (part before '@') starts with a letter.
    -- We take the first character of the entire mail string, as it must be part of the prefix.
    mail LIKE '[a-zA-Z]%'
    AND
    -- 4. Ensure no invalid characters exist in the prefix.
    -- The prefix is extracted from the beginning of the string up to the character before '@leetcode.com'.
    PATINDEX('%[^a-zA-Z0-9_.-]%', SUBSTRING(mail, 1, LEN(mail) - LEN('@leetcode.com'))) = 0;