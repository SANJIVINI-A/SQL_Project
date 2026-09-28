-- ========================================
-- 🔧 Database Creation
-- ========================================
create database real_estateDB ;
use real_estateDB ;
show databases;
show tables;

-- ========================================
-- 🔧 DDL: Table Creation
-- ========================================
/* ==========================  agents table  ========================== */
create table agents(        
agentID varchar(15) primary key,
a_name varchar(30) not null ,
a_phone bigint(10) unique not null ,
a_email varchar(50), 
experience varchar(10));
desc agents;
/* ==========================  properties table  ========================== */
create table properties( propertyID  varchar(10) primary key,title  Varchar(50) ,loc varchar(60),
city varchar(20),type enum('Apartment', 'Villa', 'Plot'),size int,price decimal(10,2),listed_Date date,
P_status enum('Available', 'Sold'),agentID varchar(20),
FOREIGN KEY (agentID) REFERENCES agents(agentID));
desc properties;
select * from properties;
desc properties;
 /* ==========================  clients table  ========================== */
create  table clients(clientID varchar(15) primary key ,c_name varchar(40) not null ,
c_email varchar(50) ,c_phone bigint(10) unique  not null ,preferred_city varchar(10) );
desc clients;

/* ==========================  visits table  ========================== */

create table visits (visitID varchar(15) primary key ,clientID varchar(15),
FOREIGN KEY (clientID) REFERENCES clients(clientID),
propertyID  varchar(10),
FOREIGN KEY (propertyID) REFERENCES properties(propertyID),
visit_Date Date );
desc visits;

/* ==========================  Deals table  ========================== */
create table deals (dealID varchar(15) primary key ,clientID varchar(15),
FOREIGN KEY (clientID) REFERENCES clients(clientID),
propertyID  varchar(10),
FOREIGN KEY (propertyID) REFERENCES properties(propertyID),
deal_date date ,final_price decimal(10,2));
desc deals ;
show tables ;

-- ========================================
-- 📥 DML: Data Insertion  
-- ========================================

/* ====================================Data Insertion in agent table  ==========================================*/

