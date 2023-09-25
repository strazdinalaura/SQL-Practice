#Top 3 Categories by Money Raised
SELECT 
    ct.name AS CategoryName,
    SUM(cp.pledged * cu.conversion_rate_to_usd) AS TotalMoneyRaisedUSD
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    category AS ct ON sc.category_id = ct.id
JOIN
    currency AS cu ON cp.currency_id = cu.id
GROUP BY 
    ct.name
ORDER BY 
    TotalMoneyRaisedUSD DESC
LIMIT 3;

-- Bottom 3 Categories by Money Raised
SELECT 
    ct.name AS CategoryName,
    SUM(cp.pledged * cu.conversion_rate_to_usd) AS TotalMoneyRaisedUSD
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    category AS ct ON sc.category_id = ct.id
JOIN
    currency AS cu ON cp.currency_id = cu.id
GROUP BY 
    ct.name
ORDER BY 
    TotalMoneyRaisedUSD ASC
LIMIT 3;



#Top 3 Sub-Categories by Money Raised
SELECT 
    sc.name AS SubCategoryName,
    SUM(cp.pledged * cu.conversion_rate_to_usd) AS TotalMoneyRaisedUSD
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    currency AS cu ON cp.currency_id = cu.id
GROUP BY 
    sc.name
ORDER BY 
    TotalMoneyRaisedUSD DESC
LIMIT 3;

#Bottom 3 Sub-Categories by Money Raised
SELECT 
    sc.name AS SubCategoryName,
    SUM(cp.pledged * cu.conversion_rate_to_usd) AS TotalMoneyRaisedUSD
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    currency AS cu ON cp.currency_id = cu.id
GROUP BY 
    sc.name
ORDER BY 
    TotalMoneyRaisedUSD ASC
LIMIT 3;





