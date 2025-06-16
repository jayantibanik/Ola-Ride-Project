-- SQL Questions

--1. Retrive all successful bookings:

CREATE VIEW Successful_Bookings AS

SELECT * FROM  bookings

WHERE Booking_Status= 'Success';

SELECT * FROM Successful_Bookings;   ---- For final result



--2. Find the average ride distance for each vehicle type:

CREATE VIEW Ride_Distance_For_Each_Vehicle AS

SELECT Vehicle_Type, ROUND(AVG(Ride_Distance),2) AS 

Avg_Distance

FROM  bookings 

GROUP BY Vehicle_Type;

SELECT * FROM Ride_Distance_For_Each_Vehicle;    ---- For final result



--3. Get total number of cancelled rides by customers:

CREATE VIEW Rides_Cancelled_by_Customer AS

SELECT COUNT(Booking_ID) AS Total_Rides

FROM bookings

WHERE Booking_Status= 'Canceled by Customer';

SELECT * FROM Rides_Cancelled_by_Customer;    ---- For final result



--4. List the top 5 customers who booked the highest number of rides:

CREATE VIEW Top_5_Customers_by_Bookings AS

SELECT Customer_ID,COUNT(Booking_ID) AS No_of_Rides

FROM bookings WHERE Booking_Status = "Success"

GROUP BY Customer_ID

ORDER BY No_of_Rides DESC

LIMIT 5;

SELECT * FROM Top_5_Customers_by_Bookings;   ---- For final result




--5. Get the numbers of rides cancelled by drivers due to personal and car-related issues:

CREATE VIEW Total_Ride_Cancelled_By_Drivers AS

SELECT COUNT(Booking_ID) AS Total_Ride_Cancelled

FROM bookings

WHERE Canceled_Rides_by_Driver='Personal & Car related issue';

SELECT * FROM Total_Ride_Cancelled_By_Drivers;   ---- For final result



--6. Find the minimum and maximum driver ratings for Prime Sedan Bookings:

CREATE VIEW MIN_MAX_Rating_For_PrimeSedan AS

SELECT MAX(Driver_Ratings) AS MAX_Rating, Min(Driver_Ratings) AS Min_Rating

FROM bookings

WHERE Vehicle_Type='Prime Sedan';

SELECT * FROM MIN_MAX_Rating_For_PrimeSedan;    ---- For final result



--7. Retrieve all rides where payments was made using UPI:

CREATE VIEW Ride_Payments_UPI AS 

SELECT COUNT(*)  AS Total_Rides FROM bookings

WHERE Payment_Method='UPI';

SELECT * FROM  Ride_Payments_UPI;   ---- For final result



--8. Find the average customer rating per vehicle type:

CREATE VIEW AVG_Payment_Per_Vehicle_Type AS

SELECT Vehicle_Type, ROUND(AVG(Booking_Value),2) AS AVG_Payment

FROM bookings 

GROUP BY Vehicle_Type;

SELECT * FROM AVG_Payment_Per_Vehicle_Type;   ---- For final result



--9. Calculate the total booking value of rides completed successfully:

CREATE VIEW Total_Payment_Successful_Ride AS

SELECT SUM(Booking_Value) AS Total_Payment 

FROM bookings

WHERE Booking_Status='Success' ;

SELECT * FROM Total_Payment_Successful_Ride;    ---- For final result



--10. List all incomplete rides along with the reason:

CREATE VIEW Unsuccessful_Ride_Reasons AS

SELECT Booking_ID,Incomplete_Rides_Reason

FROM bookings

WHERE Incomplete_Rides='Yes'; 

SELECT * FROM Unsuccessful_Ride_Reasons ;   ---- For final result



--11. Average of Daily Revenue Earned:

CREATE VIEW Daily_Avg_Revenue AS

SELECT ROUND(AVG(Total_Revenue))  AS Daily_Avg_Revenue

FROM(

SELECT Date,SUM(Booking_Value) AS Total_Revenue

FROM bookings WHERE Booking_Status = "Success"

GROUP BY Date) AS inner_query;

SELECT * FROM Daily_Avg_Revenue;   --- For final result

 



