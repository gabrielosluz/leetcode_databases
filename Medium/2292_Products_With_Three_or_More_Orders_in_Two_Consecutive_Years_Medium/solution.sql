# Write your MySQL query statement below
with cte as
    (select product_id
         , substring(purchase_date,1,4) as purchase_year
         , count(distinct order_id) as num_orders
    from orders
    group by 1,2
    having num_orders>=3
    )
select distinct c1.product_id
from cte c1
join cte c2 on c1.product_id = c2.product_id and c1.purchase_year+1 = c2.purchase_year