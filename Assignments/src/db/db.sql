--creating a database "HMBank"
create database HMBank;

--using the created database HMBank
use HMBank;

-- Drop tables if they exist
drop table if exists Transactions;
drop table if exists Accounts;
drop table if exists Customers;


--TASKS 1: DATABASE DESIGN
--creating Customers table
create table Customers
(
    cust_id int identity(1,1) primary key,
    first_name VARCHAR(50) not null,
    last_name VARCHAR(50) not null,
    DOB date,
    email varchar(100) not null,
    phn_num char(10) unique,
    address varchar(100)
);

--creating Accounts table
create table Accounts
(
    acc_id int identity(1,1) primary key,
    cust_id int,
    acc_type varchar(max) check (acc_type in ('Savings', 'Current', 'Zero Balance')),
    balance decimal(10,2),
    foreign key(cust_id) references Customers(cust_id) on delete cascade
);

--creating Transactions table
create table Transactions
(
    trans_id int identity(1,1) primary key,
    acc_id int,
    trans_type varchar(max) check (trans_type in ('Deposit', 'Withdrawal', 'Transfer')),
    amnt decimal(10,2),
    trans_date date,
    foreign key(acc_id) references Accounts(acc_id) on delete cascade
);


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
(3, 'Deposit', 1500.00, '2024-03-03'),
(4, 'Transfer', 3000.00, '2024-03-04'),
(5, 'Withdrawal', 2000.00, '2024-03-05'),
(6, 'Deposit', 5000.00, '2024-03-06'),
(7, 'Transfer', 4000.00, '2024-03-07'),
(8, 'Withdrawal', 1000.00, '2024-03-08'),
(9, 'Deposit', 2500.00, '2024-03-09'),
(10, 'Deposit', 3000.00, '2024-03-10');

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
---------------------------------------------------------
---------------------------------------------------------

--TASK 3.10:
select acc_id, avg(balance) as Avg_Bal from Accounts
group by acc_id;

--TASK 3.11:
select acc_type,sum(balance) from Accounts
group by acc_type;

--TASK 3.12:
select a.acc_id, count(*) from Accounts a
join Transactions t
on a.acc_id=t.acc_id
group by a.acc_id
order by count(*) desc;

--TASK 3.13:
select c.cust_id,c.first_name,a.acc_id,a.acc_type,sum(a.balance)
from Customers c
join Accounts a
on c.cust_id=a.cust_id
group by c.first_name;

--TASK 3.14:
---------------------------------------------------------
---------------------------------------------------------

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
