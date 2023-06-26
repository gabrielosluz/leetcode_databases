-- solution 1
select s.user_id, ROUND(COUNT(c1.action)/(COUNT(c1.action) + COUNT(c2.action)), 3) as confirmation_rate from 
Confirmations c1 
join Signups s on s.user_id = c1.user_id
join Confirmations c2 on c1.user_id = c2.user_id and c1.action = 'confirmed' and c2.action = 'timeout' 
group by s.user_id

-- solution 2
SELECT
    s.user_id,
    ROUND(
        COALESCE(
            SUM(c.action = 'confirmed') / NULLIF(COUNT(c.action), 0),
            0
        ),
        2
    ) AS confirmation_rate
FROM
    Signups s
LEFT JOIN
    Confirmations c ON s.user_id = c.user_id
GROUP BY
    s.user_id;