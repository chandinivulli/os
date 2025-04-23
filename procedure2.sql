Procedure 2: Update employee salary by EmployeeID
CREATE OR REPLACE PROCEDURE UpdateEmployeeSalary (
    p_EmployeeID IN Employees.EmployeeID%TYPE,  -- IN parameter for EmployeeID
    p_NewSalary IN Employees.Salary%TYPE,       -- IN parameter for New Salary
    p_Salary OUT Employees.Salary%TYPE          -- OUT parameter to return updated salary
) IS
BEGIN
    -- Update the salary of the employee
    UPDATE Employees
    SET Salary = p_NewSalary
    WHERE EmployeeID = p_EmployeeID;
    
    -- Fetch and return the updated salary
    SELECT Salary INTO p_Salary
    FROM Employees
    WHERE EmployeeID = p_EmployeeID;
    
    DBMS_OUTPUT.PUT_LINE('Employee ID ' || p_EmployeeID || ' new salary: ' || p_Salary);
    
    COMMIT;  -- Commit the changes
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EmployeeID ' || p_EmployeeID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END UpdateEmployeeSalary;
