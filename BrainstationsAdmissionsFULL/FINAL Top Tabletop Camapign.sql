SELECT 
    cp.name AS CampaignName,
    cp.pledged * c.conversion_rate_to_usd AS HighestPledgedAmountUSD,
    cp.backers AS NumberOfBackers
FROM 
    campaign AS cp
JOIN
    sub_category AS sc ON cp.sub_category_id = sc.id
JOIN
    currency AS c ON cp.currency_id = c.id
WHERE 
    sc.name = 'Tabletop Games' AND cp.outcome = 'successful'
ORDER BY
    cp.pledged * c.conversion_rate_to_usd DESC
LIMIT 1;