-- Link = https://datalemur.com/questions/linkedin-power-creators-part2

WITH cpf as (
SELECT personal_profile_id, sum(followers) as cf
FROM employee_company ec
JOIN company_pages cp
on cp.company_id = ec.company_id
group by personal_profile_id
)Select cpf.personal_profile_id
FROM cpf
INNER JOIN personal_profiles pp
ON pp.profile_id = cpf.personal_profile_id 
AND pp.followers > cpf.cf;
