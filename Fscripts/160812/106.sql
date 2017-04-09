 

ALTER VIEW [dbo].[vsalary_plass]
AS
SELECT        dbo.salary_plass.plassid, dbo.salary_plass.plassdate, dbo.elawat_code.elawat_code_name, dbo.salary_plass.plassval, dbo.emp.emp_name, dbo.salary_plass.emp_id, dbo.salary_plass.Notes, 
                         dbo.salary_plass.elawat_code_id, dbo.salary_plass.CostID, dbo.salary_plass.CostName
FROM            dbo.salary_plass INNER JOIN
                         dbo.elawat_code ON dbo.salary_plass.elawat_code_id = dbo.elawat_code.elawat_code_id INNER JOIN
                         dbo.emp ON dbo.salary_plass.emp_id = dbo.emp.emp_code

GO


