CREATE OR REPLACE FUNCTION GetEmployeesByDepartment(p_dept_id IN NUMBER)
RETURN SYS_REFCURSOR IS
    -- Declare a cursor variable
    emp_cursor SYS_REFCURSOR;
BEGIN
    -- Open the cursor and assign it to the cursor variable
    OPEN emp_cursor FOR
        SELECT EmployeeID, Name, Salary
        FROM Employees
        WHERE DepartmentID = p_dept_id;
    
    -- Return the cursor
    RETURN emp_cursor;
END GetEmployeesByDepartment;

DECLARE
    -- Declare a cursor variable
    v_cursor SYS_REFCURSOR;
    v_employee_id Employees.EmployeeID%TYPE;
    v_name Employees.Name%TYPE;
    v_salary Employees.Salary%TYPE;
BEGIN
    -- Call the function and get the cursor
    v_cursor := GetEmployeesByDepartment(20);  -- For Department 20
    
    -- Fetch and process each row from the cursor
    LOOP
        FETCH v_cursor INTO v_employee_id, v_name, v_salary;
        
        EXIT WHEN v_cursor%NOTFOUND;  -- Exit when no more rows are found
        
        -- Output the employee details
        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', Name: ' || v_name || ', Salary: ' || v_salary);
    END LOOP;
    
    -- Close the cursor
    CLOSE v_cursor;
END;

