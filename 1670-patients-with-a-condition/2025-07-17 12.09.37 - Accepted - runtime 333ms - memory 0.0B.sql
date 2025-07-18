/* Write your T-SQL query statement below */
SELECT *
FROM Patients
WHERE 
    conditions LIKE 'DIAB1%'             -- at the start
    OR conditions LIKE 'DIAB1 %'         -- starts with and followed by space
    OR conditions LIKE '% DIAB1%'        -- appears in middle
    OR conditions LIKE '% DIAB1'         -- appears at end

