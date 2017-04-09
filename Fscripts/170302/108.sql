
SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[Vsolaf]
AS
SELECT        dbo.solafaccount.id, dbo.emp.emp_name, dbo.solafaccount.year, dbo.solafaccount.movedate, dbo.solafaccount.maden, dbo.solafaccount.daen, dbo.solafaccount.solafpercent, dbo.emp.ProunchID, 
                         dbo.emp.COMP_ID, dbo.solafaccount.empcode, dbo.jobs.jname, dbo.departments.depart_name, dbo.emp.emp_sallery, dbo.solafaccount.Notes, dbo.emp.IqamaID
FROM            dbo.emp INNER JOIN
                         dbo.solafaccount ON dbo.emp.emp_code = dbo.solafaccount.empcode INNER JOIN
                         dbo.jobs ON dbo.emp.jobid = dbo.jobs.jobid INNER JOIN
                         dbo.departments ON dbo.emp.depart_id = dbo.departments.depart_id

GO


