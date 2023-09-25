
SELECT *
FROM country;


UPDATE country AS cn
SET cn.name = 'UNKNOWN'
WHERE cn.id = 11;