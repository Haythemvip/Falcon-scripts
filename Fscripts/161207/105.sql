 

ALTER VIEW [dbo].[vHafez]
AS
SELECT        dbo.elawat_code.elawat_code_name, dbo.emp.emp_name, dbo.Hafez.plassid, dbo.Hafez.plassdate, dbo.Hafez.emp_id, dbo.Hafez.elawat_code_id, dbo.Hafez.plassval, dbo.Hafez.dateYear, 
                         dbo.Hafez.datemonth, dbo.Hafez.flag, dbo.Hafez.ProunchID, dbo.Hafez.COMP_ID, dbo.Hafez.Notes
FROM            dbo.Hafez INNER JOIN
                         dbo.emp ON dbo.Hafez.emp_id = dbo.emp.emp_code INNER JOIN
                         dbo.elawat_code ON dbo.Hafez.elawat_code_id = dbo.elawat_code.elawat_code_id

GO


