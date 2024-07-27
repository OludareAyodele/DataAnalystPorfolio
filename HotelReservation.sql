create database Hotel_Reservation;

Use Hotel_Reservation;

show tables;

-- checking the structure of the table.
describe `hotel reservations`;

select * from `hotel reservations`;

select count(*) from `hotel reservations`;

alter table `hotel reservations` add column Serial_No int primary key auto_increment first;

select distinct type_of_meal_plan from `hotel reservations`;

select distinct market_segment_type from `hotel reservations`;

select distinct room_type_reserved from `hotel reservations`;

select * from `hotel reservations`;

-- Deleting irelevant columnfrom the table
alter table `hotel reservations` drop column no_of_previous_bookings_not_canceled;
alter table `hotel reservations` drop column arrival_date;
alter table `hotel reservations` drop column no_of_adults;

alter table `hotel reservations` drop column no_of_children;
alter table `hotel reservations` drop column no_of_weekend_nights;
alter table `hotel reservations` drop column no_of_week_nights;

select * from `hotel reservations`;

alter table `hotel reservations` add column `Arrival Month` varchar(20) after arrival_month;

set sql_safe_updates = 0;
start transaction;

-- Conditional formating for Arrival_month column to get more insight
start transaction;
update `hotel reservations` set `Arrival Month` = case
 when arrival_month = '1' then 'January'
 when arrival_month = '2' then 'February'
 when arrival_month = '3' then 'March'
 when arrival_month = '4' then 'April'
 when arrival_month = '5' then 'May'
 when arrival_month = '6' then 'June'
 when arrival_month = '7' then 'July'
 when arrival_month = '8' then 'August'
 when arrival_month = '9' then 'September'
 when arrival_month = '10' then 'October'
 when arrival_month = '11' then 'November'
 when arrival_month = '12' then 'December'
 else arrival_month
 end;
 
 select * from `hotel reservations`;
 
 select distinct avg_price_per_room from `hotel reservations`;

select MAX(avg_price_per_room) from `hotel reservations`;
select min(avg_price_per_room) from `hotel reservations`;

select distinct `Arrival Month` from `hotel reservations`;

alter table `hotel reservations` drop column arrival_month;

select * from `hotel reservations`;

select distinct required_car_parking_space from `hotel reservations`;

alter table `hotel reservations` add column 
`Required ParkingSpace` varchar(4) after required_car_parking_space;

-- Categorizing Required Parkinspace column to get more insight
start transaction;
update `hotel reservations` set `Required ParkingSpace` = case
 when required_car_parking_space = '1' then 'Yes'
 when required_car_parking_space = '0' then 'No'
 else required_car_parking_space
 end;

select * from `hotel reservations`;

alter table `hotel reservations` drop column required_car_parking_space;

select MAX(lead_time) from `hotel reservations`;
select min(lead_time) from `hotel reservations`;

select distinct no_of_special_requests from `hotel reservations`;

-- Adding a new column.
alter table `hotel reservations` add column 
`Special Request` varchar(15) after no_of_special_requests;

-- Categorizing Special Request column to get more insight
start transaction;
update `hotel reservations` set `Special Request` = case
 when no_of_special_requests = '0' then 'No S_Request'
 when no_of_special_requests = '1' then 'Once'
 when no_of_special_requests = '2' then '2times'
 when no_of_special_requests = '3' then '3times'
 when no_of_special_requests = '4' then '4times'
 when no_of_special_requests = '5' then '5times'
 else no_of_special_requests
 end;

select * from `hotel reservations`;

select count(*) from `hotel reservations`;

select distinct no_of_previous_cancellations from `hotel reservations`;

select * from `hotel reservations` where arrival_year = '';

alter table `hotel reservations` add column 
`Repeated Guest` varchar(4) after repeated_guest;

-- Categorizing Reapet Guest column to get more insight
start transaction;
update `hotel reservations` set `Repeated Guest` = case
 when repeated_guest = '1' then 'Yes'
 when repeated_guest = '0' then 'No'
 else repeated_guest
 end;
 
 select * from `hotel reservations`;
 
 alter table `hotel reservations` drop column repeated_guest;
 
 alter table `hotel reservations` add column 
`Previous Cancellations` varchar(20) after no_of_previous_cancellations;
 
 -- Categorizing number of previous cancellation to get more insight
 start transaction;
 update `hotel reservations` set `Previous Cancellations` = case
when no_of_previous_cancellations = '0' then 'None'
when no_of_previous_cancellations between 1 and 3 then 'Sporadic'
when no_of_previous_cancellations between 4 and 6 then 'Consistent'
when no_of_previous_cancellations between 11 and 13 then 'High_Consistent'
else no_of_previous_cancellations
end;
 
 select * from `hotel reservations`;
 







































































rollback;
set sql_safe_updates = 1;



select distinct avg_price_per_room from `hotel reservations`;

select MAX(avg_price_per_room) from `hotel reservations`;
select min(avg_price_per_room) from `hotel reservations`;


