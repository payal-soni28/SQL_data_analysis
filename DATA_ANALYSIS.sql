select * from zomato;
-- A.Rating Analysis:
-- What is the average rating of restaurants in each area/local address?
-- (note-We'll be using a weighted average to account for the varying number of ratings (i.e., "num_ratings") that each restaurant has received.)
SELECT 
    area,
    local_address,
    ROUND(SUM(rate * num_ratings) / SUM(num_ratings),
            1) AS weighted_average_rating
FROM
    zomato
GROUP BY local_address
ORDER BY weighted_average_rating DESC;


-- Find the area/local address with the highest rating.
SELECT 
    area,
    local_address,
    ROUND(SUM(rate * num_ratings) / SUM(num_ratings),
            1) AS highest_rating
FROM
    zomato
GROUP BY area , local_address
ORDER BY highest_rating DESC
LIMIT 1;

-- Find the area/local address with the lowest rating.
SELECT 
    area,
    local_address,
    ROUND(SUM(rate * num_ratings) / SUM(num_ratings),
            1) AS lowest_rating
FROM
    zomato
GROUP BY area , local_address
ORDER BY lowest_rating ASC
LIMIT 1;

-- What is the percentage of restaurants with a rating above 4.5 in the dataset?

SELECT 
    (SUM(CASE
        WHEN rate > 4.5 THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS high_rated_percentage
FROM
    zomato;

-- Compare the Rating of restaurants that offer and don’t offer online booking.
-- Calculate weighted average rating for restaurants offering online booking
SELECT 
    online_order,
    ROUND(SUM(rate * num_ratings) / SUM(num_ratings),
            1) AS average_rating
FROM
    zomato
WHERE
    online_order = 'Yes'
GROUP BY online_order;

-- Calculate weighted average rating for restaurants NOT offering online booking
SELECT 
    online_order,
    ROUND(SUM(rate * num_ratings) / SUM(num_ratings),
            1) AS average_rating
FROM
    zomato
WHERE
    online_order = 'No'
GROUP BY online_order;

-- B. Online Orders and Table Bookings:
-- How many restaurants in each area offer online orders?
SELECT 
    area,
    local_address,
    COUNT(*) AS num_restaurants_with_online_orders
FROM
    zomato
WHERE
    online_order = 'Yes'
GROUP BY area , local_address
ORDER BY num_restaurants_with_online_orders DESC;

-- How many restaurants in each area offer table bookings?
SELECT 
    area,
    COUNT(*) AS num_restaurants_with_table_bookings
FROM
    zomato
WHERE
    table_booking = 'Yes'
GROUP BY area , local_address;

-- areas/local addresses where restaurants offer both online orders AND table bookings?
SELECT 
    area, local_address
FROM
    zomato
GROUP BY area , local_address
HAVING SUM(CASE
    WHEN
        online_order = 'Yes'
            AND table_booking = 'Yes'
    THEN
        1
    ELSE 0
END) = COUNT(*);

-- Identify the areas/local addresses with the highest percentage of restaurants offering online orders.
SELECT 
    local_address,
    ROUND((COUNT(CASE
                WHEN online_order = 'Yes' THEN 1
                ELSE NULL
            END) / COUNT(*)) * 100,
            2) AS percentage_online_order
FROM
    zomato
GROUP BY local_address
ORDER BY percentage_online_order DESC;

-- C. Cost Analysis:
-- What is the distribution of average costs for two people in the dataset?
SELECT
    CONCAT(FLOOR(avg_cost / 100) * 100, '-', (FLOOR(avg_cost / 100) * 100 + 100)) AS cost_range_for_two,
    COUNT(*) AS number_of_restaurants
FROM
    zomato
WHERE
    avg_cost >= 100
    AND avg_cost <= 2500
GROUP BY
    cost_range_for_two
ORDER BY
    CAST(SUBSTRING_INDEX(cost_range_for_two, '-', 1) AS SIGNED);




-- Compare the average cost by area/local address.
SELECT
    area,
    local_address,
    AVG(avg_cost) AS average_cost
FROM
    zomato
GROUP BY area, local_address
ORDER BY area, local_address;

-- Areas with the highest average costs
SELECT 
    area, local_address, AVG(avg_cost) AS average_cost
FROM
    zomato
GROUP BY area , local_address
ORDER BY average_cost DESC
LIMIT 5;


-- Areas with the lowest average costs
SELECT 
    area, local_address, AVG(avg_cost) AS average_cost
FROM
    zomato
GROUP BY area , local_address
ORDER BY average_cost ASC
LIMIT 5;

-- Analyse if restaurants offering online orders and table bookings tend to have higher or lower average costs.
SELECT
    online_order,
    table_booking,
    AVG(avg_cost) AS avg_cost,
    AVG((rate * num_ratings) / num_ratings) AS avg_rating
FROM
    zomato
GROUP BY online_order, table_booking