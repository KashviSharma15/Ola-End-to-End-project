create database Ola;
use Ola;
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
-- 7. Retrieve all rides where payment was made using UPI:
-- 8. Find the average customer rating per vehicle type:
-- 9. Calculate the total booking value of rides completed successfully:
-- 10. List all incomplete rides along with the reason:
