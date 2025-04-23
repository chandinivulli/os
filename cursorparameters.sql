DECLARE
    -- Define a cursor with a parameter
    CURSOR emp_cursor(p_dept_id IN NUMBER) IS
        SELECT EmployeeID, Name, Salary
        FROM Employees
        WHERE DepartmentID = p_dept_id;
    
    -- Declare variables to hold fetched data
    v_employee_id Employees.EmployeeID%TYPE;
    v_name Employees.Name%TYPE;
    v_salary Employees.Salary%TYPE;
BEGIN
    -- Open the cursor with a specific department ID
    OPEN emp_cursor(20);  -- For Department 20
    
    -- Fetch and process each row
    LOOP
        FETCH emp_cursor INTO v_employee_id, v_name, v_salary;
        
        EXIT WHEN emp_cursor%NOTFOUND;  -- Exit when no more rows are found
        
        -- Output the employee details
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_name || ', Salary: ' || v_salary);
    END LOOP;
    
    -- Close the cursor
    CLOSE emp_cursor;
END;
