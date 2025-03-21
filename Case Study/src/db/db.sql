--CREATING DATABASE CRS
create database CRS;

--DROPPING TABLES IF EXISTS

--USING THE CREATED DATABASE CRS
use CRS;

--CREATING TABLE Vehicle
create table Vehicle (
    Vid INT PRIMARY KEY AUTO_INCREMENT,
    Make VARCHAR(50) NOT NULL,
    Model VARCHAR(50) NOT NULL,
    Year INT NOT NULL,
    PerDayRate DECIMAL(10, 2) NOT NULL,
    Status ENUM('A', 'NA') NOT NULL,
    PerCap INT NOT NULL,
    EngCap DECIMAL(5, 2) NOT NULL
);

--CREATING TABLE  Customer
create table Customer (
    Cust_id INT PRIMARY KEY AUTO_INCREMENT,
    Fname VARCHAR(50) NOT NULL,
    Lname VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhnNum VARCHAR(15) NOT NULL
);

--CREATING TABLE Lease
create table Lease (
    Lid INT PRIMARY KEY AUTO_INCREMENT,
    Vid INT,
    Cust_id INT,
    Sdate DATE NOT NULL,
    Edate DATE NOT NULL,
    Type ENUM('D', 'M') NOT NULL,
    FOREIGN KEY (Vid) REFERENCES Vehicle(Vid),
    FOREIGN KEY (Cust_id) REFERENCES Customer(Cust_id)
);

--CREATING TABLE Payment
create table Payment (
    Pid INT PRIMARY KEY AUTO_INCREMENT,
    Lid INT,
    PayDate DATE NOT NULL,
    Amnt DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Lid) REFERENCES Lease(Lid)
);
