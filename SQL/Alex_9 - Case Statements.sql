-- CASE Statements

SELECT first_name,
last_name,
age,
CASE
	WHEN age <= 30 THEN 'Young'
    WHEN age BETWEEN 31 AND 50 THEN 'Old'
    WHEN age >= 50 THEN "On Death's Door"
END AS age_Bracket
FROM employee_demographics
;


-- Pay Increase and Bonus
-- < 50000 = 5%
-- > 50000 = 7%
-- Finance = 10% bonus


SELECT first_name, last_name, salary,
CASE
	WHEN salary < 50000 THEN salary + (salary*0.05)
    WHEN salary > 50000 THEN salary + (salary*0.07)
END AS NEW_SALARY,
CASE
	WHEN dept_id = 6 THEN salary * .10
END AS Bonus
FROM employee_salary;

SELECT first_name, last_name,department_name, salary,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary >= 50000 THEN salary * 1.07
END AS New_Salary,
CASE
    WHEN department_name = "Finance" THEN salary * 0.1
END AS Bonus
FROM employee_salary as sal
INNER JOIN parks_departments as pr ON
sal.dept_id = pr.department_id;

SELECT *,
CASE
	WHEN salary < 50000 THEN salary * 1.05
    WHEN salary >= 50000 THEN salary * 1.07
END AS New_Salary,
CASE
    WHEN department_name = "Finance" THEN salary * 0.1
END AS Bonus
FROM employee_salary as sal
INNER JOIN parks_departments as pr ON
sal.dept_id = pr.department_id;

-- CASE statements are just a bunch of if and else statments from other programming languages.
-- CASE statements are very powerful. some of its use cases include calculations like above or labeling like in the first case usage example. 