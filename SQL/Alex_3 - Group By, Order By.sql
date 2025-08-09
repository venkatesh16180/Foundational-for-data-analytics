-- GROUP By

SELECT *
FROM employee_demographics;

SELECT gender
FROM employee_demographics
GROUP BY gender
;

SELECT gender, avg(age), max(age), min(age), count(age)
FROM employee_demographics
group by gender
;

-- Order by

insert into employee_demographics
values (13,"john","doe",34,"Male","1990-01-01")
;

SELECT *
FROM employee_demographics
order by gender, age, birth_date
;

-- you can order by any number of columns
delete from employee_demographics
where first_name = "john"
;

-- not optimal to order the columns by their numbers instead of names but you can do that.
-- why is it not optimal again? its not optimal because you may alter the table in future which could result in different columns being used 
-- for ordering and we dont want that.

SELECT *
FROM employee_demographics
order by 5, 4
;