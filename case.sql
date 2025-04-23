DECLARE
    -- Variables for employee data
    v_EmployeeID Employees.Employee_ID%TYPE;
    v_Name Employees.first_Name%TYPE;
    v_Salary Employees.Salary%TYPE;
    v_DepartmentID Employees.Department_ID%TYPE;
    v_Category VARCHAR2(20);
    v_Grade VARCHAR2(20);
BEGIN
    select employee_id,first_name,salary,department_id into
     v_EmployeeID,v_Name,v_Salary,v_DepartmentID from employees where employee_id = 105;

IF v_Salary IS NOT NULL THEN
        IF v_Salary >= 15000 THEN
            v_Grade := 'High Salary';
        ELSIF v_Salary >= 10000 THEN
            v_Grade := 'Medium Salary';
        ELSE
            v_Grade := 'Low Salary';
        END IF;
    ELSE
        v_Grade := 'Salary not available';
    END IF;
-- Using CASE expression to categorize the employee based on salary
    v_Category := CASE
                    WHEN v_Salary >= 15000 THEN 'Top Performer'
                    WHEN v_Salary >= 10000 THEN 'Average Performer'
                    ELSE 'Needs Improvement'
                  END;
-- Handling NULL values with NULLIF and COALESCE
    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_EmployeeID);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_Name);
    DBMS_OUTPUT.PUT_LINE('Salary: ' || COALESCE(v_Salary, 0)); 
    DBMS_OUTPUT.PUT_LINE('Grade: ' || v_Grade);
    DBMS_OUTPUT.PUT_LINE('Category: ' || v_Category);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
