-- HAVING vs WHERE

Select gender, AVG(age)
from employee_demographics
where avg(age) > 40
group by gender
;

-- same as above code but without the error. The reason this error occuring because the condition for the where 'avg(age)>40' 
-- has not yet been calculated as its before the group by. which is fixed in the below code by passing the condition through 
-- HAVING which goes after the group by. WHERE and HAVING are essentially have the same function jus that when you want to 
-- use aggregate function in the condition use HAVING instead of WHERE

SELECT gender, AVG(age)
FROM employee_demographics
GROUP BY gender
HAVING AVG(AGE) > 40
;

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%MANAGER%'
group by occupation
;

-- the above code finds any kind of manager

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%MANAGER%' and avg(salary) > 750000
group by occupation
;

-- Now I am only interested in finding the manager who has salary more than 75000 but oh no an error why? because the avg salary is an 
-- aggregate and we cant pass aggregate function in where so lets pass it via having

SELECT occupation, AVG(salary)
FROM employee_salary
WHERE occupation LIKE '%MANAGER%'
group by occupation
HAVING AVG(salary) > 75000
;

-- Hooray