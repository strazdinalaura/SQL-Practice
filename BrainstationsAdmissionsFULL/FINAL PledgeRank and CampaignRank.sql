#Rank the top three countries with the most successful campaigns in terms of dollars (total amount pledged), 
#and in terms of the number of campaigns backed.

WITH RankedCountries AS (
SELECT 
    cn.name AS CountryName,
    SUM(cp.pledged * c.conversion_rate_to_usd) AS TotalAmountPledged,
    COUNT(cp.id) AS NumberOfCampaigns,
    RANK () OVER (ORDER BY SUM(cp.pledged * c.conversion_rate_to_usd) DESC) AS PledgeRanked,
    RANK () OVER (ORDER BY COUNT(cp.id) DESC) AS CampaignsRanked
FROM
    campaign AS cp
        JOIN
    country AS cn ON cp.country_id = cn.id
        JOIN
    currency AS c ON cp.currency_id = c.id
    
WHERE cp.outcome = 'successful' AND cn.name != 'UNKNOWN'

GROUP BY cn.name
    )
SELECT 
	CountryName,
    TotalAmountPledged,
    NumberOfCampaigns,
    PledgeRanked,
    CampaignsRanked
    
FROM RankedCountries

WHERE PledgeRanked <=3 OR CampaignsRanked <=3
