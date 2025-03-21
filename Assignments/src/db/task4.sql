--TASK 4: SUBQUERY  

--TASK 4.1:
select c.first_name,a.balance from Customers c
join Accounts a
on c.cust_id=a.cust_id
where a.balance=(select max(balance) from Accounts);

--TASK 4.2:
select avg(balance) from Accounts 
where cust_id in (select cust_id from Accounts
group by cust_id 
having count(cust_id)>1);

--TASK 4.3:
select acc_id from Transactions 
where amnt > (select avg(amnt) from Transactions);

--TASK 4.4:
select cust_id from Accounts
where acc_id in 
(select acc_id from Transactions 
group by acc_id 
having count(trans_id)=0);

--TASK 4.5:
select acc_id,sum(balance) as Total_Balance from Accounts
where acc_id in 
(select acc_id from Transactions 
group by acc_id 
having count(trans_id)=0)
group by acc_id ;

--TASK 4.6:
select acc_id,balance from Accounts
where balance in 
(select min(balance) from Accounts);

--TAKS 4.7;
select cust_id from Accounts
where cust_id in 
(select cust_id from Accounts
group by cust_id
having count(distinct acc_type)>1);

--TASK 4.8:
--------------------------------------
--------------------------------------

--TASK 4.9:
select * from Transactions
where acc_id = 
(select acc_id from Accounts
where cust_id='4');

--TASK 4.10:
------------------------------------
------------------------------------