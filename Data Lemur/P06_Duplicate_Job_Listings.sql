SELECT (Count(j1.*) - Count(j1.job_id)/2) as duplicate_companies
FROM job_listings j1
JOIN job_listings j2 
ON ( (j1.job_id <> j2.job_id)
    AND (j1.company_id = j2.company_id) 
    AND (j1.title = j2.title) 
    AND (j1.description = j2.description))
;


-- OR
-- USING ROW_NUMBER as a tool to get duplicate rows

WITH job_listings_rank 
AS (
SELECT
  ROW_NUMBER() OVER (PARTITION BY company_id, title, description) 
  AS ranking, 
  company_id, 
  title, 
  description 
  FROM job_listings
)SELECT count(*)  as duplicate_companies
FROM job_listings_rank
WHERE ranking >= 2;

