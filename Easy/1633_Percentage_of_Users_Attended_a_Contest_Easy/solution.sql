with total_users as (
    select count(distinct user_id) as total
    from Users
),
contest_users AS (
    select contest_id, count(distinct user_id) as num_users
    from Register
    group by contest_id
)

select 
    contest_users.contest_id, 
    round((contest_users.num_users * 100.0 / total_users.total), 2) as percentage
from 
    contest_users, total_users
order by 
    percentage desc, 
    contest_users.contest_id asc