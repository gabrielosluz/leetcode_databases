--soluion 1
select p.product_name, s.year, s.price from Sales s join Product p on s.product_id = p.product_id;

-- solution2
-- Likely what is happening is that in the Sales table there are 
-- multiple transactions of the same product_id, year, 
-- price at different quantity. As a result, 
-- if DISTINCT entries were retrieved before joining with Product table, 
-- it runs a lot faster.

SELECT DISTINCT 
    P.product_name, S.year, S.price 
FROM 
    (SELECT DISTINCT product_id, year, price FROM Sales) S
INNER JOIN
    Product AS P
USING (product_id);