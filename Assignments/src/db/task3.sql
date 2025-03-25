--TASKS 3:

--TASK 3.1:
select avg(balance) from Accounts;

--TASK 3.2:
select top 1 acc_id, balance from Accounts
order by balance desc;

--TASK 3.3:
select sum(amnt) as Total_Deposit from Transactions 
where trans_date='2024-03-01' and trans_type='Deposit';

--TASK 3.4:
select top 1 first_name from Customers
order by DOB asc;
select top 1 first_name from Customers
order by DOB desc;

--TASK 3.5:
select t.trans_id,t.trans_type,t.amnt,t.trans_date,a.acc_type
from Transactions t
inner join Accounts a
on t.acc_id=a.acc_id;

--TASK 3.6:
select c.first_name, a.acc_id, a.acc_type, a.balance
from Customers c
inner join Accounts a
on a.cust_id=c.cust_id;

--TASK 3.7:
select c.cust_id,c.first_name,a.acc_id,a.acc_type,a.balance,t.trans_type,t.amnt
from Customers c
join Accounts a
on c.cust_id=a.cust_id
join Transactions t
on a.acc_id=t.acc_id
where a.acc_id='6';

--TASK 3.8:
select c.first_name, count(a.acc_id) as No_of_Acc 
from Customers C
join Accounts a
on c.cust_id=a.cust_id
group by c.first_name
having count(a.acc_id)>1;

--TASK 3.9:
select acc_id, 
sum(select amnt from Accounts where trans_type='Deposit') -
sum(select amnt from Accounts where trans_type='Withdrawl') as Transaction_diff
from Transactions
group by acc_id;

--TASK 3.10:
select acc_id, avg(balance) as Avg_Bal from Accounts
group by acc_id;

--TASK 3.11:
select acc_type,sum(balance) as Total_Balance from Accounts
group by acc_type;

--TASK 3.12:
select a.acc_id, count(*) as Highest_Transaction from Accounts a
join Transactions t
on a.acc_id=t.acc_id
group by a.acc_id
order by count(*) desc;

--TASK 3.13:
select c.cust_id,a.acc_id,a.acc_type,sum(a.balance) as Total_Balance
from Customers c
join Accounts a
on c.cust_id=a.cust_id
group by c.cust_id, c.first_name, a.acc_id, a.acc_type;

--TASK 3.14:
---------------------------------------------------------
---------------------------------------------------------