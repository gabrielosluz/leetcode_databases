-- solution 1
SELECT 
    m.name
FROM 
    Employee e
JOIN 
    Employee m ON e.managerId = m.id
GROUP BY 
    e.managerId
HAVING 
    COUNT(*) >= 5;

-- solution 2
select name from employee
where id in (
select managerid from
employee
group by managerid
having count(*) >= 5);

-- solution 3
with cte as  (
  SELECT managerId
    FROM Employee 
    GROUP BY managerId 
    HAVING COUNT(*) >= 5

)
SELECT 
    e.name from employee e 
 join cte on
   e.id= cte.managerId