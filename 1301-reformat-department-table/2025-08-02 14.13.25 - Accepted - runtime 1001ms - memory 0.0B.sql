/* Write your T-SQL query statement below */
-- SELECT ID,
-- sum(case when month = 'Jan' then revenue end) Jan_Revenue,
-- sum(case when month = 'Feb' then revenue end) Feb_Revenue,
-- sum(case when month = 'Mar' then revenue end) Mar_Revenue,-- "Mar",
-- sum(case when month = 'Apr' then revenue end) Apr_Revenue,-- "Apr",
-- sum(case when month = 'May' then revenue end) May_Revenue,-- "May",
-- sum(case when month = 'Jun' then revenue end) Jun_Revenue,-- "Jun",
-- sum(case when month = 'Jul' then revenue end) Jul_Revenue,-- "Jul",
-- sum(case when month = 'Aug' then revenue end) Aug_Revenue,-- "Aug",
-- sum(case when month = 'Sep' then revenue end) Sep_Revenue,-- "Sep",
-- sum(case when month = 'Oct' then revenue end) Oct_Revenue,-- "Oct",
-- sum(case when month = 'Nov' then revenue end) Nov_Revenue,-- "Nov",
-- sum(case when month = 'Dec' then revenue end) Dec_Revenue-- "Dec"]
-- from Department 
-- group by id
-- order by 1

--using pivot
select  id,
    [Jan] AS Jan_Revenue,
    [Feb] AS Feb_Revenue,
    [Mar] AS Mar_Revenue,
    [Apr] AS Apr_Revenue,
    [May] AS May_Revenue,
    [Jun] AS Jun_Revenue,
    [Jul] AS Jul_Revenue,
    [Aug] AS Aug_Revenue,
    [Sep] AS Sep_Revenue,
    [Oct] AS Oct_Revenue,
    [Nov] AS Nov_Revenue,
    [Dec] AS Dec_Revenue
from
(
    select id,revenue,month from Department 
) as st
pivot
(
    sum(revenue) for month in
    ([Jan],[Feb],[Mar],[Apr], [May], [Jun],[Jul], [Aug], [Sep], [Oct], [Nov],[Dec])
) as pt