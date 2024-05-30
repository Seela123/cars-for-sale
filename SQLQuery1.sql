--    1.Retrieve all columns for all cars in the table.

SELECT * FROM cars

-- 2.Retrieve the total count of cars in the table.

SELECT COUNT(*) FROM cars

--  3.Retrieve the distinct list of car brands available in the table.

SELECT DISTINCT(brand) FROM cars

-- 4.Find the oldest and newest cars in the table based on the year.

--BEST_YEAR
SELECT Brand,model,Year,Transmission,Owner_Type FROM cars
ORDER BY Year DESC
--OLDES YEAR
SELECT Brand,model,Year,Transmission,Owner_Type FROM cars
ORDER BY Year


-- 5.Calculate the average mileage of all cars in the table.

SELECT Car_ID,Brand,model,Year,Kilometers_Driven,Fuel_Type,Transmission,Owner_Type,Engine,power,seats,price,AVG(mileage) AS AVG_mileage 
FROM cars
GROUP BY Car_ID,Brand,model,Year,Kilometers_Driven,Fuel_Type,Transmission,Owner_Type,Engine,power,seats,price

-- 6.Find the car with the highest power (horsepower or kW) in the table.

SELECT * FROM cars
ORDER BY Power DESC

--7.Retrieve all cars with a transmission type of 'Automatic'.

SELECT * FROM Cars
WHERE Transmission = 'Automatic'

-- 8.Find the total number of seats available across all cars.

SELECT SUM (seats) AS all_Seats FROM cars

-- 9.Retrieve the details of cars with a price greater than $20,000.
SELECT * FROM cars
WHERE price > 20000

-- 10.Find the average price of cars for each brand in the table.

SELECT DISTINCT(brand),AVG(price) AS AVAERAGE_PRICE FROM cars
GROUP BY Brand

--11.Retrieve the top 5 most fuel-efficient cars in the table based on mileage.

SELECT TOP 5 * FROM cars
ORDER BY Mileage DESC

--12.Count the number of cars for each fuel type in the table.

SELECT Fuel_Type,COUNT(fuel_type) AS nr_fultype
FROM Cars
GROUP BY Fuel_Type

-- 13.Retrieve the details of cars with more than 100,000 kilometers on the odometer.

SELECT * FROM cars
WHERE Kilometers_Driven > 100000

--14.Find the total price of all cars in the table.

SELECT SUM(	PRICE) AS TOTAL_PRICE 
FROM cars

--15.Retrieve the details of cars with a model year between 2018 and 2020.

SELECT * FROM cars
WHERE YEAR BETWEEN 2018 AND 2020


--16.Create one view with Min Avg Max and Total price 

CREATE VIEW price AS (
SELECT c1.Brand,
MIN(c1.price) AS Min_Price,
AVG(c2.price) AS Avg_price,
MAX(c3.price) AS Max_price,
SUM(c4.price) AS Total_price
FROM cars C1
LEFT JOIN cars c2
ON c1.Brand = c2.Brand
LEFT JOIN cars c3
ON c2.Price = c3.Price
LEFT JOIN cars c4
ON C1.Car_ID = c4.Car_ID
GROUP BY c1.Brand)

CREATE VIEW car_prices AS (
    SELECT 
        Brand,
        MIN(price) AS Min_Price,
        AVG(price) AS Avg_Price,
        MAX(price) AS Max_Price,
        SUM(price) AS Total_Price
    FROM cars
    GROUP BY Brand
);

SELECT * FROM car_prices;
SELECT * FROM price