INSERT INTO agents (agentID, a_name, a_phone, a_email, experience) VALUES
('AG001', 'Rohan Mehra', 9876543210, 'rohan.mehra@example.com', '5'),
('AG002', 'Priya Sharma', 9876501234, 'priya.sharma@example.com', '8'),
('AG003', 'Amit Kapoor', 9876112233, 'amit.kapoor@example.com', '3'),
('AG004', 'Neha Singh', 9876998877, 'neha.singh@example.com', '6'),
('AG005', 'Manish Verma', 9876123456, 'manish.verma@example.com', '10'),
('AG006', 'Anjali Chauhan', 9876456789, 'anjali.chauhan@example.com', '4'),
('AG007', 'Karan Joshi', 9876012345, 'karan.joshi@example.com', '2'),
('AG008', 'Simran Kaur', 9876123987, 'simran.kaur@example.com', '7'),
('AG009', 'Deepak Yadav', 9876678990, 'deepak.yadav@example.com', '9'),
('AG010', 'Ritika Goyal', 9876987654, 'ritika.goyal@example.com', '11'),
('AG011', 'Alok Pandey', 9876234567, 'alok.pandey@example.com', '1'),
('AG012', 'Sneha Patil', 9876888999, 'sneha.patil@example.com', '6'),
('AG013', 'Vikram Desai', 9876443321, 'vikram.desai@example.com', '13'),
('AG014', 'Divya Nair', 9876554321, 'divya.nair@example.com', '3'),
('AG015', 'Siddharth Rao', 9876111222, 'siddharth.rao@example.com', '5'),
('AG016', 'Megha Bansal', 9876991122, 'megha.bansal@example.com', '2'),
('AG017', 'Rahul Jain', 9876778899, 'rahul.jain@example.com', '10'),
('AG018', 'Pooja Sinha', 9876888776, 'pooja.sinha@example.com', '7'),
('AG019', 'Nikhil Dube', 9876444999, 'nikhil.dube@example.com', '4'),
('AG020', 'Ayesha Sheikh', 9876555666, 'ayesha.sheikh@example.com', '6');
select * from agents;
/* ====================================Data Insertion in properties table    ==========================================*/
INSERT INTO properties (propertyID, title, loc, city, type, size, price, listed_Date, P_status, agentID) VALUES
('P011', '3BHK in Kharghar', 'Kharghar, Navi Mumbai', 'Mumbai', 'Apartment', 1050, 10500000.00, '2024-07-18', 'Sold', 'AG003');
INSERT INTO properties (propertyID, title, loc, city, type, size, price, listed_Date, P_status, agentID) VALUES
('P004', 'Villa in Whitefield', 'Whitefield, Bangalore', 'Bangalore', 'Villa', 2600, 27500000.00, '2024-06-10', 'Available', 'AG014'),
('P016', '2BHK in Wakad', 'Wakad, Pune', 'Pune', 'Apartment', 900, 8700000.00, '2024-08-01', 'Available', 'AG005'),
('P002', 'Plot in Sector 77', 'Sector 77, Noida', 'Noida', 'Plot', 1400, 9500000.00, '2024-06-25', 'Sold', 'AG008'),
('P013', 'Luxury Villa in Jubilee Hills', 'Jubilee Hills, Hyderabad', 'Hyderabad', 'Villa', 2800, 33000000.00, '2024-07-15', 'Available', 'AG011'),
('P007', '2BHK in Malad East', 'Malad East, Mumbai', 'Mumbai', 'Apartment', 880, 8900000.00, '2024-07-01', 'Sold', 'AG001'),
('P018', 'Plot near Ring Road', 'Ring Road, Ghaziabad', 'Ghaziabad', 'Plot', 1700, 9600000.00, '2024-06-12', 'Available', 'AG020'),
('P003', 'Villa in HSR Layout', 'HSR Layout Sector 3', 'Bangalore', 'Villa', 2500, 24500000.00, '2024-08-08', 'Sold', 'AG006'),
('P009', '1RK Studio in Dadar', 'Dadar West, Mumbai', 'Mumbai', 'Apartment', 450, 5300000.00, '2024-07-05', 'Available', 'AG012'),
('P014', 'Open Plot in Hinjewadi', 'Phase 1, Hinjewadi', 'Pune', 'Plot', 1600, 12500000.00, '2024-06-30', 'Sold', 'AG004'),
('P006', '3BHK in Sector 63', 'Sector 63, Noida', 'Noida', 'Apartment', 1150, 11300000.00, '2024-05-20', 'Available', 'AG016'),
('P001', 'Villa in Sector 49', 'Sector 49, Noida', 'Noida', 'Villa', 2200, 19800000.00, '2024-07-28', 'Available', 'AG007'),
('P015', 'Luxury Apartment in Baner', 'Baner, Pune', 'Pune', 'Apartment', 950, 9700000.00, '2024-06-15', 'Available', 'AG009'),
('P005', 'Independent Villa in Saket', 'Saket, Delhi', 'Delhi', 'Villa', 2400, 29000000.00, '2024-07-09', 'Sold', 'AG013'),
('P017', 'Residential Plot in Sector 71', 'Sector 71, Noida', 'Noida', 'Plot', 1500, 11800000.00, '2024-08-04', 'Available', 'AG010'),
('P008', '2BHK in Gachibowli', 'Gachibowli, Hyderabad', 'Hyderabad', 'Apartment', 920, 9100000.00, '2024-07-02', 'Available', 'AG015'),
('P020', 'Plot in Shamirpet', 'Shamirpet, Hyderabad', 'Hyderabad', 'Plot', 2000, 14200000.00, '2024-07-25', 'Sold', 'AG002'),
('P012', 'Studio in Koramangala', 'Koramangala 5th Block', 'Bangalore', 'Apartment', 600, 7100000.00, '2024-06-22', 'Available', 'AG017'),
('P019', 'Villa in Bannerghatta', 'Bannerghatta Road', 'Bangalore', 'Villa', 2700, 26500000.00, '2024-07-20', 'Available', 'AG018'),
('P010', 'Plot in Sector 50', 'Sector 50, Noida', 'Noida', 'Plot', 1550, 12000000.00, '2024-06-10', 'Sold', 'AG019');

SELECT * FROM PROPERTIES order by propertyID ASC;

/* ====================================Data Insertion in CLIENT table    ==========================================*/

