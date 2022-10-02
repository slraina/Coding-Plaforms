-- Link = https://datalemur.com/questions/matching-skills

With selectedC as 
(
SELECT candidate_id 
FROM candidates
WHERE skill IN ('Python','Tableau','PostgreSQL')
)
SELECT candidate_id 
FROM selectedC
GROUP BY candidate_id
HAVING COUNT(candidate_id) = 3
