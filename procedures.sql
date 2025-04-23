DECLARE
    v_Name Employees.Name%TYPE;
    v_Salary Employees.Salary%TYPE;
    v_NewSalary Employees.Salary%TYPE := 55000; -- Example new salary
BEGIN
    -- Call Procedure 1 to fetch employee details
    GetEmployeeDetails(p_EmployeeID => 101, p_Name => v_Name, p_Salary => v_Salary);

    -- Call Procedure 2 to update salary
    UpdateEmployeeSalary(p_EmployeeID => 101, p_NewSalary => v_NewSalary, p_Salary => v_Salary);

    -- Output the updated salary
    DBMS_OUTPUT.PUT_LINE('Updated Salary: ' || v_Salary);
END;
