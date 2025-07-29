/* Write your T-SQL query statement below */
WITH latest_price_before_date AS (
    SELECT product_id, new_price,
           RANK() OVER (PARTITION BY product_id ORDER BY change_date DESC) AS rk
    FROM Products
    WHERE change_date <= '2019-08-16'
),
all_products AS (
    SELECT DISTINCT product_id FROM Products
)
SELECT 
    ap.product_id,
    COALESCE(lp.new_price, 10) AS price
FROM all_products ap
LEFT JOIN latest_price_before_date lp
    ON ap.product_id = lp.product_id AND lp.rk = 1;
