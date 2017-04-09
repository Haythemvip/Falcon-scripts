

ALTER VIEW [dbo].[EmpSalary]
AS
SELECT        a.emp_code, a.emp_name, dbo.jobs.jname AS jobname, dbo.Sections.Sec_name AS branchname, dbo.departments.depart_name AS depname, ISNULL(a.emp_tamensalleryCanged, 0) 
                         AS emp_tamensalleryCanged, ISNULL(a.emp_Take_Food, 0) AS emp_Take_Food, ISNULL(a.emp_Take_Home, 0) AS emp_Take_Home, ISNULL(a.emp_sallery, 0) AS emp_sallery, ISNULL(a.emp_tamensallery, 0) 
                         AS asemp_tamensallery, ISNULL(a.emp_Take_Bus, 0) AS emp_Take_Bus, ISNULL(a.HavezEntetzam, 0) AS HavezEntetzam, ISNULL(a.emp_Take_other, 0) AS emp_Take_other, ISNULL(a.Dengers, 0) 
                         AS Dengers, 0 AS totalm, 0 AS takher, 0 AS solfa, 0 AS gyab, 0 AS gaza, 0 AS ins, 0 AS tax, 0 AS totalkh, 0 AS safy, dbo.Sections.Sec_id AS brnchid, dbo.departments.depart_id AS ksmid, 0 AS Expr14, 0 AS Expr1, 
                         0 AS d_ins, 0 AS w_a_ins, 0 AS w_d_ins, 0 AS Expr2, 0 AS Expr3, a.BankNo AS Expr18, a.COMP_ID AS Expr27, dbo.Company_name.COM_name AS Expr19, 0 AS Expr6, 0 AS Expr20, 0 AS moneygazaa, 
                         0 AS moneytakher, 0 AS moneygyab, 0 AS Expr28, 0 AS Expr7, a.Planid, a.NationalityID, 0 AS Expr8, 0 AS Expr5, 0 AS Expr9, 0 AS Expr10, 0 AS Expr11, 0 AS Expr12, 0 AS Expr4, ISNULL(a.SalaryType, 0) 
                         AS Expr13, 0 AS Lokked, ISNULL(a.Take_Schole, 0) AS Take_Schole, ISNULL(a.Take_Percent, 0) AS Take_Percent, a.BarCode, dbo.Nationality.Nationality, a.anohterDescount, 0 AS Count_Edafy_Hours, 
                         dbo.Kafeel.KafeelName, dbo.workPlan.planName, a.StatusDate
FROM            dbo.emp AS a LEFT OUTER JOIN
                         dbo.workPlan ON a.Planid = dbo.workPlan.Planid LEFT OUTER JOIN
                         dbo.Kafeel ON a.KafeelID = dbo.Kafeel.KafeelID LEFT OUTER JOIN
                         dbo.Nationality ON a.NationalityID = dbo.Nationality.NationalityID LEFT OUTER JOIN
                         dbo.jobs ON a.jobid = dbo.jobs.jobid LEFT OUTER JOIN
                         dbo.Company_name ON a.COMP_ID = dbo.Company_name.COM_ID LEFT OUTER JOIN
                         dbo.departments ON a.depart_id = dbo.departments.depart_id LEFT OUTER JOIN
                         dbo.Sections ON dbo.Sections.Sec_id = a.Sec_id

GO


