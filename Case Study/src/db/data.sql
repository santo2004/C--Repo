--INSERTING VALUES INTO Vehicle 
INSERT INTO Vehicle (Make, Model, Year, PerDayRate, Status, PerCap, EngCap) VALUES 
('Toyota', 'Land Cruiser', 2020, 150.00, 'A', 7, 4.5), 
('Honda', 'Civic Type R', 2019, 80.00, 'A', 5, 2.0),  
('Ford', 'Mustang', 2021, 100.00, 'NA', 4, 5.0),
('Mitsubishi', 'Pajero', 2018, 120.00, 'A', 7, 3.2),
('Mahindra', 'Thar Roxx', 2022, 80.00, 'A', 4, 2.2),
('Audi', 'R8', 2023, 300.00, 'A', 2, 5.2),
('BMW', 'M5', 2022, 250.00, 'A', 5, 4.4),
('Dodge', 'Charger Hellcat', 2023, 350.00, 'NA', 5, 6.2),
('Porsche', '911 GT3', 2023, 400.00, 'A', 2, 4.0),
('Cadillac', 'CTS-V', 2022, 280.00, 'A', 5, 6.2);

--INSERTING VALUES INTO Customer
insert into Customer(Fname, Lname, Email, PhnNum) values
('Santo','Allen','santo@gmail.com',7305817115),
('Nitish','SP','nitish@gmail.com',9843255610),
('Mohammad','Ashik','ashik@gmail.com',9360298058),
('Antony','Jeffrey','jeff@gmail.com',8903827170),
('Jesro','Nithin','jesro@gmail.com',9360463580),
('Anderson','Raj','leo@gmail.com',9042540585),
('Nandheesh','Ganesh','nandhu@gmail.com',7200161795),
('Siddharth','Suresh','sidhu@gmail.com',8281509465);

--INSERTING VALUES INTO Lease
insert into Lease(Vid, Cust_id, Sdate, Edate, Type) values
(2, 1, '2023-10-01', '2023-10-05', 'D'), 
(9, 2, '2023-10-10', '2023-11-10', 'M'),
(8, 3, '2023-10-15', '2023-10-20', 'D'), 
(6, 4, '2023-10-25', '2023-11-25', 'M'), 
(7, 5, '2023-11-01', '2023-11-05', 'D'), 
(1, 6, '2023-11-10', '2023-12-10', 'M'), 
(3, 7, '2023-11-15', '2023-11-20', 'D'), 
(4, 8, '2023-11-25', '2023-12-25', 'M'), 
(5, 1, '2023-12-01', '2023-12-05', 'D'), 
(10, 6, '2023-12-10', '2024-01-10', 'M'); 

--INSERTING VALUES INTO Payment
insert into Payment(Lid, PayDate, Amnt) values
(1, '2023-10-05', 400.00),   
(2, '2023-11-10', 12000.00), 
(3, '2023-10-20', 1750.00),  
(4, '2023-11-25', 9000.00),  
(5, '2023-11-05', 1250.00),  
(6, '2023-12-10', 4500.00),  
(7, '2023-11-20', 500.00),   
(8, '2023-12-25', 3600.00),  
(9, '2023-12-05', 400.00),   
(10, '2024-01-10', 8400.00); 

--DISPLAYING THE CREATED TABLES
select * from Vehicle;
select * from Customer;
select * from Lease;
select * from Payment;
