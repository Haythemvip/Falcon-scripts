 

ALTER VIEW [dbo].[Vemp_ghyab_bezn]
AS
SELECT        dbo.emp.emp_name, dbo.emp_ghyab_bezn.ghyab_date, dbo.emp.emp_code, dbo.emp.IqamaID, dbo.emp_ghyab_bezn.Notes
FROM            dbo.emp INNER JOIN
                         dbo.emp_ghyab_bezn ON dbo.emp.emp_code = dbo.emp_ghyab_bezn.Emp_Code

GO


