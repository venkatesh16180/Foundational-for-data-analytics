-- LIMIT AND ALIASING

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3
;

-- the addition number beside the limiting number is specifing how many rows you want to display after skipping the limiting number's number of rows.
-- For example in the above example limit 3 will display the top 3 rows but the code below will skip the top 3 rows and display 1 row after the 
-- skipping, meaning it will display the 4th row.

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 3,1
;

-- Here the top 4 rows are skipped and the next 2 rows, 5th and 6th, are displayed.

SELECT *
FROM employee_demographics
ORDER BY age DESC
LIMIT 4,2
;

-- Aliasing

SELECT gender, AVG(age) AS ave_age
FROM employee_demographics
GROUP BY gender
HAVING ave_age > 40
;