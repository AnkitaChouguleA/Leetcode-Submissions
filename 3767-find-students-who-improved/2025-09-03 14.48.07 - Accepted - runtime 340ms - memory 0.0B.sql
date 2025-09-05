/* Write your T-SQL query statement below */
with cte_ranked as
(
    select *, 
    first_value(score) over(partition by student_id, subject order by exam_date asc) as first_score,
    last_value(score) over(partition by student_id, subject order by exam_date asc RANGE BETWEEN             UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as latest_score,
    count(*) over(partition by student_id, subject) as total_exams
    from scores
)
select distinct student_id,subject, first_score , latest_score 
from cte_ranked
where total_exams >=2 and latest_score > first_score
order by student_id, subject