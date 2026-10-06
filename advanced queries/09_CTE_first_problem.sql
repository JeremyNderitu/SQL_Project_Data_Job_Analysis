SELECT *
FROM job_postings_fact
LIMIT 25;



WITH unique_job_count AS (
    SELECT
        company_id,
        COUNT(DISTINCT job_title) AS number_of_unqiue_jobs
    FROM job_postings_fact
    GROUP BY company_id
)

SELECT
    company_dim.name AS company_name,
    unique_job_count.number_of_unqiue_jobs
FROM
    unique_job_count
LEFT JOIN company_dim
    ON unique_job_count.company_id = company_dim.company_id
ORDER BY number_of_unqiue_jobs DESC;
