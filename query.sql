-- drop database Ola;
-- create database Ola;
-- use Ola;
-- 1. Retrieve all successful bookings:

create view successful_bookings as
Select * from Bookings where Booking_Status = 'Success' ;

Select * from successful_bookings;

-- 2. Find the average ride distance for each vehicle type:

create view ride_distance as
Select Vehicle_Type, avg(Ride_Distance) as avg_distance from Bookings group by Vehicle_Type;

Select * from ride_distance;

-- 3. Get the total number of cancelled rides by customers:

create view cancelled_rides as
Select count(*) from Bookings where Canceled_Rides_by_Customer != 'null' ;

Select * from cancelled_rides;

-- 4. List the top 5 customers who booked the highest number of rides:
create view top_5 as
Select Customer_ID , count(*) as ride_count from Bookings group by Customer_ID order by ride_count desc limit 5 ;

Select * from top_5;

-- 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view cancelled_rides_drivers as
Select count(*) from Bookings where Canceled_Rides_by_Driver != 'Personal & Car' ;

Select * from cancelled_rides_drivers;

-- 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view  Max_Min_Driver_Rating as
Select max(Driver_Ratings) as max_rate, min(Driver_Ratings) as min_rate from Bookings where Vehicle_Type = "Prime Sedan" ;

-- 7. Retrieve all rides where payment was made using UPI:

create view Payment_method_UPI as
select * from Bookings where Payment_method = "UPI";

-- 8. Find the average customer rating per vehicle type:

create view Rating_per_vehicle as 
select Vehicle_type , avg(Customer_Rating) from Bookings group by Vehicle_type;

-- 9. Calculate the total booking value of rides completed successfully:

create view total_successful_value as
select sum(Booking_value) as total_successful_value from bookings where Booking_Status = "Success";

-- 10. List all incomplete rides along with the reason:

create view incomplete_rides as
select Booking_id , Incomplete_Rides_reason from Bookings where Incomplete_Rides = "Yes";
