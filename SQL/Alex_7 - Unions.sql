-- Union

SELECT first_name, last_name
FROM employee_demographics
UNION 
SELECT first_name, last_name
FROM employee_salary
;

-- In ths case, UNION by default will only display the distinct rows from both the unioned tables meaning every duplicate row that occured due 
-- to the same information in both the tables will be ignored.

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

-- To not have the "unique" effect we can use UNION ALL feature

SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary
;

SELECT  first_name, last_name, 'Old Man' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT  first_name, last_name, 'Old Lady' AS Label
FROM employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT  first_name, last_name, 'Highly Paid Employee' AS Label
FROM employee_salary
WHERE salary > 70000
Order BY first_name, last_name
;

-- The above query is the use case for UNION. Here we are creating a table with specific filtering and combining the rows using UNIONS