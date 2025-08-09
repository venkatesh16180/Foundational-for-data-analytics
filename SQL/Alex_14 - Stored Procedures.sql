-- Stored Procedures

-- Stored Procedure are used to store SQL code so that they can be used over and over again. 
-- When you call it it will execute all the sql code stored in the procedure block.
-- Procedures are especially useful for storing complex queries, simplifying repeatitive code or simply enhancing overall efficiency.

SELECT *
FROM employee_salary
WHERE salary >= 50000;

USE parks_and_recreation;
CREATE PROCEDURE large_salaries()
SELECT *
FROM employee_salary
WHERE salary >=50000;

CALL large_salaries();

CREATE PROCEDURE large_salaries2()
SELECT *
FROM employee_salary
WHERE salary >=50000;
SELECT *
FROM employee_salary
WHERE salary >=10000;

CALL large_salaries2(); 

-- As you can see only the query with the >=50000 is being executed. This is because of the ';' which stops the next query with >=10000 from
-- being executed. Why is the latter query not being executed? this is because ; is a delimiter it tells the complier the query to be executed
-- ends here and any query following that is not from this query but from a different query.
-- And to tackle this the following can be done. changing the delimiter to $$ or any other special character for that matter.

DELIMITER $$
CREATE PROCEDURE large_salaries3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >=50000;
	SELECT *
	FROM employee_salary
	WHERE salary >=10000;
END $$
DELIMITER ;

CALL large_salaries3();

-- Instead of writing the whole stored procedure you can instead try to create a stored procedure through interface following these steps:
-- right click on the Stored Procedures in the left under your desired database.
-- then select "Create Stored Procedure"
-- we will then write/paste our queries in between the BEGIN and END found this the opened window.
-- Finally click 'apply' and 'apply' again. 
-- The stored procedure is successfully created. dont forget to change the stored procedure name if you want to.

-- The Stored Procedure practice done by the interface is considered best so try to imitate its practice or consider using the interface to 
-- create these stored procedures.

DELIMITER $$
CREATE PROCEDURE large_salaries4(p_emp_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
	WHERE employee_id = p_emp_id;
END $$
DELIMITER ;

CALL large_salaries4(1);

-- As you can see you can not only store query/procedure but also pass parameters into stored procedure as you can see above.
-- Also remember that the good practice for naming parameters is for them to either start with 'p_' or end with '_param'.