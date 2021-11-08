
SELECT COUNT(*)
FROM houseprices
where yearbuilt > 1950;
-- returns 1122


SELECT DISTINCT yearbuilt
FROM houseprices
where yearbuilt > 1950;
-- returns 60 rows with disctint years 

SELECT DISTINCT yearbuilt, neighborhood
from houseprices;
-- return 501 rows with unique combinations of yearbuilt & neighborhood 

SELECT COUNT(DISTINCT yearbuilt), COUNT(DISTINCT neighborhood)
FROM houseprices;
-- returns 1 row with 2 columns = count of unique years and count  of unique neighborhoods

SELECT COUNT(DISTINCT yearbuilt), COUNT(DISTINCT neighborhood)
FROM houseprices
WHERE yearbuilt < 2000 AND neighborhood NOT LIKE 'G%';

-- Using aggregates and nonaggregates together
SELECT COUNT(neighborhood), COUNT(yearbuilt)
FROM houseprices;
-- returns count of both 1460 and 1460

-- Need to get how many of yearbuilt is in each neighborhood 
SELECT neighborhood, COUNT(DISTINCT(yearbuilt))
FROM houseprices
GROUP BY neighborhood;
-- returns how many count of years in each neighborhood

SELECT COUNT(neighborhood), yearbuilt
FROM houseprices
GROUP BY yearbuilt;

SELECT COUNT(*), neighborhood
FROM houseprices
WHERE saleprice > 10000 AND yearbuilt < 1950
GROUP BY neighborhood
ORDER BY neighborhood; -- this sorts neighborhoods A-Z

-- GROUP BY and aliasing

SELECT COUNT(*), neighborhood
FROM houseprices
WHERE saleprice > 100000 AND yearbuilt < 1950
GROUP BY neighborhood
ORDER BY COUNT(*); -- sorting LOW TO HIGH instead of A-Z

SELECT COUNT(*) AS count_houses, neighborhood
FROM houseprices
WHERE saleprice > 100000 AND yearbuilt < 1950
GROUP BY neighborhood
ORDER BY count_houses DESC;

-- GROUP BY multiple fields (the NONagreggated field that appear in SELECT statement has to also appear in GROUP BY clause)

-- RETURNING records by year, sorted in DESC 
SELECT COUNT(*), yearbuilt
FROM houseprices
GROUP BY yearbuilt
ORDER BY yearbuilt DESC;

-- breaking the count into yearbuilt AND housestyle
SELECT COUNT(*), yearbuilt, housestyle
FROM houseprices
GROUP BY yearbuilt, housestyle
ORDER BY yearbuilt DESC;

-- changing statement order
SELECT yearbuilt, housestyle, COUNT(*)
FROM houseprices
GROUP BY yearbuilt, housestyle
ORDER BY yearbuilt DESC, housestyle;

-- COUNT multiple fields
SELECT COUNT(*) AS count_records, COUNT(alley) AS count_alleys, neighborhood
FROM houseprices
WHERE yearbuilt > 1990
GROUP BY neighborhood
ORDER BY count_alleys DESC;

-- COUNT and GROUP BY multiple fields
-- example statement:
-- getting a count of all records (*) and a count of alley, 
-- grouped by neighborhood, sorted ascending, and street
SELECT COUNT(*) AS count_records, COUNT(alley) AS count_alleys, neighborhood, street
FROM houseprices
GROUP BY neighborhood, street -- sorted asc and street
ORDER BY neighborhood; -- grouped by neighborhood

-- COUNT and GROUP BY the same field
SELECT COUNT(roofstyle), neighborhood
FROM houseprices
GROUP BY neighborhood;

-- returns a count of unique roofstyles in each neighborhood (sorted by neighborhood A-Z)
SELECT COUNT(DISTINCT roofstyle), neighborhood
FROM houseprices
GROUP BY neighborhood;



-- get a count of roofstyle 
-- and to group by unique roof styles per neighborhood
SELECT neighborhood, roofstyle, COUNT(roofstyle) AS count_roofstyle
FROM houseprices
GROUP BY roofstyle, neighborhood
ORDER BY neighborhood, roofstyle, count_roofstyle; -- first it groups by roof styles (like clusters), then neighborhoods, etc





