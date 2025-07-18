/* Write your T-SQL query statement below */
select name as customers from Customers where id not in(select customerid from orders)