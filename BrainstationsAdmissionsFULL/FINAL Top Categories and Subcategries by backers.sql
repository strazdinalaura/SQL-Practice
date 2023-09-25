#top 3 categories by backers
SELECT 
    ct.name AS CategoryName,
    SUM(cp.backers) AS TotalBackers
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    category AS ct ON sc.category_id = ct.id
GROUP BY 
    ct.name
ORDER BY 
    TotalBackers DESC
LIMIT 3;

#Botton 3 categories by backers

SELECT 
    ct.name AS CategoryName,
    SUM(cp.backers) AS TotalBackers
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    category AS ct ON sc.category_id = ct.id
GROUP BY 
    ct.name
ORDER BY 
    TotalBackers ASC
LIMIT 3;



#Top 3 Sub-Categories by Backers
SELECT 
    sc.name AS SubCategoryName,
    SUM(cp.backers) AS TotalBackers
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
GROUP BY 
    sc.name
ORDER BY 
    TotalBackers DESC
LIMIT 3;


#Bottom 3 Sub-Categories by Backers
SELECT 
    sc.name AS SubCategoryName,
    SUM(cp.backers) AS TotalBackers
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
GROUP BY 
    sc.name
ORDER BY 
    TotalBackers ASC
LIMIT 3;