-- Window Functions

-- window funcitons are really powerful and are somewhat like a group by except they don't roll up into one row when grouping they allow us to 
-- look at each partitions or a group into unique rows.

SELECT gender, avg(salary) AS Average_Salary
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- Lets start by looking at the group by function which is similar to the window funciton by differs slightly as in, in window function the groups 
-- are not rolled up into a single row as seen in the above group by, the aggregated value is instead displayed for each of the rows as in the
-- following code. 

SELECT gender, avg(salary) OVER()
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender,salary, avg(salary) OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender,salary, sum(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_total
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;
    
-- You can also rank 

SELECT dem.first_name, dem.last_name, gender,salary, 
ROW_NUMBER() OVER(PARTITION BY gender)
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

-- The 
SELECT dem.first_name, dem.last_name, gender,salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC)
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

SELECT dem.first_name, dem.last_name, gender,salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

-- ROW NUMBER and RANK Number are very similar the only difference between the two is in row numbers unique row number is given if the row has 
-- same partition by column value but in rank they are the same. as in the above example.

-- ROW NUMBER can be used without the ORDER BY we will still get each row uniquely numbered we only use the ORDER BY in row number because if we 
-- want to order them uniquely based on their values as in if you want the rows numbered in the form of a rank the largest value is the first rank
-- or if you want you can go moba ranked style and have the least valued row as rank 1 instead.

-- This However is not the case for RANK() as it needs to have a ORDER BY column to rank the rows off of if no ORDER BY is given all the rows will 
-- be ranked as 1. Ranking can also be specified to be ASC or DESC. Also another thing to keep in mind witht the rank() is that if there are two 5s 
-- as in the above example the next ank will not be 6 but seven instead. So in theory if there are multiple employees with the same salary(the order 
-- by in the above example) they could be assigned the same number like 5 and the next rank could be 100 skipping 6 to 99.

SELECT dem.first_name, dem.last_name, gender,salary, 
ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) AS row_num,
RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS rank_num,
DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) AS dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal 
	ON dem.employee_id = sal.employee_id;

-- The above rank issue of skipping a rank when previous ranks are repeated can be resolved by dense_rank()