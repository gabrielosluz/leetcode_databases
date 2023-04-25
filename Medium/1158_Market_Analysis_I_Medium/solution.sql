select u.user_id AS buyer_id, u.join_date, count(o.order_id) as orders_in_2019
from Users u left join Orders o 
on u.user_id = o.buyer_id and year(o.order_date)=2019
group by 1