SELECT
    jpf.job_id,
    cd.name AS company_name,
    jpf.job_title_short,
    jpf.salary_year_avg,
    CASE
        WHEN salary_year_avg >= 100000 THEN 'High Salary'
        WHEN salary_year_avg >= 60000 THEN 'Standard Salary'
        WHEN salary_year_avg < 60000 THEN 'Low Salary'
    END AS salary_categorization
FROM job_postings_fact AS jpf
LEFT JOIN company_dim AS cd ON cd.company_id = jpf.company_id
WHERE salary_year_avg IS NOT NULL
AND job_title_short = 'Data Analyst'
ORDER BY salary_year_avg DESC;

SELECT *
FROM job_postings_fact
LIMIT 10;

-- Below is the CASE statment for problem 3: --

SELECT
    job_id,
    salary_year_avg,
    CASE
        WHEN job_title ILIKE '%Senior%' THEN 'Senior'
        WHEN job_title ILIKE '%Lead%' OR job_title ILIKE '%Manager%' THEN 'Lead/Manager'
        WHEN job_title ILIKE '%Junior%' OR job_title ILIKE '%Entry%' THEN 'Junior/Entry'
        ELSE 'Not Specified'
    END AS experience_level,
    CASE
        WHEN job_work_from_home = TRUE THEN 'Yes'
        ELSE 'No'
    END AS remote_option
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
ORDER BY job_id;