Stored Function 1: GetEmployeeSalary
This function will accept an EmployeeID as input and return the salary of the corresponding employee.

CREATE OR REPLACE FUNCTION GetEmployeeSalary (
    p_EmployeeID IN Employees.EmployeeID%TYPE  -- IN parameter for EmployeeID
) RETURN Employees.Salary%TYPE IS
    v_Salary Employees.Salary%TYPE;  -- Variable to store salary
BEGIN
    -- Query to get employee's salary based on EmployeeID
    SELECT Salary INTO v_Salary
    FROM Employees
    WHERE EmployeeID = p_EmployeeID;

    RETURN v_Salary;  -- Return the salary
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN NULL;  -- If no employee found, return NULL
    WHEN OTHERS THEN
        RETURN NULL;  -- Handle any other unexpected errors
END GetEmployeeSalary;


2. Stored Function 2: CalculateBonus
This function will accept an EmployeeID and calculate the bonus based on the salary. If the salary is greater than 50,000, the bonus is 10% of the salary. Otherwise, it returns a fixed bonus of 5,000.

CREATE OR REPLACE FUNCTION CalculateBonus (
    p_EmployeeID IN Employees.EmployeeID%TYPE  -- IN parameter for EmployeeID
) RETURN NUMBER IS
    v_Salary Employees.Salary%TYPE;  -- Variable to store salary
    v_Bonus NUMBER;  -- Variable to store calculated bonus
BEGIN
    -- Get the employee's salary using the previously created function
    v_Salary := GetEmployeeSalary(p_EmployeeID);

    -- Calculate the bonus based on the salary
    IF v_Salary > 50000 THEN
        v_Bonus := v_Salary * 0.10;  -- 10% bonus for salaries above 50,000
    ELSE
        v_Bonus := 5000;  -- Fixed bonus of 5000 for others
    END IF;

    RETURN v_Bonus;  -- Return the calculated bonus
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;  -- Return 0 in case of any error
END CalculateBonus;

3. Invoking Functions in SQL Statements
Now that we have our functions, let's demonstrate how to invoke them in SQL statements.
Example 1: Fetching Employee Salary Using Function

SELECT EmployeeID, Name, GetEmployeeSalary(EmployeeID) AS Salary
FROM Employees
WHERE DepartmentID = 10;  -- Example: Fetching employees from Department 10
This SQL statement uses the GetEmployeeSalary function to get the salary of employees from Department 10.

Example 2: Calculating Employee Bonus Using Function
SELECT EmployeeID, Name, CalculateBonus(EmployeeID) AS Bonus
FROM Employees
WHERE DepartmentID = 20;  -- Example: Fetching employees from Department 20
This SQL statement uses the CalculateBonus function to get the bonus for employees in Department 20.

Example 3: Fetching Employee Salary and Bonus in One Query
SELECT EmployeeID, Name,
       GetEmployeeSalary(EmployeeID) AS Salary,
       CalculateBonus(EmployeeID) AS Bonus
FROM Employees
WHERE DepartmentID = 30;


CREATE OR REPLACE FUNCTION GetTotalCompensation (
    p_EmployeeID IN Employees.EmployeeID%TYPE  -- IN parameter for EmployeeID
) RETURN NUMBER IS
    v_Salary Employees.Salary%TYPE;  -- Variable to store salary
    v_Bonus NUMBER;  -- Variable to store bonus
    v_TotalCompensation NUMBER;  -- Variable to store total compensation
BEGIN
    -- Get the salary using the GetEmployeeSalary function
    v_Salary := GetEmployeeSalary(p_EmployeeID);

    -- Get the bonus using the CalculateBonus function
    v_Bonus := CalculateBonus(p_EmployeeID);

    -- Calculate the total compensation
    v_TotalCompensation := v_Salary + v_Bonus;

    RETURN v_TotalCompensation;  -- Return total compensation
EXCEPTION
    WHEN OTHERS THEN
        RETURN 0;  -- Return 0 in case of any error
END GetTotalCompensation;

SELECT EmployeeID, Name, GetTotalCompensation(EmployeeID) AS TotalCompensation
FROM Employees
WHERE DepartmentID = 40;

