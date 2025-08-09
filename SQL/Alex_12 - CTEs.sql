-- CTE

SELECT gender, AVG(salary), MAX(salary), MIN(salary), COUNT(salary)
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- CTEs are Common Table Expression. They allow for a sub query block to be referenced in the main query. The sub query block here is named and 
-- standardized.

WITH CTE_Example AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_sal)
FROM CTE_Example
;

-- As you can see from the above code you are first creating a sub query block CTE_Example and THEN writing the main query referring to the sub query
-- block. Lets also look at the following code which does exactly the same thing as above code just using plained old sub query.

SELECT AVG(avg_sal)
FROM (
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) example_subquery
;

-- One of the main reasons why CTEs are used is to make the SQL code more readable and Standardized. You can get away with using the subqueries
-- if you are working on an sql project on your own but if the sql code you're writing is/will be used by others as well then its best to use CTEs.

SELECT AVG(avg_sal)
FROM CTE_Example
;

-- we get an error because CTE_Example was not created as a table it is just an expression. 

WITH CTE_Example AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > "1985-01-01"
),
CTE_Example2 AS
(
SELECT employee_id, salary 
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_Example ex1
JOIN CTE_Example2 ex2
	ON ex1.employee_id = ex2.employee_id
;

-- You can have more than 1 CTE in the same query. As you can see in the above example.

WITH CTE_Example (Gender, AVG_Sal, MAX_Sal, MIN_Sal, COUNT_Sal) AS
(
SELECT gender, AVG(salary) avg_sal, MAX(salary) max_sal, MIN(salary) min_sal, COUNT(salary) count
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_Example
;

-- You can also label the columns right by the CTE name as you can see above.