/* Write your T-SQL query statement below */
select u.name, isnull(r.sum_distance,0) as travelled_distance from 
(
    select user_id, sum(distance) as sum_distance
    from rides
    group by user_id
) r right join users u
on u.id = r.user_id
order by r.sum_distance desc, u.name
