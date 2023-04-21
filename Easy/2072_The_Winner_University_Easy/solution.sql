-- solution 1

# Write your MySQL query statement below
with NY as (
    select * from NewYork where score >= 90
),
CA as (
    select * from California where score >= 90
)
select CASE
    WHEN COUNT_cte1 > COUNT_cte2 THEN "New York University"
    WHEN COUNT_cte2 > COUNT_cte1 THEN "California University"
    ELSE "No Winner"
END AS winner
from 
  (SELECT COUNT(*) AS COUNT_cte1 FROM NY) AS counts_cte1
  CROSS JOIN (SELECT COUNT(*) AS COUNT_cte2 FROM CA) AS counts_cte2;


-- solution 2

# Write your MySQL query statement below
WITH score_count AS (
    SELECT
      (SELECT COUNT(*) FROM NewYork WHERE score >= 90) as NY_score,
      (SELECT COUNT(*) FROM California WHERE score >= 90) as CA_score
)

SELECT 
    CASE 
    WHEN NY_score > CA_score THEN "New York University"
    WHEN NY_score < CA_score THEN "California University"
    ELSE "No Winner"
    END as winner
FROM score_count;

-- solution 3

select case
        when sum(n.score>=90) > sum(c.score>=90) then 'New York University'
        when sum(n.score>=90) < sum(c.score>=90) then 'California University'
        else 'No Winner'
        end as 'winner'
from NewYork n, California c