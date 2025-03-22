--CREATING DATABASE CRS
create database CRS;

--USING THE CREATED DATABASE CRS
use CRS;

--DROPPING TABLES IF EXISTS
drop table if exists Payment;
drop table if exists Lease;
drop table if exists Customer;
drop table if exists Vehicle;

--CREATING TABLE Vehicle
CREATE TABLE Vehicle (
    Vid INT IDENTITY PRIMARY KEY,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    PerDayRate DECIMAL(10, 2) NOT NULL,
    Status CHAR(2) NOT NULL CHECK (Status IN ('A', 'NA')), 
    PerCap INT NOT NULL,
    EngCap DECIMAL(5, 2) NOT NULL
);

--CREATING TABLE  Customer
CREATE TABLE Customer (
    Cust_id INT IDENTITY PRIMARY KEY,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhnNum VARCHAR(10) NOT NULL
);

--CREATING TABLE Lease
CREATE TABLE Lease (
    Lid INT IDENTITY PRIMARY KEY,
    Vid INT,
    Cust_id INT,
    Sdate DATE NOT NULL,
    Edate DATE NOT NULL,
    Type CHAR(1) NOT NULL CHECK (Type IN ('D', 'M')), 
    FOREIGN KEY (Vid) REFERENCES Vehicle(Vid),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

--CREATING TABLE Payment
CREATE TABLE Payment (
    Pid INT IDENTITY PRIMARY KEY,
    Lid INT,
    PayDate DATE NOT NULL,
    Amnt DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Lid) REFERENCES Lease(Lid)
);

