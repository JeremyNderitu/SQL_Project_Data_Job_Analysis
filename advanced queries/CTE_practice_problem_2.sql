SELECT *
FROM job_postings_fact
LIMIT 25;


WITH country_avg_salary as (
    SELECT
        job_country,
        AVG(salary_year_avg) AS avg_salary
    FROM 
        job_postings_fact
    GROUP BY 
        job_country
)

SELECT
    jp.job_id,
    EXTRACT (MONTH FROM jp.job_posted_date) AS Month,
    cd.name AS company_name,
    jp.job_title_short,
    jp.salary_year_avg,
    CASE
        WHEN jp.salary_year_avg > cas.avg_salary THEN 'Above Average'
        WHEN jp.salary_year_avg < cas.avg_salary THEN 'Below Average'
        WHEN jp.salary_year_avg = cas.avg_salary THEN 'Average'
        ELSE 'Not specified'
    END AS salary_categorization
FROM 
    job_postings_fact AS jp
INNER JOIN company_dim AS cd
    ON jp.company_id = cd.company_id
INNER JOIN country_avg_salary AS cas
    ON jp.job_country = cas.job_country;