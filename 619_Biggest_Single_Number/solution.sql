-- Solução 1: 

sql
with distinct_num as (
    select num, count(num) as count_num from MyNumbers group by num
)
select max(num) as num from distinct_num where count_num = 1;


-- Solução 2:

sql
with distinct_num as (
    select num, count(num) as count_num from MyNumbers group by num
)
select ifnull(max(num),Null) as num from distinct_num where count_num = 1;


-- Solução 3:

sql
SELECT MAX(num) AS num
FROM MyNumbers
WHERE num IN (SELECT num
FROM MyNumbers
GROUP BY num
HAVING COUNT(*) = 1);
