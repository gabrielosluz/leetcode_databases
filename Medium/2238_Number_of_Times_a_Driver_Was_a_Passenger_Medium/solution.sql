with dr as (
select distinct driver_id
from rides)

select dr.driver_id, count(passenger_id) cnt
from dr left join rides
on dr.driver_id = rides.passenger_id
group by dr.driver_id