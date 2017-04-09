 

CREATE VIEW [dbo].[V_Emp_Requests]
AS
SELECT dbo.Emp_Requests.*, dbo.VEmp.emp_code, dbo.VEmp.emp_name, dbo.VEmp.jname, dbo.VEmp.depart_name, dbo.VEmp.emp_sallery, dbo.VEmp.emp_tamensallery, dbo.VEmp.emp_Take_Home, 
                  dbo.VEmp.emp_Take_Bus, dbo.VEmp.emp_Take_Food, dbo.VEmp.emp_Take_other, dbo.VEmp.OrignalContry, dbo.VEmp.HavezEntetzam, dbo.VEmp.Nationality, dbo.VEmp.IqamaID, dbo.VEmp.Mohafzet_Badal, 
                  dbo.VEmp.BankNo, dbo.VEmp.Take_Schole, dbo.VEmp.Dengers, dbo.VEmp.emp_tamensalleryCanged
FROM     dbo.Emp_Requests INNER JOIN
                  dbo.VEmp ON dbo.Emp_Requests.Emp_ID = dbo.VEmp.emp_code

GO

 


