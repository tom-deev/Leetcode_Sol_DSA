# Write your MySQL query statement below
SELECT product_id, new_price AS price
FROM Products
WHERE change_date = (
    SELECT MAX(change_date)
    FROM Products p2
    WHERE p2.product_id = Products.product_id
      AND change_date <= '2019-08-16'
)

UNION

SELECT product_id, 10 AS price
FROM Products
WHERE product_id NOT IN (
    SELECT product_id
    FROM Products
    WHERE change_date <= '2019-08-16'
);