SELECT *
FROM job_postings_fact
LIMIT 25;




-- Avg salary of all companies
SELECT 
    AVG (salary_year_avg) AS avg_salary
FROM job_postings_fact;



-- My inital query

SELECT
    company_dim.company_id,
    company_dim.name AS company_name,
    AVG(salary_year_avg) AS avg_salary
FROM company_dim
INNER JOIN job_postings_fact 
    ON company_dim.company_id = job_postings_fact.company_id
GROUP BY 
    company_dim.company_id,
    company_dim.name
HAVING AVG (salary_year_avg) > (
    SELECT 
        AVG (salary_year_avg) AS avg_salary
    FROM job_postings_fact  
);



-- Luke's approach to the query

SELECT 
    name AS company_name,
    avg_salary
FROM company_dim
INNER JOIN (
SELECT
    company_id,
    AVG (salary_year_avg) AS avg_salary
FROM job_postings_fact
WHERE salary_year_avg IS NOT NULL
GROUP BY company_id
) AS companies_salaries ON company_dim.company_id = companies_salaries.company_id
WHERE avg_salary >
(
   SELECT AVG(salary_year_avg)
   FROM job_postings_fact
);



































