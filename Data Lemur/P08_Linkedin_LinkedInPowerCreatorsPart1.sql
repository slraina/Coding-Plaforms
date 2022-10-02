-- Link = https://datalemur.com/questions/linkedin-power-creators

with cte as(
SELECT
p.profile_id,	p.name,	p.followers as pf,	p.employer_id,
c.company_id,	c.name,	c.followers as cf
FROM personal_profiles p
JOIN company_pages c
ON p.employer_id = c.company_id
)SELECT profile_id
FROM cte
where pf>=cf