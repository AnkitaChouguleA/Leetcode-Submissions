/* Write your T-SQL query statement below */
select top 1 id, count(*) as num from
(
select requester_id as id from RequestAccepted 
union all
select accepter_id as id from RequestAccepted
) as temp
group by id
order by 2 desc