/* Write your T-SQL query statement below */
select cast(sum(tiv_2016)as decimal(10,2)) as tiv_2016 from Insurance
where tiv_2015 in
(select tiv_2015 from Insurance 
group by tiv_2015 having count(*) > 1)
and concat(lat,lon) not in 
(
    select concat(lat,lon) as location 
    from Insurance
    group by lat,lon 
    having count(*) > 1
)