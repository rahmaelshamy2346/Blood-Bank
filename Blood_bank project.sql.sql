create database blood_bank;
use blood_bank;
create table Donors(
Donor_ID int primary key,
Donor_name varchar(50),
Blood_type varchar(3) not null,
Donation_date date,
Contact_number int unique
);
create table Blood_Bank(
Bag_ID int primary key auto_increment,
Blood_type varchar(3) not null,
Expire_date date,
Storage_location int 
);
create table Hospital(
Hospital_ID int primary key,
Hospital_Name varchar(50),
city varchar(20),
Emergency_Contact int unique
);
create table Blood_Request(
Request_ID int primary key,
Required_Blood_Type varchar(3) not null,
Quantity_Requested int,
Urgency_Level varchar(20),
Hospital_ID int,
foreign key(Hospital_ID) references Hospital(Hospital_ID)
);
create table Lab_test(
 Test_ID int primary key,
 Bag_ID int,
 Homoglobin_level  int,
 Virus_screening varchar(50) not null,
 Lab_technician varchar(50),
 Staff_ID int,
 foreign key(Staff_ID) references Staff(Staff_ID),
 foreign key(Bag_ID) references Blood_Bank(Bag_ID)
);
create table Staff(
Staff_ID int primary key,
Staff_name varchar(50),
Job_role varchar(50) not null,
shft_type varchar(50)
);

insert into Donors values
(1,'Mariam','A+','2026-4-25',01032310273),
(2,'Arwa','AB-','2026-3-13',01014867453),
(3,'Mohamed','A+','2026-2-15',01061062982),
(4,'Rahma','O-','2026-3-18',01013867354),
(5,'Omar','B+','2026-4-20',01065552620),
(6,'Roaa','AB+','2026-1-1',01201567829),
(7,'Khadija','O+','2026-1-21',01014379232);

insert into Blood_Bank values
(1,'A+','2026-6-30',10),
(2,'AB-','2026-5-18',14),
(3,'A+','2026-4-20',10),
(4,'AB+','2026-3-6',15),
(5,'O-','2026-5-23',16),
(6,'O+','2026-3-26',17),
(7,'B+','2026-6-25',12);

insert into Hospital values
(1, 'Elshrouk Hospital','Tanta',11223344),
(2, 'Elsalam Hospital','Cairo',1234551),
(3, 'El Shifa Hospital','Mansoura',22334455),
(4, 'Cleopatra Hospital','Cairo',11227799),
(5, 'Dar AlShifa Hospital','Alexandria',99887720),
(6, 'Victoria Hospital','Alexandria',1122334466),
(7, 'El Menshawy Hospital','Tanta',985647123);

insert into Blood_Request values
(1,'A+',5,'Normal',1),
(2,'B+',10,'Urgent',2),
(3,'O-',5,'Critical',3),
(4,'O+',15,'Critical',4),
(5,'A-',10,'Urgent',5),
(6,'A+',20,'Normal',6),
(7,'A+',5,'Normal',7);

insert into Lab_test values
(10,1,10,'positive','roaa',1),
(11,2,11,'positive','Ahmad',2),
(12,3,12,'positive','mondy',3),
(13,4,13,'positive','saif',4),
(14,5,14,'Negative','Fatma',5),
(15,6,15,'Negative','Rahma',6),
(16,7,16,'Negative','Khadija',7);

insert into  Staff values
(1,'mohamed','doctor','evening'),
(2,'roaa','doctor','morning'),
(3,'saif','doctor','night'),
(4,'malak','assistant','evening'),
(5,'ziad','assistant','evening'),
(6,'jana','nurse','evening'),
(7,'safy','nurse','evening');

update Staff set shft_type = 'morning'
 where  Staff_ID = 4;

delete from Donors
where Donor_ID = 5;

select * from Donors;
select * from Blood_Bank;
select* from Hospital;
select* from Blood_Request;
select* from Lab_test;
select* from Staff;
show tables;

select Hospital_Name 
from Hospital;

select * from Donors 
where Blood_type = 'A+' ;

select * from Lab_test
where Virus_screening like 'Negative';

select * from Lab_test
where Homoglobin_level between 11 and 14;

select * from Lab_test
order by Homoglobin_level desc;

select count(*) as total_Blood_Request from Blood_Request;
select sum(Quantity_Requested) from Blood_Request;
select avg(Quantity_Requested) from Blood_Request;
select max(Homoglobin_level) from Lab_test;
select min(Homoglobin_level) from Lab_test;

select Quantity_Requested , sum(Quantity_Requested)
from Blood_Request
group by Quantity_Requested
having sum(Quantity_Requested) > 5;

select Quantity_Requested , sum(Quantity_Requested)
from Blood_Request
group by Quantity_Requested;

select * from Hospital inner join Blood_Request on Hospital.Hospital_ID = Blood_Request.Hospital_ID;

select * from Hospital left join Blood_Request on Hospital.Hospital_ID = Blood_Request.Hospital_ID;

select * from Hospital right join Blood_Request on Hospital.Hospital_ID = Blood_Request.Hospital_ID;

select * from Hospital left join Blood_Request on Hospital.Hospital_ID = Blood_Request.Hospital_ID
union
select * from Hospital right join Blood_Request on Hospital.Hospital_ID = Blood_Request.Hospital_ID;

select * from Blood_Request where Quantity_Requested <> All ( select Quantity_Requested from Blood_Request where Quantity_Requested=10);

select * from Blood_Request where Quantity_Requested > All ( select Quantity_Requested from Blood_Request where Quantity_Requested=10);

select Storage_location
from Blood_Bank 
where Storage_location in (10,14,15);

select * from Blood_Bank
where Storage_location >
(select avg(Storage_location) from Blood_Bank);












