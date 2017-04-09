

ALTER VIEW [dbo].[View_Due_Vection]
AS
SELECT        dbo.Due_Vection.ID, dbo.Due_Vection.Emp_Name, dbo.Due_Vection.Jop, dbo.Due_Vection.Bare_Cod, dbo.Due_Vection.Nationalty, dbo.Due_Vection.Sec_Name, dbo.Due_Vection.Bisc_Salary, 
                         dbo.Due_Vection.Allawonce, dbo.Due_Vection.Total_Salary, dbo.Due_Vection.Tickt, dbo.Due_Vection.ContractPiod, dbo.Due_Vection.LaveDate, dbo.Due_Vection.LastComBak, dbo.Due_Vection.WorkDayes, 
                         dbo.Due_Vection_Items.Coli, dbo.Due_Vection_Items.ColAmount, dbo.Due_Vection_Items.Colst1, dbo.Due_Vection_Items.Colst2, dbo.Due_Vection.net, dbo.Due_Vection.Net_Arabic, dbo.Due_Vection.LaveDate2, 
                         dbo.Due_Vection.EmpCode, dbo.VEmp.jname, dbo.VEmp.emp_pirth, dbo.VEmp.emp_state, dbo.VEmp.emp_kinde, dbo.VEmp.emp_add, dbo.VEmp.depart_name, dbo.VEmp.emp_jopdate, dbo.VEmp.StatusDate, 
                         dbo.VEmp.SecondName
FROM            dbo.Due_Vection INNER JOIN
                         dbo.Due_Vection_Items ON dbo.Due_Vection.ID = dbo.Due_Vection_Items.ID INNER JOIN
                         dbo.VEmp ON dbo.Due_Vection.EmpCode = dbo.VEmp.emp_code

GO


