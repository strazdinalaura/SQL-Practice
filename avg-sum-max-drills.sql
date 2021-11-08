-- the average saleprice per neighborhood and per yearbuilt.
SELECT ROUND(AVG(saleprice), 2) AS avg_houseprice, COUNT(saleprice) AS count_houseprice, yearbuilt, neighborhood
FROM houseprices
GROUP BY yearbuilt, neighborhood
ORDER BY neighborhood, yearbuilt DESC; -- first, it sorts by neighborhood (A-Z), then from desc year

-- using several aggregates in conjunction provides a more holistic exploratory look at the data.
SELECT AVG(lotfrontage)
FROM houseprices;

-- vs

SELECT SUM(lotfrontage) AS sum_lotfrontage, 
COUNT(*) count_all_records,
COUNT(lotfrontage) AS count_lotfront_records,
AVG(lotfrontage) AS avg_lotfrontage -- excludes NULL values from the denominator which is the count of ALL records
FROM houseprices;


-- Using aggregative functions of NULL (to exclude zeros from aggregation)
-- This is a ratio of garagearea to garagecars for each record.
SELECT garagetype, AVG(garagearea/NULLIF(garagecars,0)) AS avg_area_per_garage_bay -- NULLIF to exclude 0 from aggregation bc aggregation is based on the count of records zeros included, NULLIF makes 0 into NULL
FROM houseprices
GROUP BY garagetype;


SELECT SUM(lotfrontage) AS sum_lotfront, lotshape, street
FROM houseprices
WHERE yearbuilt < 1980
GROUP BY lotshape, street
ORDER BY sum_lotfront DESC;
-- NULL isn't treated as a 0 when summing. It's its own value that actually defaults to the top of the list when sorting in descending order.

-- What's the maximum sale price for all records, grouped by the year they were sold and the style of house? 
-- Sort the output by style of house from A to Z and then by sale price from high to low.
SELECT MAX(saleprice) AS max_salesprice, yrsold, housestyle
FROM houseprices
GROUP BY yrsold, housestyle
ORDER BY housestyle, max_salesprice DESC;

-- What is the smallest lot area for each style of roof for houses built in 1970 or later, 
--sorted from high to low?
SELECT MIN(lotarea) AS min_lotarea, roofstyle
FROM houseprices
WHERE yearbuilt >= 1970
GROUP BY roofstyle
ORDER BY min_lotarea DESC;
