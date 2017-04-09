

ALTER VIEW [dbo].[VEmp_Account]
AS
SELECT        dbo.Emp_Account.id, dbo.emp.BarCode, dbo.emp.emp_name, dbo.Emp_Account.year, dbo.Emp_Account.actionname, dbo.Emp_Account.invno_ormony_id, dbo.Emp_Account.movedate, dbo.Emp_Account.maden, 
                         dbo.Emp_Account.daen, dbo.Emp_Account.ProunchID, dbo.Emp_Account.COMP_ID, dbo.Emp_Account.venderid, dbo.emp.emp_code, dbo.Emp_Account.Solfa, dbo.Emp_Account.Notes, dbo.Emp_Account.CurID, 
                         0 AS raseed, dbo.Emp_Account.CaseID, dbo.Emp_Account.CaseName, dbo.Emp_Account.Journal
FROM            dbo.emp INNER JOIN
                         dbo.Emp_Account ON dbo.emp.emp_code = dbo.Emp_Account.venderid

GO


