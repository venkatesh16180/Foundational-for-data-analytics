-- Triggers and Events

Select *
FROM employee_demographics;

Select *
FROM employee_salary;

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
    FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics (employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation,
salary, dept_id)
VALUES (13,'Joey','Tribianni', 'Actor', 1000000, NULL);

-- As you can see Joey can be seen in both the salary table and demographics table due to the trigger which inserted joey's details into the
-- demographics table. 
-- Also keep in mind there are keywords BEFORE and OLD which are opposites for AFTER and NEW respectively and does the opposite.
-- The AFTER in the above code referes to the fact that the trigger should occur after the function has happened like Insert in this case.
-- Similarly the NEW in the above code referes tot he NEW information that was just inserted.

-- one of the triggers' use cases include auto insertion as seen above which can result in ton of time saving and manual data entry.


-- EVENTS

-- EVENTS are similar to triggers, as in they too are set of queries occuring due to something. But EVENTS however occur when they are scheduled
-- instead of occuring when a specific action was performed as followed by Trigger.
-- One of its use cases include importing/updating data from a specific file path be it daily, monthly, weekly or yearly.
-- An example where EVENTS can be used is if there is a age threshold for retirement and the organization whats to check their data periodically,
-- daily or monthly to see if there are any employees over the age of 60 if there are remove them from the employee table and give them retirement
-- pay.

SELECT *
FROM employee_demographics;

DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
    FROM employee_demographics
    WHERE age >= 60;
END $$
DELIMITER ;

-- As you can see the above code deleted Jerry our over 60 year old employee.
-- You can also change the event scheduling timer to be anything from seconds to years.

SHOW VARIABLES LIKE 'event%';

-- if the EVENT did not occur then the cause can be you have event_scheduler as OFF. which can be checked using the above query.
-- Another issue that may occur for you when running this event is error while deleting and to fix that change a setting in preference
-- sql editor the last check box of rejecting updates.
