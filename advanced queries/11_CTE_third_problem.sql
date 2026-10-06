

WITH required_skills AS (

SELECT 
    c.company_id,
    COUNT (DISTINCT s.skill_id) AS unique_skills
FROM company_dim AS c
LEFT JOIN job_postings_fact AS j
    ON c.company_id = j.company_id
LEFT JOIN skills_job_dim AS s
    ON j.job_id = s.job_id
GROUP BY c.company_id
),


max_salary AS (

SELECT
    j.company_id,
    MAX(j.salary_year_avg) AS highest_salary
FROM job_postings_fact AS j
INNER JOIN skills_job_dim AS s
    ON j.job_id = s.job_id
GROUP BY j.company_id
)

SELECT
    c.name AS company_name,
    rs.unique_skills,
    ms.highest_salary
FROM company_dim AS c
LEFT JOIN required_skills AS rs
    ON c.company_id = rs.company_id
LEFT JOIN max_salary AS ms
    ON c.company_id = ms.company_id









SELECT *
FROM skills_job_dim
ORDER BY job_id
LIMIT 25;


SELECT *
FROM company_dim
LIMIT 25;

SELECT *
FROM job_postings_fact
LIMIT 25;