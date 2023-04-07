-- Solução 1: 


select v.customer_id, count(v.visit_id) as count_no_trans from Visits v
left join Transactions t
on v.visit_id = t.visit_id
WHERE transaction_id IS NULL
group by 1;


-- Solução 2: 


SELECT customer_id, COUNT(visit_id) as count_no_trans 
FROM Visits
WHERE visit_id NOT IN (
	SELECT visit_id FROM Transactions
	)
GROUP BY customer_id


-- Solução 3:


SELECT customer_id, COUNT(visit_id) as count_no_trans 
FROM Visits v
WHERE NOT EXISTS (
	SELECT visit_id FROM Transactions t 
	WHERE t.visit_id = v.visit_id
	)
GROUP BY customer_id
