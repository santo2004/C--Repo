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
