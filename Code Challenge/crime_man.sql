--Create database
create database crime;
use crime;

drop table if exists Victim;
drop table if exists Suspect;
drop table if exists Crime;

-- Create tables
CREATE TABLE Crime (
CrimeID INT PRIMARY KEY,
IncidentType VARCHAR(255),
IncidentDate DATE,
Location VARCHAR(255),
Description TEXT,
Status VARCHAR(20)
);

CREATE TABLE Victim (
VictimID INT PRIMARY KEY,
CrimeID INT,
Name VARCHAR(255),
ContactInfo VARCHAR(255),
Injuries VARCHAR(255),
FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);

CREATE TABLE Suspect (
SuspectID INT PRIMARY KEY,
CrimeID INT,
Name VARCHAR(255),
Description TEXT,
CriminalHistory TEXT,
FOREIGN KEY (CrimeID) REFERENCES Crime(CrimeID)
);

-- Insert sample data
INSERT INTO Crime (CrimeID, IncidentType, IncidentDate, Location, Description, Status)
VALUES
(1, 'Robbery', '2023-09-15', '123 Main St, Cityville', 'Armed robbery at a convenience store', 'Open'),
(2, 'Homicide', '2023-09-20', '456 Elm St, Townsville', 'Investigation into a murder case', 'Under
Investigation'),
(3, 'Theft', '2023-09-10', '789 Oak St, Villagetown', 'Shoplifting incident at a mall', 'Closed');

INSERT INTO Victim (VictimID, CrimeID, Name, ContactInfo, Injuries)
VALUES
(1, 1, 'John Doe', 'johndoe@example.com', 'Minor injuries'),
(2, 2, 'Jane Smith', 'janesmith@example.com', 'Deceased'),
(3, 3, 'Alice Johnson', 'alicejohnson@example.com', 'None');

INSERT INTO Suspect (SuspectID, CrimeID, Name, Description, CriminalHistory)
VALUES
(1, 1, 'Robber 1', 'Armed and masked robber', 'Previous robbery convictions'),
(2, 2, 'Unknown', 'Investigation ongoing', NULL),
(3, 3, 'Suspect 1', 'Shoplifting suspect', 'Prior shoplifting arrests');

--Displaying created records
select * from Crime;
select * from Victim;
select * from Suspect;

--1.
select * from Crime 
where Status='Open';

--2. 
select IncidentType,COUNT(*) as Total_Types_of_Incident from Crime
group by IncidentType;

--3.
select distinct IncidentType from Crime;

--4.
select * from Crime
where IncidentDate BETWEEN '2023-09-01' and '2023-09-10';

--5.
alter table Victim 
add Age int;
update Victim set Age=34
where VictimID='1';
update Victim set Age=40
where VictimID='2';
update Victim set Age=25
where VictimID='3';

alter table Suspect 
add Age int;
update Suspect set Age=29
where SuspectID='1';
update Suspect set Age=36
where SuspectID='2';
update Suspect set Age=31
where SuspectID='3';

select Name,Age
from Victim
union all
select Name,Age
from Suspect
order by Age desc;

--6.
select avg(Age) as Average_Age
from Victim 
group by Age;

--7.
select IncidentType, COUNT(*) as Count_of_Types from Crime
where Status='Open'
group by IncidentType;

--8.
select Name from Victim
where Name like '%Doe%'
union all
select Name from Suspect
where Name like '%Doe%';

--9.
select v.name, c.status from victim v
join crime c on v.crimeID = c.crimeID
where c.status in('open','closed')
union
select s.name, c.status from Suspect s
join Crime c on s.crimeID = c.crimeID
where c.status in('open','closed')
order by c.Status;

--10.
select IncidentType from Crime
where CrimeID = 
(select CrimeID from Victim
where Age between 30 and 35);


--11.
select V.Name 
from Victim V 
join Crime C on V.CrimeID = C.CrimeID 
where C.IncidentType = 'Robbery';

--12.
select IncidentType, COUNT(*) as Open_Case_Count
from Crime 
where Status = 'Open' 
group by IncidentType 
having COUNT(*) > 1;

--13.
select distinct c.CrimeID, c.IncidentType, s.Name as SuspectName, v.Name as VictimName
from Crime c
join Suspect s on c.CrimeID = s.CrimeID
join Victim v on s.Name = v.Name;

--14.
select c.CrimeID, c.IncidentType, c.IncidentDate, c.Location, v.Name as VictimName, v.ContactInfo, v.Injuries,s.Name as SuspectName, s.Description, s.CriminalHistory
from Crime C
join Victim V on C.CrimeID = V.CrimeID
join Suspect S on C.CrimeID = S.CrimeID;

--15.
select C.CrimeID, C.IncidentType
from Crime C
join Suspect S on C.CrimeID = S.CrimeID
join Victim V on C.CrimeID = V.CrimeID
where s.Age > v.Age;

--16.
select Name, COUNT(*) as IncidentCount
from Suspect 
group by Name 
having COUNT(*) > 1;

--17.
select C.CrimeID, C.IncidentType, C.IncidentDate
from Crime C
join Suspect S 
on C.CrimeID = S.CrimeID
where S.SuspectID is null;

--18.
select c.*
from Crime c
where exists 
(select 1 from Crime c2 
where c2.CrimeID = c.CrimeID 
and c2.IncidentType = 'Homicide')
and not exists 
(select 1 from Crime c3 
where c3.CrimeID = c.CrimeID 
and c3.IncidentType not in ('Homicide', 'Robbery'));

--19.
select C.CrimeID, C.IncidentType, COALESCE(S.Name, 'No Suspect') as SuspectName
from Crime C
left join Suspect S on C.CrimeID = S.CrimeID;

--20.
select distinct S.Name 
from Suspect S
join Crime C on S.CrimeID = C.CrimeID
where C.IncidentType in ('Robbery', 'Assault');