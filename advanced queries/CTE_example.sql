/*
Find the companies that have the most job openings.
- Get the total number of job postings per compnay id (job_posting_fact)
- Return the total number of jobs with the company name (compnay_dim)
*/

WITH company_job_count AS (
    SELECT
        company_id,
        COUNT(*) AS number_of_jobs
    FROM 
        job_postings_fact
    GROUP BY 
        company_id
    ORDER BY number_of_jobs DESC
)

SELECT
    cd.name AS company_name,
    cjc.number_of_jobs
FROM company_dim AS cd
LEFT JOIN company_job_count AS cjc ON cjc.company_id = cd.company_id
ORDER BY number_of_jobs DESC;