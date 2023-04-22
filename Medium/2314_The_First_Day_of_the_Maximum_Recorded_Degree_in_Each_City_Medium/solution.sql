with cte1 as
(select city_id, max(degree) degree
from weather
group by city_id)

select a.city_id, min(a.day) as day, a.degree
from weather a
inner join cte1 b
on a.city_id = b.city_id
and a.degree = b.degree
group by a.city_id, a.degree
order by a.city_id