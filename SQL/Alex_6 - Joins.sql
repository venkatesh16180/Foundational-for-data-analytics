-- JOINS

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

-- INNER JOIN

SELECT *
FROM employee_demographics AS dm
INNER JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- whats happeing here is both tables are merging at a common column employee_id. Also take note of the fact that there is no information in the 
-- joined table about Ron,employee_id 2, as he is not present in the dm table but is present in the sal table and in inner join rows present in 
-- both the tables are the only ones considered.

SELECT dm.employee_id, age, occupation
FROM employee_demographics AS dm
INNER JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- OUTER JOINS

SELECT *
FROM employee_demographics AS dm
RIGHT JOIN employee_salary AS sal
	ON dm.employee_id = sal.employee_id
;

-- Remeber how in inner join you were not able to see Ron's information because he was only present in one of the two tables, if you want him to 
-- be displayed as well in the join table you can do that by outer joins and the columns' information where the information regarding Ron is not 
-- know there will be NULL displayed.

-- Self Join

SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id AS emp_kid,
emp2.first_name AS first_name_kid,
emp2.last_name AS last_name_kid
FROM employee_salary AS emp1
JOIN employee_salary AS emp2
	ON emp1.employee_id + 1 = emp2.employee_id
;

-- Joining Multiple Tables

SELECT *
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments AS pd
	ON sal.dept_id = pd.department_id
;

-- When joining multiple tables It doesn't matter if the joining column is present in all the tables for instance take the above code for example.
-- in dem there is no department id column but it is present in the sal and pd tables so the three tables are connected by the way of sal table in 
-- the middle and dem and pd table to its either side. (picture it in venn diagram its easier to visualize)


