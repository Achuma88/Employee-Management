-- Create stored procedure to add an employee
CREATE PROCEDURE sp_AddEmployee
    @EmpName NVARCHAR(255),
    @EmpSurname NVARCHAR(255),
    @EmpEmail NVARCHAR(50),
    @EmpPhone NVARCHAR(10),
    @EmpTitle NVARCHAR(20),
    @EmpPassword NVARCHAR(20),
    @EmpType NVARCHAR(50)
AS
BEGIN
    INSERT INTO Employee (EmpName, EmpSurname, EmpEmail, EmpPhone, EmpTitle, EmpPassword, EmpType)
    VALUES (@EmpName, @EmpSurname, @EmpEmail, @EmpPhone, @EmpTitle, @EmpPassword, @EmpType);
END;
GO

-- Create stored procedure to add a manager
CREATE PROCEDURE sp_AddManager
    @ManagerID INT,
    @ManagerDep NVARCHAR(20)
AS
BEGIN
    INSERT INTO Manager (ManagerID, ManagerDep)
    VALUES (@ManagerID, @ManagerDep);
END;
GO

CREATE PROCEDURE sp_DeleteEmployee
    @EmpID INT
AS
BEGIN
    DELETE FROM Employee WHERE EmpID = @EmpID;
	END;
	GO


CREATE PROCEDURE sp_GetEmployeeById
    @EmpID INT
AS
BEGIN
    SELECT * FROM Employee WHERE EmpID = @EmpID;
END;
GO
CREATE PROCEDURE spDeleteManager
    @ManagerID INT
AS
BEGIN
    DELETE FROM Manager WHERE ManagerID = @ManagerID;
END;
GO
CREATE PROCEDURE spGetManagerById
    @ManagerID INT
AS
BEGIN
    SELECT m.*, e.EmpName, e.EmpEmail
    FROM Manager m
    JOIN Employee e ON m.ManagerID = e.EmpID
    WHERE m.ManagerID = @ManagerID;
END;
GO

CREATE PROCEDURE spUpdateEmployee
    @EmpID INT,
    @EmpName nvarchar(255),
	@EmpSurname nvarchar(255),
    @EmpEmail nvarchar(50),
	@EmpPhone nvarchar(10),
	@EmpTitle nvarchar(20),
	@EmpType nvarchar(50)
    
AS
BEGIN
    UPDATE Employee
    SET EmpName = @EmpName,
	    EmpSurname=@EmpSurname,
        EmpEmail =  @EmpEmail,
		EmpTitle=@EmpTitle,
        EmpType =@EmpType 

    WHERE EmpId = @EmpID;
END;
GO
CREATE PROCEDURE spUpdateManager
    @ManagerID INT,
    @ManagerDep nvarchar(20)
AS
BEGIN
    UPDATE Manager
    SET ManagerDep = @ManagerDep
    WHERE ManagerID = @ManagerID;
END;
GO

CREATE PROCEDURE spUpdatePassword
    @EmpID INT,
    @EmpPassword nvarchar(20)
AS
BEGIN
    UPDATE Employee
    SET EmpPassword = @EmpPassword
        
    WHERE EmpID = @EmpID;
END;
GO