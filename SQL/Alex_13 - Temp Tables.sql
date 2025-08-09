-- Temporary Tables

-- Temporary Tables are tables that are only avaiable for the session they were created in meaning if you were to close and reopen mysql then the
-- temporary table would be deleted. 
-- Some of its use cases include being used as a intermediate tables for a complex query like a CTE or Being used for computation before being
-- transfered to a non-temporary table.

CREATE TEMPORARY TABLE temp_table 
(first_name VARCHAR(50),
last_name VARCHAR(50),
favorite_movie VARCHAR(100)
);

-- TEMPORARY tables are created the same way the regular tables are created all we have to do is add TEMPORARY Keyword after create.

SELECT *
FROM temp_table;

-- All the operarations that are done on a Regular table can be done on a Temp Table.

SELECT *
FROM employee_salary;

CREATE TEMPORARY TABLE salary_over_50k
SELECT * 
FROM employee_salary
WHERE salary >= 50000;

INSERT INTO temp_table
VALUES('Nanu','V',"Hanuman");

SELECT * 
FROM salary_over_50k;

-- This temp table can be open even in a new sql file as long as it was created during the same session.