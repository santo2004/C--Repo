--TASK 2: CRED OPERATIONS
--INSERTING RECORDS INTO TABLES

--inserting values into Customers table
insert into Customers(first_name, last_name, DOB, email, phn_num, address) values
('Santo','T','2004-02-23','santo23@gmail.com',7305817115,'Colachel'),
('Sandra','T','2007-03-15','sandra15@gmail.com',9442401339,'Colachel'),
('Viji','M','2004-04-02','viji02@gmail.com', 8148053134,'Villupuram'),
('Shruthi','C','2004-04-18','shruthic@gmail.com',9080346833,'Satur'),
('Shalini','S','2004-03-08','shalinis@gmail.com',8754235479,'Pudukkottai'),
('Ashik','H','2003-03-11','ashik@gmail.com',9360298058,'Villupuram'),
('Nitish','SP','2003-05-16','nitish@gmail.com',9843255610,'Erode'),
('Roger','A','2003-11-19','santo23@gmail.com',9342196617,'Karaikudi'),
('Nithim','Sha','2003-03-04','nithim@gmail.com',9094679847,'Chennai'),
('Siddharth','S','2003-08-13','siddhu@gmail.com',8281509465,'Thrissur');

--inserting values into Accounts table
insert into Accounts(cust_id, acc_type, balance) values
(1, 'Zero Balance', 3100.00),
(2, 'Current', 22000.00),
(3, 'Savings', 6000.00),
(4, 'Savings', 5000.00),
(5, 'Current', 10000.00),
(6, 'Zero Balance', 200.00),
(7, 'Savings', 2000.00),
(8, 'Current', 50000.00),
(9, 'Savings', 7000.00),
(10, 'Zero Balance', 0.00);

--inserting values into Transaction table
insert into Transactions(acc_id, trans_type, amnt, trans_date) values
(1, 'Deposit', 2000.00, '2024-03-01'),
(2, 'Withdrawal', 500.00, '2024-03-02'),
(6, 'Deposit', 1500.00, '2024-03-03'),
(4, 'Transfer', 3000.00, '2024-03-04'),
(5, 'Withdrawal', 2000.00, '2024-03-05'),
(6, 'Deposit', 5000.00, '2024-03-06'),
(4, 'Transfer', 4000.00, '2024-03-07'),
(8, 'Withdrawal', 1000.00, '2024-03-08'),
(9, 'Deposit', 2500.00, '2024-03-09'),
(5, 'Deposit', 3000.00, '2024-03-10');

--displaying all 3tables
select * from Customers;
select * from Accounts;
select * from Transactions;

--TASK 2.2.1: 
select c.first_name as Name, a.acc_type as Account_Type, c.email as Email 
from Customers c 
inner join Accounts a 
on c.cust_id=a.cust_id;

--TASK 2.2.2:
select c.first_name,a.acc_id,t.trans_type,t.amnt,t.trans_date
from Customers c
inner join Accounts a 
on c.cust_id=a.cust_id
inner join Transactions t
on a.acc_id=t.acc_id;

--TASK 2.2.3:
update Accounts
set balance+=500
where acc_id=4;
select * from Accounts;

--TASK 2.2.4:
select CONCAT(first_name,' ',last_name) as Full_Name 
from Customers;

--TASK 2.2.5:
delete from Accounts
where balance='0.00' 
and acc_type='Savings';

--TASK 2.2.6:
select first_name 
from Customers 
where address='Colachel';

--TASK 2.2.7:
select balance 
from Accounts
where acc_id=9;

--TASKS 2.2.8:
select * from Accounts
where acc_type='Current'
and balance>1000;

--TASK 2.2.9:
select * from Transactions
where trans_id=8;

--TASK 2.2.10:
select acc_id, balance*0.03 as Interest 
from Accounts 
where acc_type='Savings';

--TASK 2.2.11:
select * from Accounts
where balance<5000;

--TASK 2.2.12:
select first_name from Customers
where address not like 'Colachel';