-- decription of dataset 
DESC zomato;

-- Check for duplicate (restaurant entries based on the 'restaurant name' column)
SELECT 
    restaurant_name, COUNT(*) AS count
FROM
    zomato
GROUP BY restaurant_name
HAVING COUNT(*) > 1;
	
-- Checking rows with invalid entries 
SELECT 
    *
FROM
    zomato
WHERE
    restaurant_name LIKE '\'%'
        OR restaurant_name LIKE '-%'
        OR restaurant_name LIKE '%Âƒ%';

-- update #1 (removing entries that begin with ''@')
UPDATE zomato 
SET 
    restaurant_name = SUBSTRING(restaurant_name, 2)
WHERE
    restaurant_name LIKE '_@%';

-- update #2 (removing entries that begin with '@')
UPDATE zomato 
SET 
    restaurant_name = SUBSTRING(restaurant_name, 2)
WHERE
    restaurant_name LIKE '@%';

-- update #3 (removing entries that begin with '#')
UPDATE zomato 
SET 
    restaurant_name = SUBSTRING(restaurant_name, 2)
WHERE
    restaurant_name LIKE '#%';

-- update #4 Removing rows with character encoding problems
-- These rows will be deleted entirely from the table
DELETE FROM zomato
WHERE  restaurant_name LIKE '%Âƒ%';

-- distinct values in the 'table_booking' column
SELECT DISTINCT(table_booking) FROM zomato;

-- distinct values in the 'online_order' column
SELECT DISTINCT(online_order) FROM zomato;

-- Check for valid values in the 'rate' column (1 to 5)
SELECT *
FROM zomato
WHERE rate NOT BETWEEN 1 AND 5;

-- Count the number of restaurants in each area
SELECT area, COUNT(*) as restaurant_count
FROM zomato
GROUP BY area
ORDER BY restaurant_count DESC;

-- Count the number of restaurants at each local address
SELECT local_address, COUNT(*) as restaurant_count
FROM zomato
GROUP BY local_address
ORDER BY restaurant_count DESC;

-- Count the number of restaurants offering online ordering
SELECT online_order, COUNT(*) as count
FROM zomato
GROUP BY online_order;

-- Count the number of restaurants offering table booking
SELECT table_booking, COUNT(*) as count
FROM zomato
GROUP BY table_booking;

-- checking for missing values 
SELECT 
  COLUMN_NAME, 
  COUNT(*) as missing_count
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'zomato'
  AND COLUMN_NAME IS NULL
GROUP BY COLUMN_NAME;

-- cusines
-- This query extracts individual cuisines from the 'cuisine' column, which contains a set of cuisines for each restaurant.
-- It separates these cuisines into distinct rows, creating a new column to display them individually.
-- The query then counts the occurrences of each individual cuisine, helping analyze the distribution of cuisines in the dataset.
SELECT
  TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(cuisine, ',', seq), ',', -1)) AS individual_cuisine,
  COUNT(*) AS count_in_rows
FROM
  zomato
CROSS JOIN (
  SELECT 1 AS seq UNION SELECT 2 UNION SELECT 3 -- Add more UNION SELECT statements for the maximum number of cuisines in a row
) seq_numbers
GROUP BY individual_cuisine
ORDER BY count_in_rows DESC;




	




