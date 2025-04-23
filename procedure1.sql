Procedure 1: Fetch employee details by EmployeeID
CREATE OR REPLACE PROCEDURE GetEmployeeDetails (
    p_EmployeeID IN Employees.EmployeeID%TYPE,  -- IN parameter for EmployeeID
    p_Name OUT Employees.Name%TYPE,             -- OUT parameter for Name
    p_Salary OUT Employees.Salary%TYPE           -- OUT parameter for Salary
) IS
BEGIN
    -- Retrieve employee details based on EmployeeID
    SELECT Name, Salary
    INTO p_Name, p_Salary
    FROM Employees
    WHERE EmployeeID = p_EmployeeID;
    
    -- Output the employee details
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || p_Name);
    DBMS_OUTPUT.PUT_LINE('Employee Salary: ' || p_Salary);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No employee found with EmployeeID ' || p_EmployeeID);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END GetEmployeeDetails;
