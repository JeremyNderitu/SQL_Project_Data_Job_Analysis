SELECT 
    job_title_short,
    job_location,
    job_via,
    job_posted_date :: DATE AS date,
    salary_year_avg AS salary
FROM (
    SELECT *
    FROM  january_jobs
    UNION ALL
    SELECT *
    FROM febuary_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS quarter_one_jobs
WHERE 
    salary_year_avg > 70000 AND
    job_title_short = 'Data Analyst'
ORDER BY salary DESC;