INSERT INTO clients (clientID, c_name, c_email, c_phone, preferred_city) VALUES
('C101', 'Bhavya Sharma', 'bhavya.sharma@gmail.com', 9877001122, 'Pune'),
('C102', 'Tushar Kulkarni', 'tushar.kulkarni@yahoo.com', 9988771123, 'Mumbai'),
('C103', 'Sakshi Anand', 'sakshi.anand@outlook.com', 9765123487, 'Noida'),
('C104', 'Rajeev Saxena', 'rajeev.saxena@gmail.com', 9345001234, 'Delhi'),
('C105', 'Isha Choudhary', 'isha.choudhary@gmail.com', 9123098765, 'Bangalore'),
('C106', 'Kavya Menon', 'kavya.menon@rediffmail.com', 9898001122, 'Hyderabad'),
('C107', 'Aarav Malhotra', 'aarav.malhotra@gmail.com', 9012003456, 'Chennai'),
('C108', 'Zoya Qureshi', 'zoya.qureshi@hotmail.com', 9887662345, 'Mumbai'),
('C109', 'Harsh Vora', 'harsh.vora@yahoo.com', 9876123001, 'Pune'),
('C110', 'Ritika Rawat', 'ritika.rawat@gmail.com', 9789004411, 'Hyderabad'),
('C111', 'Saurabh Mishra', 'saurabh.mishra@live.com', 9923456712, 'Noida'),
('C112', 'Anika Reddy', 'anika.reddy@gmail.com', 9933011223, 'Bangalore'),
('C113', 'Mohit Shetty', 'mohit.shetty@gmail.com', 9877099001, 'Delhi'),
('C114', 'Shreya Tiwari', 'shreya.tiwari@yahoo.com', 9966543210, 'Mumbai'),
('C115', 'Raghav Patil', 'raghav.patil@gmail.com', 9811122233, 'Pune');
select * from clients;
/* ====================================Data Insertion in VISITS table    ==========================================*/

INSERT INTO visits (visitID, clientID, propertyID, visit_Date) VALUES
('V001', 'C110', 'P014', '2024-07-05'),
('V002', 'C108', 'P002', '2024-07-06'),
('V003', 'C103', 'P017', '2024-07-07'),
('V004', 'C101', 'P006', '2024-07-08'),
('V005', 'C115', 'P003', '2024-07-09'),
('V006', 'C107', 'P015', '2024-07-10'),
('V007', 'C104', 'P008', '2024-07-11'),
('V008', 'C109', 'P013', '2024-07-12'),
('V009', 'C111', 'P005', '2024-07-13'),
('V010', 'C106', 'P020', '2024-07-14'),
('V011', 'C113', 'P001', '2024-07-15'),
('V012', 'C102', 'P012', '2024-07-16'),
('V013', 'C105', 'P018', '2024-07-17'),
('V014', 'C112', 'P007', '2024-07-18'),
('V015', 'C114', 'P009', '2024-07-19'),
('V016', 'C115', 'P016', '2024-07-20'),
('V017', 'C101', 'P004', '2024-07-21'),
('V018', 'C103', 'P019', '2024-07-22'),
('V019', 'C108', 'P010', '2024-07-23'),
('V020', 'C104', 'P013', '2024-07-24');
select * from visits order by clientId asc ;
/* ====================================Data Insertion in DEALS table    ==========================================*/

INSERT INTO deals (dealID, clientID, propertyID, deal_date, final_price) VALUES
('D001', 'C101', 'P003', '2024-08-01', 10450000.00),
('D002', 'C102', 'P011', '2024-08-03', 8800000.00),
('D003', 'C103', 'P001', '2024-08-04', 9750000.00),
('D004', 'C104', 'P006', '2024-08-06', 10200000.00),
('D005', 'C105', 'P015', '2024-08-07', 11250000.00),
('D006', 'C106', 'P009', '2024-08-08', 9450000.00),
('D007', 'C107', 'P014', '2024-08-09', 7600000.00),
('D008', 'C108', 'P005', '2024-08-10', 12300000.00),
('D009', 'C109', 'P020', '2024-08-12', 8950000.00),
('D010', 'C110', 'P004', '2024-08-13', 10600000.00),
('D011', 'C111', 'P002', '2024-08-14', 9300000.00),
('D012', 'C112', 'P012', '2024-08-15', 9900000.00);
select * from deals;
drop table deals ;

-- ========================================
-- 🔍 BASIC   DDL / DML  QUERIES
-- ========================================

/* 	Create a new table feedback with fields: feedbackID, clientID, comments, rating. */
create table feedback ( FeedbackID bigint primary key ,clientID varchar(15) ,
FOREIGN KEY (clientID) REFERENCES clients(clientID),
comments varchar(50) ,rating enum('Average', 'Good' , 'Bad ', 'Excellent'));
desc feedback;

/* 	Add a column rating to properties*/
alter table feedback add rating_to_properties enum('Good','Bad','Average');
desc 
 
/* 	Insert a new deal manually for a new client and property. */
INSERT INTO clients (clientID, c_name, c_email, c_phone, preferred_city) VALUES
('C122', 'Bhavika Sharma', 'bhavika.sharma@gmail.com', 9977001132, 'Thnae');
select * from clients ;

INSERT INTO properties (propertyID, title, loc, city, type, size, price, listed_Date, P_status, agentID)
VALUES ('P200', '3BHK Flat in Baner', 'Baner Road, Pune', 'Pune', 'Apartment', 1300, 8500000.00, '2024-07-01', 'Sold', 'AG005');

