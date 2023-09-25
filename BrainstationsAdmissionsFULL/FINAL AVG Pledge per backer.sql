SELECT 
    SC.name AS Subcategory,
    (SUM(CP.pledged * CC.conversion_rate_to_usd) / SUM(CP.backers)) AS avg_pledge_per_backer
FROM
    campaign AS CP
        JOIN
    sub_category AS SC ON CP.sub_category_id = SC.id
        JOIN
    category AS CT ON SC.category_id = CT.id
        JOIN
    currency AS CC ON CP.currency_id = CC.id
WHERE 
    SC.name = 'Tabletop Games'
GROUP BY 
    CT.name;
    
    
    SELECT 
    AVG (c.backers) AS average_backers
FROM
    campaign AS c
        JOIN
    sub_category AS sc ON c.sub_category_id = sc.id
        JOIN
    category AS CT ON sc.category_id = CT.id
        JOIN
    currency AS CC ON c.currency_id = CC.id
WHERE
    SC.name = 'Tabletop Games';