/*
Question: what are the top-paying data analyst jobs
- Identify the top 10 highest-paying Data Analyst roles available remotely.
- Focuses on job postings with specfied salaries (remove nulls).
- Why? Highlight the top-paying opportunitites for Data Analysts.
*/

SELECT
    name AS company_name,
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
FROM
    job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON jpf.company_id = cd.company_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location = 'Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;

