/* Write your T-SQL query statement below */
with cte_rating_cnt as
(
select u.user_id, u.name , count(rating) as rating_cnt,
row_number() over(order by count(rating) desc) as rn
from users u
left join movierating m
on u.user_id = m.user_id 
group by u.user_id, name
),
user_rated_greatest_number as
(
select top 1 name from cte_rating_cnt
order by rating_cnt desc, name
),
cte_movie_rating as
(
select top 1 m.movie_id, m.title, avg(mr.rating) as avg_ratings
from MovieRating mr left join Movies m on mr.movie_id = m.movie_id
group by m.movie_id,title
order by avg(mr.rating) desc, m.title asc
)
select name as results from user_rated_greatest_number 
union all
select title from cte_movie_rating