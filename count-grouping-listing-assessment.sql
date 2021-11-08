--- How many unique values of "type" are there? 
SELECT COUNT(DISTINCT type) 
FROM planes;

-- Match the year to the number of records.

SELECT year, COUNT(year) AS number_of_records
FROM planes
GROUP BY year
ORDER BY year;

-- How many records for the "engine" = 'Turbo-jet' are there?

SELECT COUNT(*) AS number_of_records
FROM planes
WHERE engine = 'Turbo-jet';


-- Which "engine" type has the most records?

SELECT engine, COUNT(engine) AS number_of_records
FROM planes
GROUP BY engine
ORDER BY number_of_records DESC;

-- How many years is the "BOEING" manufacturer 
-- and the "757-222" model in the database?

SELECT COUNT(DISTINCT year)
FROM planes
WHERE model = '757-222'
AND manufacturer = 'BOEING'; 