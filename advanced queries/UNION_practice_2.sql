
SELECT
    sd.skills,
    EXTRACT (YEAR FROM qsj.job_posted_date) AS year,
    EXTRACT (MONTH FROM qsj.job_posted_date) AS month,
    COUNT(qsj.job_id) AS number_of_jobs
FROM 
(
    SELECT *
    FROM  january_jobs
    UNION ALL
    SELECT *
    FROM febuary_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS qsj
INNER JOIN skills_job_dim AS sjd ON qsj.job_id = sjd.job_id
INNER JOIN skills_dim AS sd ON sjd.skill_id = sd.skill_id
GROUP BY
    sd.skills,
    year,
    month
ORDER BY number_of_jobs DESC;





/*
SELECT *
FROM skills_dim
LIMIT 10

SELECT *
FROM skills_job_dim
LIMIT 10