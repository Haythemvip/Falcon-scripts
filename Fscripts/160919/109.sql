
CREATE PROCEDURE Select_EmpData
	
	@EmpCode BIGINT = 0


AS
BEGIN
	
 Select * From VEmp WHERE (@EmpCode = 0 OR emp_code = @EmpCode)

END
GO
