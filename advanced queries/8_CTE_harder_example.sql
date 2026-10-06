/*
Find the count of the number of remote job postings per skill
    - Display the top 5 skills by their demand in remote jobs
    - Include the skill ID, name, and count of postings requiring the skill
*/


WITH remote_jobs_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS total_remote_jobs
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS jpf ON jpf.job_id = skills_to_job.job_id
    WHERE job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
    GROUP BY skill_id
    ORDER BY total_remote_jobs DESC
)

SELECT
    sd.skills AS skill_name,
    remote_jobs_skills.total_remote_jobs
FROM remote_jobs_skills
INNER JOIN skills_dim AS sd ON sd.skill_id = remote_jobs_skills.skill_id
ORDER BY total_remote_jobs DESC
LIMIT 5;


WITH remote_jobs_skills AS (
    SELECT
        skill_id,
        COUNT(*) AS total_remote_jobs
    FROM 
        skills_job_dim AS skills_to_job
    INNER JOIN job_postings_fact AS jpf ON jpf.job_id = skills_to_job.job_id
    WHERE job_work_from_home = TRUE
    AND job_title_short = 'Data Analyst'
    GROUP BY skill_id
    ORDER BY total_remote_jobs DESC
)

SELECT
    skills,
    total_remote_jobs
FROM skills_dim AS sd
INNER JOIN remote_jobs_skills ON remote_jobs_skills.skill_id = sd.skill_id
ORDER BY total_remote_jobs DESC
LIMIT 5;