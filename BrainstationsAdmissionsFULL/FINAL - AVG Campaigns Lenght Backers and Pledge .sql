WITH AvgCampaignLength AS (
    SELECT AVG(TIMESTAMPDIFF(DAY, launched, deadline)) AS avg_length
    FROM campaign
)

SELECT 
    CASE
        WHEN TIMESTAMPDIFF(DAY, launched, deadline) > (SELECT avg_length FROM AvgCampaignLength) THEN 'Longer Campaign'
        ELSE 'Shorter Campaign'
    END AS CampaignType,
    AVG(cp.pledged * cc.conversion_rate_to_usd) AS AvgPledgedAmountInUSD,
    SUM(cp.pledged * cc.conversion_rate_to_usd) AS TotalPledgedAmountInUSD,
    COUNT(*) AS NumberOfCampaigns,
    SUM(CASE WHEN cp.outcome = 'successful' THEN 1 ELSE 0 END) AS SuccessfulCampaigns
FROM 
    campaign AS cp
JOIN
    currency AS cc ON cp.currency_id = cc.id
GROUP BY
    CampaignType
ORDER BY
    AvgPledgedAmountInUSD DESC;





