select u.name, sum(t.amount) as balance from 
Users u join Transactions t 
on u.account = t.account
group by u.name
HAVING SUM(t.amount) > 10000;