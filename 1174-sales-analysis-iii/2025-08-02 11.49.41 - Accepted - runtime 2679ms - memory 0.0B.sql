select product_id, product_name from product p
where exists(
    SELECT 1 
    FROM Sales s
    where s.product_id = p.product_id 
    and  s.sale_date BETWEEN '2019-01-01' AND '2019-03-31'
)
and not exists(
    SELECT 1 
    FROM Sales s
    where s.product_id = p.product_id 
    and  s.sale_date not BETWEEN '2019-01-01' AND '2019-03-31'
)
