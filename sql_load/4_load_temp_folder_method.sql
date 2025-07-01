COPY skills_job_dim
FROM 'C:/CSV files temp/skills_job_dim.csv'
WITH (FORMAT csv, HEADER true, DELIMITER ',', ENCODING 'UTF8');