INSERT INTO deals (dealID, clientID, propertyID, deal_date, final_price)
VALUES ('D200', 'C122', 'P200', '2024-07-03', 8400000.00); 
select * from deals ;

/* 	Update the status of a property to 'Sold' once it's dealt.*/
update properties set p_status = 'sold' where propertyID = 'P016';
select * from properties ; 

/* Delete a visit record where the client didn't follow up.*/
SET SQL_SAFE_UPDATES = 0;
DELETE FROM visits WHERE (clientID, propertyID) NOT IN (SELECT clientID, propertyID FROM deals);
select * from visits;
select * from deals ;

/* 	Change a client’s email address.*/
update clients set c_email = 'bhavikaasharma@gmail.com' where clientID = 'C122';
select * from clients where clientID = "C122";

-- ========================================
-- 🔍 BASIC SELECT QUERIES
-- ========================================

/*	List all available properties in Mumbai.*/
select * from properties where city ="Mumbai";

/*	Show all clients and their preferred city.*/
select clientID, c_name , preferred_city from clients ;

/* 	Display the details of properties listed after June 2024 */
select  * from  properties where listed_Date >= '2024-07-01' ;
select * from agents ;

 /* Retrieve names and emails of agents with more than 5 years of experience.*/ 
 select a_name, a_email from  agents where experience > 5 ;

/*Find all properties of type "Villa" with size > 2000 sq.ft. */
select * from properties where type = "Villa" and size  > 2000;

/*Get client name, email, and contact for those who visited any property. */ 
select  c_name ,c_email , c_phone from clients where (clientId) in (select clientID from visits);

-- ========================================
-- 🔁 JOIN QUERIES
-- ========================================

/* Show properties along with the names of the agents managing them*/
select propertyID ,title , a_name from properties left join agents using (agentID);

/*List all visits with client names and property titles.*/
   select * from visits ;
   select VisitID ,c_name , title  from visits left join clients  using (clientID) 
   left join properties using ( propertyID);

/* Show deals with client names, property titles, and final deal price.*/
   select c_name, title, final_price from deals left  join clients using (clientID) 
   left join properties using ( propertyID);

/*Which clients have bought properties? Show their name, city, and deal date.*/
   select * from deals ;
   select c_name, city, deal_date from deals left join clients using(clientID) 
   left join properties using ( propertyID);

/*List each agent and how many properties they are managing.*/
   select agentID , a_name , count(propertyID) as properties_managed_by_agents from agents 
   left join properties using(agentID) group by agentID;

/*List each client and number of properties they visited.*/
   select c_name , count(propertyID) as property_visited from visits 
   inner join clients using (clientID) group by clientID;

-- ========================================
-- 📊 AGGREGATE & GROUP BY QUERIES
-- ========================================

/*Count of properties available in each city.*/
   select city ,count(*) as Available_property from properties  where P_status ='Available' group by city;

/*Find the average deal price per property type.*/
    select type , avg(final_price) from deals left join properties using (propertyID) group by type ;

/*Show top 3 cities with the highest number of property visits.*/
    select city , count(visitID) as total_visits from properties  join  visits using(propertyId) group by city order by
    total_visits desc limit 3 ; 

/*Get total revenue generated by each agent (based on deals).*/
    select agents.agentID , a_name , sum(final_price) as revenue from agents 
    join properties on agents.agentID = properties.agentID 
    join deals using (propertyID)  group by agents.agentID,a_name;

/*Number of clients per preferred city.*/
    select count(clientId), preferred_city from clients group by preferred_city ;

/*Find maximum property size per city.*/
    select city , max(size) from properties group by city ;

-- ========================================
-- 🔎 SUBQUERIES
-- ========================================

/*List properties that have never been visited.*/
    select * from properties where propertyID not in (select propertyID from visits);

/*Find clients who visited more than 1 property.*/
    select * from clients where clientID in(select clientID from visits 
    group by clientID having count(distinct propertyID)>1);

/*Who bought the most expensive property? Show name and deal price*/
    select c_name ,final_price as deal_price from clients join deals using(clientID) 
    where final_price=(select max(final_price) from deals);

/*Which agent handled the property with the highest deal?*/
    select agentID , a_name , final_price  from deals join properties using (propertyID) 
    join agents using (agentID) where final_price = (select max(final_price) from deals );

/*List clients who visited but never bought a property.*/
     select c_name , clientId ,visitID from clients join visits using(clientId) 
     where clientId not in (select clientID from deals);

/*Show all agents who managed at least 2 sold properties.*/
    select agentID, a_name from agents where agentID 
    in (select agentID from properties where p_status = 'sold' group by agentId having count(*) >= 2);
