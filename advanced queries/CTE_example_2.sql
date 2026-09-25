/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include the skill ID, name, and count of postings requiring the skill
*/



WITH remote_job_skills AS (
    SELECT
        skills_to_job.skill_id,
        COUNT(*) AS skill_count
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS jp ON jp.job_id = skills_to_job.job_id
    WHERE 
        jp.job_work_from_home = TRUE
        AND job_title_short = 'Data Analyst'
    GROUP BY skills_to_job.skill_id
)

SELECT
    sd.skills AS skill_name,
    rjs.skill_count
FROM remote_job_skills AS rjs
INNER JOIN skills_dim AS sd ON sd.skill_id = rjs.skill_id
ORDER BY skill_count DESC
LIMIT 5;



