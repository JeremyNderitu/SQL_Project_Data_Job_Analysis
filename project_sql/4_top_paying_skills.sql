/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND(AVG(jpf.salary_year_avg), 0) AS average_salary
FROM job_postings_fact AS jpf
INNER JOIN skills_job_dim AS sjd
    ON jpf.job_id = sjd.job_id
INNER JOIN skills_dim AS sd
    ON sjd.skill_id = sd.skill_id
WHERE 
    jpf.job_title_short = 'Data Analyst' AND
    jpf.job_work_from_home = TRUE AND
    jpf.salary_year_avg IS NOT NULL
GROUP BY 
    skills
ORDER BY 
    average_salary DESC
LIMIT 25;

/* Here is a breakdown of the results:

Higher-paying Data Analyst roles appear to reward technical breadth beyond core analytics, 
particularly skills associated with Python, big-data processing, cloud infrastructure and 
production data systems.

The highest-paying “data analyst” skills skew beyond traditional analytics. 
PySpark, Databricks, Airflow, Kubernetes, Linux, Scala and GCP are much closer to data engineering / 
data platform work than standard dashboarding or reporting. That suggests some of the highest-paid
analyst roles are really hybrid positions sitting between analytics and engineering.

Python ecosystem skills feature strongly. Jupyter, Pandas, NumPy and scikit-learn 
all appear in the top 20. That points toward higher-paid analyst roles involving more 
advanced analysis, automation, modelling, or data science rather than primarily Excel/BI work.

Big-data capability appears to command a premium. PySpark is the clear outlier at about $208k, 
while Databricks and Scala also rank highly. A reasonable interpretation is that analysts 
who can work with very large datasets and distributed computing environments 
tend to sit in more technically demanding roles.

Software-development practices are surprisingly prominent. Bitbucket, GitLab, Jenkins 
and Atlassian suggest that high-paying analytical teams increasingly operate with proper 
version control, CI/CD and collaborative development workflows. 
The analyst is becoming less isolated from the software-development lifecycle.

Cloud and infrastructure knowledge matters. GCP, Kubernetes and Linux appearing here 
suggests that the upper end of analytics increasingly rewards people 
who understand where data lives and how analytical systems actually run, 
not just how to query the final tables.

Traditional BI is relatively scarce. MicroStrategy is the only obvious BI platform in this top 25.
SQL is represented through PostgreSQL, but there is no Excel, Tableau or Power BI. 
That does not mean those skills are unimportant; rather, they are widespread 
and therefore may not differentiate the highest-paying roles as strongly.

[
  {
    "skills": "pyspark",
    "average_salary": "208172"
  },
  {
    "skills": "bitbucket",
    "average_salary": "189155"
  },
  {
    "skills": "couchbase",
    "average_salary": "160515"
  },
  {
    "skills": "watson",
    "average_salary": "160515"
  },
  {
    "skills": "datarobot",
    "average_salary": "155486"
  },
  {
    "skills": "gitlab",
    "average_salary": "154500"
  },
  {
    "skills": "swift",
    "average_salary": "153750"
  },
  {
    "skills": "jupyter",
    "average_salary": "152777"
  },
  {
    "skills": "pandas",
    "average_salary": "151821"
  },
  {
    "skills": "elasticsearch",
    "average_salary": "145000"
  },
  {
    "skills": "golang",
    "average_salary": "145000"
  },
  {
    "skills": "numpy",
    "average_salary": "143513"
  },
  {
    "skills": "databricks",
    "average_salary": "141907"
  },
  {
    "skills": "linux",
    "average_salary": "136508"
  },
  {
    "skills": "kubernetes",
    "average_salary": "132500"
  },
  {
    "skills": "atlassian",
    "average_salary": "131162"
  },
  {
    "skills": "twilio",
    "average_salary": "127000"
  },
  {
    "skills": "airflow",
    "average_salary": "126103"
  },
  {
    "skills": "scikit-learn",
    "average_salary": "125781"
  },
  {
    "skills": "jenkins",
    "average_salary": "125436"
  },
  {
    "skills": "notion",
    "average_salary": "125000"
  },
  {
    "skills": "scala",
    "average_salary": "124903"
  },
  {
    "skills": "postgresql",
    "average_salary": "123879"
  },
  {
    "skills": "gcp",
    "average_salary": "122500"
  },
  {
    "skills": "microstrategy",
    "average_salary": "121619"
  }
]