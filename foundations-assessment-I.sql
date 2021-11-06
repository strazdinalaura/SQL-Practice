-- Select all records
SELECT * 
FROM purchases;

SELECT COUNT(*)
FROM purchases;

--Write a query that returns the count of records for the months after May. tore this in an alias named num_after_may.

SELECT COUNT(*) AS num_after_may 
FROM purchases 
WHERE EXTRACT(MONTH FROM created_at) > 5;

--Write a query that returns the name of the customer and the state for all the purchases made in Florida.
SELECT name, state
FROM purchases
WHERE state='FL';

--Write a query that returns the count of purchases in zipcode 11065.
SELECT COUNT(*)
FROM purchases
WHERE zipcode = 11065;

--Write a query that returns the count of purchases where the user_id is between 1 and 10 inclusive and where the states are not Florida or Georgia.
SELECT COUNT(*)
FROM purchases
WHERE user_id >= 1 AND user_id <= 10
	AND state NOT IN('FL','GA');


-- Write a query that returns the count of purchases from the zipcodes 99652, 11065, and 66513.
SELECT COUNT(*)
FROM purchases
WHERE zipcode IN(99652,11065,66513);

--Write a query that returns the count of all user_id records between 10 and 50, exclusive of the user_ids 20 and 30.
SELECT COUNT(*)
FROM purchases
WHERE user_id >=10 AND user_id <=50
	AND user_id NOT IN(20,30);

-- Write a query that returns the name, address, state, and zipcode from all purchases.
-- For the names, return only the first 5 characters, and display them in all uppercase letters, sorted in alphabetical order.
SELECT UPPER(LEFT(name,5)), address, state, zipcode
FROM purchases
ORDER BY name;

-- Write a query that returns a new field called name_date that combines the name and date fields with the labels ‘name:’ and ‘date:’. Your first row should look like this:
SELECT CONCAT('name: ', name,';', ' ', 'date: ', DATE(created_at)) AS name_date
FROM purchases;

-- You want to know if any of the zip codes are missing (null). Write a query that finds all of the null zip codes and list this by name.
SELECT name, zipcode
FROM purchases
WHERE zipcode IS NULL;

-- Write a query that returns user_id, created_at, name and address for all records where the state is Georgia and user_id is 18, 
-- or where the user_id is 20 with any state. 
-- Order the list by the date that the order was created from newest to oldest.

SELECT user_id, created_at, name, address
FROM purchases
WHERE user_id = 18 AND state = 'GA'
OR user_id = 20
ORDER BY created_at DESC;

-- Write a query that returns name, address, state, and zipcode 
--where (1) the state is Illinois, (2) or the zipcode is between 30000 and 80000, 
--and the first two characters in the address are 23 or 12, 
--and the state is either Colorado, Texas, or Wyoming.

SELECT name, address, state, zipcode 
FROM purchases 
WHERE state = 'IL' OR (zipcode BETWEEN 30000 AND 80000 
	AND (address LIKE '23%' OR address LIKE '12%')
	AND state IN('TX', 'CO', 'WY'));


-- Write a query that returns all the records for the top 10 purchases with the highest zip code number (descending order).
SELECT *
FROM purchases
ORDER BY zipcode DESC
LIMIT 10;
	
-- Write a query that returns all the records of purchases where the buyer's first name starts with a capital "S". Sort the list by name.
SELECT *
FROM purchases
WHERE name LIKE 'S%'
ORDER BY name;

-- Write a query that returns all the records of purchases where the buyer's first name starts with a capital "S" or a capital "T". Sort the list by name.
SELECT *
FROM purchases
WHERE name LIKE 'S%' OR name LIKE 'T%'
ORDER BY name;

-- Write a query that returns the count of records where the size of the name field is greater than or equal to 15 characters.
SELECT COUNT(name)
FROM purchases
WHERE LENGTH(name) >= 15;

-- Write a query that returns the count of all records 
-- where state starts with a letter greater than "M", zipcode is greater than 50000, 
-- and user_id is greater than 10 (all non-inclusive).
SELECT COUNT(*)
FROM purchases
WHERE (state LIKE 'N%' OR state LIKE 'O%' OR state LIKE 'P%' OR state LIKE 'Q%' OR state LIKE 'R%' OR state LIKE 'S%' OR state LIKE 'T%' OR state LIKE 'U%' OR state LIKE 'V%'OR state LIKE 'W%' OR state LIKE'X%' OR state LIKE 'Y%' OR state LIKE 'Z%')
AND zipcode > 50000 AND user_id > 10;

-- Write a query that returns all records where the buyer name has a (lowercase) "e" in its 3rd position.
SELECT *
FROM purchases 
WHERE name LIKE '__e%';
	







