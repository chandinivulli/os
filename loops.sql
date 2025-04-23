DECLARE
    -- Variables
    salary_increment NUMBER := 500;    -- Increment value
    max_salary_limit NUMBER := 20000; -- Maximum salary limit for validation

    -- Custom exception
    high_salary_exception EXCEPTION;

BEGIN
    DBMS_OUTPUT.PUT_LINE('Processing employees...');

    -- WHILE loop: Iterate through employees with a salary below the maximum limit
    DECLARE
        min_salary NUMBER := 5000; -- Initial minimum salary for the WHILE loop
    BEGIN
        WHILE min_salary <= max_salary_limit LOOP
            DBMS_OUTPUT.PUT_LINE('Checking salaries above: ' || min_salary);

 -- FOR loop: Update salary of employees in the specified range
            FOR emp IN (SELECT employee_id, first_name, salary
                        FROM employees
                        WHERE salary > min_salary AND salary <= min_salary + 5000) LOOP
                
                -- Nested loop: Process employees one by one
                DBMS_OUTPUT.PUT_LINE('Processing Employee: ' || emp.first_name || ' with Salary: ' || emp.salary);
   
 -- Update salary and handle high salaries
                IF emp.salary + salary_increment > max_salary_limit THEN
                    RAISE high_salary_exception; -- Raise custom exception if limit is breached
                ELSE
                    UPDATE employees
                    SET salary = salary + salary_increment   
                     WHERE employee_id = emp.employee_id;
                    DBMS_OUTPUT.PUT_LINE('Updated Salary for Employee ID: ' || emp.employee_id);
                END IF;
            END LOOP;

   min_salary := min_salary + 5000; -- Increment range for WHILE loop
        END LOOP;
    END;

    DBMS_OUTPUT.PUT_LINE('Processing completed.');

EXCEPTION
    -- Built-in exception for no data found
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employees found for the given conditions.');

    -- Custom exception for high salary limits
    WHEN high_salary_exception THEN
        DBMS_OUTPUT.PUT_LINE('Error: Salary increment exceeds the allowed limit.');   

    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
