-- String Functions

-- length()

SELECT length('SKYFALL');

SELECT first_name,length(first_name) AS Length_of_Name
FROM employee_demographics
ORDER BY Length_of_Name;

-- First String function we will be looking at is length(), which will return the number of characters that are in string. 
-- one of its use case includes using length() to validate phone numbers, as in are all the phone nos 10 digits or were there any mistakes in 
-- data cleaning process which resulted in some of the phone numbers without the area code

-- UPPER and LOWER

SELECT UPPER('skyFall');
SELECT LOWER('SKyFALL');

SELECT first_name,UPPER(first_name)
FROM employee_demographics;

-- Next are Upper and Lower which are self explanitory UPPER will turn the String into UPPER case or CAPSLOCKED, and LOWER does the opposite it 
-- will convert the string into LOWER case or UNCAPSLOCKED 
-- These string functions' Use cases include standardizing the strings in a column.

-- TRIM and its variations

SELECT ('                            SKY           ');
SELECT TRIM('                            SKY           '); 
SELECT LTRIM('                            SKY           FALL');
SELECT RTRIM('                            SKY           FALL');

-- TRIM is used to well trim the excess spaces on either side of the string. YOu can also use LTRIM and RTRIM to trim either side of the String.

--SUBSTRING

SELECT first_name, 
LEFT(first_name, 4),
RIGHT(first_name, 4),
SUBSTRING(first_name, 3, 2),
birth_date,
SUBSTRING(birth_date, 6, 2) AS birth_month
FROM employee_demographics;

-- These LEFT and RIGHT functions are used to select the specific number of characters in a string from either side of the string, left will start
-- from the well left side of the string and right will start from the right side of the string.
-- SUBSTRING is great in selecting well a SUB-STRING in a string by way of giving two numbers along with the column that being substringed first 
-- number give the starting location/index and the second number is how many characters do you want to select. Its similar to the limit's two 
-- numbers passing situation.
-- AS you can see its use case can be to extract a specific time type like we are doing in the above code.

-- REPLACE

SELECT first_name, REPLACE(first_name, 'a', 'z')
FROM employee_demographics;

-- REPLACE well replaces character/s with another character or set of characters. Please to take note that the characters are case sensitive.

-- LOCATE

SELECT LOCATE('a', 'Nanu');
SELECT LOCATE('an', 'Nanu');

SELECT first_name, LOCATE('AN',first_name)
FROM employee_demographics;

-- LOCATE() will locate the character or a set of characters in a string. when locating a set of strings the first index that corresponds to the 
-- set of charaters is returned. also the characters are case insensitive for this one.

-- CONCAT

SELECT first_name, last_name,
CONCAT(first_name,' ',last_name)
FROM employee_demographics;

-- CONCAT will combine strings in this case combines columns.
-- CONCAT is Very VERY useful string function. Widely used function during data analytics. This function is used to combine the columns where needed.