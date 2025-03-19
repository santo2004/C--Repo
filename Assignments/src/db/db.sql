--creating a database "HMBank"
create database HMBank;

--using the created database HMBank
use HMBank;

-- Drop tables if they exist
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Accounts;
DROP TABLE IF EXISTS Transactions;


--creating Customers table
create table Customers
(
    cust_id int identity(1,1) primary key,
    first_name varchar(max),
    last_name varchar(max),
    DOB date,
    email varchar(max),
    phn_num bigint,
    address varchar(max)
);

--creating Accounts table
create table Accounts
(
    acc_num int identity(1,1) primary key,
    cust_id int,
    acc_type varchar(max),
    balance decimal(10,2),
    foreign key(cust_id) references Customers(cust_id)
);

--creating Transactions table
create table Transactions
(
    trans_id int identity(1,1) primary key,
    acc_id int,
    trans_type varchar(max),
    amnt decimal(10,2),
    trans_date date,
    foreign key(acc_id) references Accounts(acc_id)
);

