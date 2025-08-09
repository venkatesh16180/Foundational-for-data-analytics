-- SUBQUERIES

SELECT *
FROM employee_demographics
WHERE employee_id IN(
	SELECT employee_id
		FROM employee_salary
        WHERE dept_id = 1
);

-- SUBQUERY is an query within a query. It can be a good alternative to joins when the joins become too expensive.

SELECT first_name, salary, 
(SELECT AVG(salary)
FROM employee_salary
)
FROM employee_salary;

-- as you can see sub queries can also be used in the column selection section right after the select.

SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender;

-- now what if you want to calculate the average of the MAX(age) or MIN(age) or COUNT(age), meaning how can we find out the average of the max 
-- ages of the genders from both of these MAX(age)s of male and female.


SELECT *
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender);

-- Every derived table needs an Alias for some syntax reasons.

SELECT AVG(max_age)
FROM
(SELECT gender, AVG(age), MAX(age) AS max_age, MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_Table;

-- You will run into a problem here because the sql compiler will read AVG(MAX(age)) as AVG of MAX of AGE but there is not age column 
-- in the Agg_Table. But MAX(age) in Agg_Table is a column name and we can pass in as a column name either by aliasing it like the above
-- or as using back ticks like below.

SELECT AVG(`MAX(age)`)
FROM
(SELECT gender, AVG(age), MAX(age), MIN(age), COUNT(age)
FROM employee_demographics
GROUP BY gender) AS Agg_Table;

-- AS you can see you can also use SUBQUERIES as your table after FROM.